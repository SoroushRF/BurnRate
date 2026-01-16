require 'rails_helper'

RSpec.describe BurnRateService do
  let(:product) { create(:product, current_stock: 100) }
  let(:service) { BurnRateService.new(product) }

  describe '#daily_burn_rate' do
    it 'calculates the 30-day average correctly' do
      # 300 units sold over 30 days = 10 units/day
      create_list(:sales_log, 30, product: product, quantity: 10, sold_at: 1.day.ago)
      
      expect(service.daily_burn_rate).to eq(10.0)
    end

    it 'ignores sales older than 30 days' do
      # 10 units sold today
      create(:sales_log, product: product, quantity: 10, sold_at: Time.current)
      # 100 units sold 31 days ago (should be ignored)
      create(:sales_log, product: product, quantity: 100, sold_at: 31.days.ago)
      
      # 10 / 30 = 0.333...
      expect(service.daily_burn_rate).to be_within(0.01).of(0.33)
    end
  end

  describe '#days_of_runway' do
    it 'calculates correct runway days' do
      # 10 units per day burn rate
      create_list(:sales_log, 30, product: product, quantity: 10, sold_at: 1.day.ago)
      # 100 on hand / 10 per day = 10 days
      expect(service.days_of_runway).to eq(10.0)
    end

    it 'returns Infinity for zero sales' do
      expect(service.days_of_runway).to eq(Float::INFINITY)
    end
  end

  describe '#formatted_runway' do
    it 'returns merchant-friendly string for infinity' do
      expect(service.formatted_runway).to eq("No Sales Data")
    end

    it 'returns days string for normal runway' do
      create_list(:sales_log, 30, product: product, quantity: 10, sold_at: 1.day.ago)
      expect(service.formatted_runway).to eq("10.0 Days")
    end
  end
end
