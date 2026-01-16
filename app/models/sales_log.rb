class SalesLog < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :sold_at, presence: true
end
