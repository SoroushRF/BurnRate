class BurnRateService
  def initialize(product)
    @product = product
  end

  # Returns the average units sold per day over the last 30 days
  def daily_burn_rate
    total_sales = @product.sales_logs
                          .where(sold_at: 30.days.ago..Time.current)
                          .sum(:quantity)
    
    total_sales / 30.0
  end

  # Returns how many days until the product hits 0 stock
  def days_of_runway
    burn_rate = daily_burn_rate
    
    return Float::INFINITY if burn_rate.zero?
    
    (@product.current_stock / burn_rate).round(1)
  end

  # Helper for the UI to display "Infinity" as a merchant-friendly string
  def formatted_runway
    runway = days_of_runway
    runway == Float::INFINITY ? "No Sales Data" : "#{runway} Days"
  end
end
