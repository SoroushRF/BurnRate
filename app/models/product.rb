class Product < ApplicationRecord
  has_many :sales_logs, dependent: :destroy

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :current_stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
