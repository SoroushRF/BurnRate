class SalesLog < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :sold_at, presence: true

  # After a sale is logged, trigger updates
  after_create_commit :trigger_dashboard_update

  private

    def trigger_dashboard_update
    # Broadcast UPDATE instead of REPLACE so we keep the container ID
    Turbo::StreamsChannel.broadcast_update_to(
      "dashboard",
      target: "dashboard-content",
      partial: "dashboard/content",
      locals: { products: Product.all }
    )
    
    # Also queue the job for any additional processing
    CalculateBurnRateJob.perform_later(product_id)
  end
end
