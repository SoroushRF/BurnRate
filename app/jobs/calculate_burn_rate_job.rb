class CalculateBurnRateJob < ApplicationJob
  queue_as :critical

  def perform(product_id)
    product = Product.find(product_id)
    
    # Trigger dashboard refresh via Turbo Streams
    # This broadcasts the updated content to all connected clients
    Turbo::StreamsChannel.broadcast_replace_to(
      "dashboard",
      target: "dashboard-content",
      partial: "dashboard/content",
      locals: { products: Product.all }
    )
    
    Rails.logger.info "[BurnRate] Updated dashboard for product ##{product_id}"
  end
end
