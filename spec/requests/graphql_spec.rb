require 'rails_helper'

RSpec.describe 'GraphQL API', type: :request do
  describe 'Query: products' do
    it 'returns all products with runway data' do
      product = create(:product, name: 'Test Loaf', current_stock: 100)
      create_list(:sales_log, 30, product: product, quantity: 10, sold_at: 1.day.ago)

      query = <<~GQL
        query {
          products {
            name
            currentStock
            runwayDays
            formattedRunway
          }
        }
      GQL

      post '/graphql', params: { query: query }

      json = JSON.parse(response.body)
      data = json['data']['products'].first

      expect(data['name']).to eq('Test Loaf')
      expect(data['runwayDays']).to eq(10.0)
      expect(data['formattedRunway']).to eq('10.0 Days')
    end
  end

  describe 'Mutation: createSalesLog' do
    it 'creates a new sales log and returns the updated product' do
      product = create(:product, current_stock: 50)

      mutation = <<~GQL
        mutation($productId: ID!, $quantity: Int!) {
          createSalesLog(input: { productId: $productId, quantity: $quantity }) {
            product {
              currentStock
            }
            errors
          }
        }
      GQL

      variables = {
        productId: product.id,
        quantity: 5
      }

      expect {
        post '/graphql', params: { query: mutation, variables: variables }, as: :json
      }.to change(SalesLog, :count).by(1)

      json = JSON.parse(response.body)
      data = json['data']['createSalesLog']

      expect(data['errors']).to be_empty
      expect(data['product']['currentStock']).to eq(50) # Stock hasn't changed, only a log was added
    end
  end
end
