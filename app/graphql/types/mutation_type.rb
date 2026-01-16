# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_sales_log, mutation: Mutations::CreateSalesLog
  end
end
