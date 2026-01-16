require 'rails_helper'

RSpec.describe SalesLog, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
    it { should validate_presence_of(:sold_at) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:sales_log)).to be_valid
    end
  end
end
