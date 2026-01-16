# 🔥 BurnRate

A real-time inventory runway dashboard built with **Ruby on Rails 8**. It helps businesses track product burn rates and visualize when stock will run out.

## ✨ Features

- **Real-Time Dashboard**: Updates instantly via **Turbo Streams** when sales occur.
- **Inventory Runway Calculation**: Automatically calculates "days remaining" based on 30-day sales history.
- **Status Indicators**: Visual cues for items that are Critical (< 7 days), Warning (< 14 days), or Healthy.
- **Background Jobs**: Calculations performed asynchronously using Sidekiq.

## 🛠 Tech Stack

- **Framework**: Rails 8.0.4
- **Database**: PostgreSQL
- **Real-Time**: ActionCable + Turbo Streams (Redis adapter)
- **Styling**: Custom CSS (Dark Theme, Glassmorphism)
- **Jobs**: Sidekiq + Redis

## 🚀 Getting Started

### Prerequisites

- **Ruby** 3.2+
- **PostgreSQL**
- **Redis** (Required for ActionCable & Sidekiq)

### Installation

1. **Clone the repo**

   ```bash
   git clone https://github.com/SoroushRF/BurnRate.git
   cd BurnRate
   ```

2. **Install Gems**

   ```bash
   bundle install
   ```

3. **Setup Database**

   ```bash
   bin/rails db:create db:migrate
   bin/rails db:seed  # Populates sample products
   ```

4. **Verify Tests**

   ```bash
   bundle exec rspec
   ```

### Running the Application

You need **three** processes running (or use a Procfile):

1. **Redis Server**

   ```bash
   redis-server
   ```

2. **Rails Server**

   ```bash
   bin/rails server
   ```

3. **Sidekiq (Optional for background jobs, but Dashboard updates happen instantly)**

   ```bash
   bundle exec sidekiq
   ```

Visit `http://localhost:3000` to see the dashboard.

## 🧪 How to Test Real-Time Updates

1. Open the dashboard in your browser.
2. Open a terminal and enter the Rails console:

   ```bash
   bin/rails console
   ```

3. Create a sale for a product:

   ```ruby
   SalesLog.create!(product: Product.first, quantity: 10, sold_at: Time.current)
   ```

4. Watch the browser! The numbers for that product will update instantly without a refresh.

## 🔧 Troubleshooting
 
### "Redis connection failed"

- Ensure `redis-server` is running.
- If using multiple environments, check `config/cable.yml`.

### Dashboard not updating?

- Check browser console for "🚀 Turbo Loaded".
- Ensure you have the `redis` gem installed (`bundle add redis`).
- Ensure `config.action_cable.disable_request_forgery_protection = true` in development if running locally/WSL.
