class SalesLog < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :sold_at, presence: true

  # After a sale is logged, trigger the background job to recalculate and broadcast
  after_create_commit :recalculate_product_burn_rate

  private

  def recalculate_product_burn_rate
    CalculateBurnRateJob.perform_later(product_id)
  end
end
