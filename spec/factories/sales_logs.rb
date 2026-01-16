FactoryBot.define do
  factory :sales_log do
    product
    quantity { 5 }
    sold_at { Time.current }
  end
end
