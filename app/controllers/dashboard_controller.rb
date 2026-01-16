class DashboardController < ApplicationController
  def index
    @products = Product.all.sort_by { |p| BurnRateService.new(p).days_of_runway }
  end
end
