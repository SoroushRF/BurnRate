require 'rails_helper'

RSpec.describe 'Real-Time Dashboard', type: :system, js: true do
  before do
    skip "Skipping system test: Headless Chrome is not installed in this WSL environment."
    driven_by(:selenium, using: :headless_chrome)
  end

  let!(:product) { create(:product, name: "Test Product", current_stock: 100) }

  it 'updates the dashboard automatically when a sale is logged' do
    # 1. Visit the dashboard
    visit root_path
    
    # Verify initial state
    expect(page).to have_content("Test Product")
    expect(page).to have_content("100") # Stock
    
    # 2. Open a new window to simulate a backend event (or just use the same window context)
    # We will invoke the creation in a separate thread/process simulation via the main thread
    
    # Log a sale directly in the DB
    # The callback in SalesLog will trigger the Turbo Stream broadcast
    SalesLog.create!(product: product, quantity: 10, sold_at: Time.current)
    
    # 3. Verify the update happens on the page WITHOUT refresh
    # The stock should drop to 90
    expect(page).to have_content("90") 
    
    # And we check that we got the "Turbo Stream" update by checking the DOM
    # (The dashboard-content ID should still presumably exist if we used update_to correctly)
    expect(page).to have_selector("#dashboard-content")
  end
end
