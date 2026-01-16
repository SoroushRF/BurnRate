# frozen_string_literal: true

module Mutations
  class CreateSalesLog < BaseMutation
    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    argument :product_id, ID, required: true
    argument :quantity, Integer, required: true

    def resolve(product_id:, quantity:)
      product = Product.find(product_id)
      sales_log = product.sales_logs.build(quantity: quantity, sold_at: Time.current)

      if sales_log.save
        {
          product: product,
          errors: []
        }
      else
        {
          product: nil,
          errors: sales_log.errors.full_messages
        }
      end
    end
  end
end
