# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :sku, String
    field :current_stock, Integer
    field :runway_days, Float, null: true
    field :formatted_runway, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def runway_days
      BurnRateService.new(object).days_of_runway
    end

    def formatted_runway
      BurnRateService.new(object).formatted_runway
    end
  end
end
