require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_many(:sales_logs).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sku) }
    it { should validate_uniqueness_of(:sku) }
    it { should validate_presence_of(:current_stock) }
    it { should validate_numericality_of(:current_stock).is_greater_than_or_equal_to(0) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:product)).to be_valid
    end
  end
end
