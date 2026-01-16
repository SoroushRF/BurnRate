require 'rails_helper'

RSpec.describe CalculateBurnRateJob, type: :job do
  include ActiveJob::TestHelper

  let(:product) { create(:product) }

  it 'enqueues the job when a SalesLog is created' do
    expect {
      create(:sales_log, product: product)
    }.to enqueue_job(CalculateBurnRateJob).with(product.id)
  end

  it 'performs the calculation and broadcasts to ActionCable' do
    # 30 sales of 10 units = 10 units/day burn rate
    create_list(:sales_log, 30, product: product, quantity: 10, sold_at: 1.day.ago)
    
    expect(Turbo::StreamsChannel).to receive(:broadcast_update_to).with(
      "dashboard",
      target: "dashboard-content",
      partial: "dashboard/content",
      locals: hash_including(products: kind_of(ActiveRecord::Relation))
    )

    CalculateBurnRateJob.perform_now(product.id)
  end
end
