class CalculateBurnRateJob < ApplicationJob
  queue_as :critical

  def perform(product_id)
    product = Product.find(product_id)
    service = BurnRateService.new(product)
    
    # Recalculate and broadcast to Turbo Streams
    # Using the formatted_runway for the UI update
    ActionCable.server.broadcast(
      "product_#{product.id}_runway",
      {
        runway: service.formatted_runway,
        daily_burn_rate: service.daily_burn_rate
      }
    )
    
    # Also broadcast for the "Urgency" dashboard update
    # This will be handled by Turbo Stream in Phase 5
    # For now, we leave the infrastructure ready
  end
end
