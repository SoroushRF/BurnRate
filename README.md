<div align="center">

# 🔥 BurnRate

### **Real-Time Inventory Runway Intelligence**

*Empowering e-commerce sellers with actionable inventory insights—before it's too late.*

[![Ruby](https://img.shields.io/badge/Ruby-3.2+-CC342D?style=for-the-badge&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Rails](https://img.shields.io/badge/Rails-8.0.x-D30001?style=for-the-badge&logo=rubyonrails&logoColor=white)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15+-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Redis](https://img.shields.io/badge/Redis-7+-DC382D?style=for-the-badge&logo=redis&logoColor=white)](https://redis.io/)
[![GraphQL](https://img.shields.io/badge/GraphQL-API-E10098?style=for-the-badge&logo=graphql&logoColor=white)](https://graphql.org/)
[![GitHub Actions](https://img.shields.io/badge/CI-GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/features/actions)

<br />

<img src="https://img.shields.io/badge/Tests-23_Passing-brightgreen?style=flat-square" alt="23 Tests Passing" />
<img src="https://img.shields.io/badge/Test_Suites-7-blue?style=flat-square" alt="7 Test Suites" />
<img src="https://img.shields.io/badge/Coverage-Models_Services_Jobs-blueviolet?style=flat-square" alt="Coverage" />

</div>

---

## 📑 Table of Contents

- [🎯 Mission](#-mission)
- [✨ Key Features](#-key-features)
- [🛠 Tech Stack](#-tech-stack)
- [🧪 Testing Suites](#-testing-suites)
- [🚀 Getting Started](#-getting-started)
- [📖 Usage Guide](#-usage-guide)
- [🔌 GraphQL API](#-graphql-api)
- [🔧 Troubleshooting](#-troubleshooting)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)

---

## 🎯 Mission

<div align="center">

### **Stop Losing Sales. Start Predicting Them.**

</div>

Every day, **e-commerce sellers lose revenue** due to two critical failures:

| ❌ **Problem** | 💰 **Impact** |
|:---|:---|
| **Stockouts** | Lost sales, damaged rankings, disappointed customers |
| **Overstocking** | Tied-up capital, storage fees, dead inventory |

**BurnRate** bridges this gap by providing sellers with **real-time inventory runway intelligence**—the answer to one critical question:

> ### *"How many days until this product runs out?"*

---

### 💡 How BurnRate Helps Sellers

| Feature | Seller Benefit |
|:---|:---|
| 🔮 **30-Day Burn Rate Analysis** | Predicts stock depletion based on *actual* sales velocity |
| ⏱ **Real-Time Dashboard Updates** | See inventory changes *instantly*—no manual refresh |
| 🚦 **Status Indicators** | Critical (< 7 days), Warning (< 14 days), Healthy—at a glance |
| 📊 **GraphQL API** | Integrate runway data into your existing tools & automations |
| ⚡ **Background Processing** | Heavy calculations never slow down your experience |

**Result:** Sellers can **reorder at the perfect time**, maximize cash flow, and **never miss a sale**.

---

## ✨ Key Features

<table>
<tr>
<td width="50%">

### 📡 Real-Time Updates
Dashboard refreshes **automatically** via Turbo Streams when sales occur. No page reload needed.

</td>
<td width="50%">

### 📈 Intelligent Analytics
30-day rolling average ensures predictions adapt to **recent demand changes**.

</td>
</tr>
<tr>
<td width="50%">

### 🎨 Modern Dark UI
Glassmorphism design with status-based color coding for instant visual comprehension.

</td>
<td width="50%">

### 🔗 GraphQL API
Query products and runway data, or create sales logs via mutations.

</td>
</tr>
<tr>
<td width="50%">

### ⚙️ Background Jobs
Sidekiq handles burn rate calculations asynchronously for performance at scale.

</td>
<td width="50%">

### 🐳 Docker Ready
Ship anywhere with the included Dockerfile and Kamal deployment configuration.

</td>
</tr>
</table>

---

## 🛠 Tech Stack

<div align="center">

| Layer | Technology | Purpose |
|:---:|:---:|:---|
| **Framework** | ![Rails](https://img.shields.io/badge/Ruby_on_Rails-8.0-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) | Full-stack web framework with Hotwire |
| **Language** | ![Ruby](https://img.shields.io/badge/Ruby-3.2+-CC342D?style=for-the-badge&logo=ruby&logoColor=white) | Modern Ruby with YJIT support |
| **Database** | ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15+-4169E1?style=for-the-badge&logo=postgresql&logoColor=white) | Primary data store for products & sales |
| **Real-Time** | ![Turbo](https://img.shields.io/badge/Hotwire-Turbo_Streams-319795?style=for-the-badge&logo=hotwire&logoColor=white) ![ActionCable](https://img.shields.io/badge/ActionCable-WebSockets-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) | Live dashboard updates without JavaScript |
| **Background Jobs** | ![Sidekiq](https://img.shields.io/badge/Sidekiq-7.x-B1003E?style=for-the-badge&logo=sidekiq&logoColor=white) ![Redis](https://img.shields.io/badge/Redis-7+-FF4438?style=for-the-badge&logo=redis&logoColor=white) | Async burn rate calculations & caching |
| **API** | ![GraphQL](https://img.shields.io/badge/GraphQL-API-E10098?style=for-the-badge&logo=graphql&logoColor=white) | Flexible API for external integrations |
| **Styling** | ![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-3.x-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white) ![CSS3](https://img.shields.io/badge/CSS3-Glassmorphism-1572B6?style=for-the-badge&logo=css3&logoColor=white) | Modern dark UI with glassy effects |
| **Deployment** | ![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![Kamal](https://img.shields.io/badge/Kamal-Deploy-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) | Container-based deployment anywhere |
| **CI/CD** | ![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-2088FF?style=for-the-badge&logo=github-actions&logoColor=white) | Automated testing, linting & security scans |
| **Testing** | ![RSpec](https://img.shields.io/badge/RSpec-Tests-CC342D?style=for-the-badge&logo=ruby&logoColor=white) ![Capybara](https://img.shields.io/badge/Capybara-E2E-6A4C93?style=for-the-badge&logo=ruby&logoColor=white) | BDD testing with 23 passing specs |

</div>

---

## 🧪 Testing Suites

BurnRate maintains a comprehensive test suite to ensure reliability and confidence in deployments.

<div align="center">

| 📊 **Metric** | **Value** |
|:---:|:---:|
| **Total Tests** | **23** |
| **Test Suites** | **7** |
| **Passing** | ✅ **23 / 23** |
| **Coverage Areas** | Models, Services, Jobs, Requests, System |

</div>

### 📁 Test Suite Breakdown

| Suite | File | Tests | Description |
|:---|:---|:---:|:---|
| **Models** | `spec/models/product_spec.rb` | 6 | Validations, associations, factory tests |
| **Models** | `spec/models/sales_log_spec.rb` | 5 | Relationship & validation specs |
| **Services** | `spec/services/burn_rate_service_spec.rb` | 6 | Core burn rate calculation logic |
| **Jobs** | `spec/jobs/calculate_burn_rate_job_spec.rb` | 2 | Background job enqueueing & execution |
| **Requests** | `spec/requests/dashboard_spec.rb` | 1 | Dashboard HTTP response tests |
| **Requests** | `spec/requests/graphql_spec.rb` | 2 | GraphQL queries & mutations |
| **System** | `spec/system/real_time_dashboard_spec.rb` | 1 | End-to-end Turbo Stream testing* |

> *System test requires headless Chrome and is skipped in minimal CI environments.

### 🧰 Testing Stack

- **RSpec** - BDD testing framework
- **FactoryBot** - Test data generation
- **Shoulda Matchers** - One-liner tests for common Rails patterns
- **Capybara** - Browser simulation for system tests
- **Database Cleaner** - Isolated test environments

### ▶️ Running Tests

```bash
# Run all tests
bundle exec rspec

# Run specific suite
bundle exec rspec spec/models/
bundle exec rspec spec/services/

# Run with documentation format
bundle exec rspec --format documentation
```

---

## 🚀 Getting Started

### Prerequisites

| Requirement | Version | Check Command |
|:---|:---:|:---|
| Ruby | 3.2+ | `ruby -v` |
| PostgreSQL | 12+ | `psql --version` |
| Redis | 6+ | `redis-server --version` |
| Bundler | 2.4+ | `bundler -v` |

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/SoroushRF/BurnRate.git
cd BurnRate

# 2. Install dependencies
bundle install

# 3. Setup database
bin/rails db:create db:migrate

# 4. Seed sample data (optional)
bin/rails db:seed

# 5. Verify installation
bundle exec rspec
```

### Running the Application

You need **three** processes running:

```bash
# Terminal 1: Redis Server
redis-server

# Terminal 2: Rails Server
bin/rails server

# Terminal 3: Sidekiq (for background jobs)
bundle exec sidekiq
```

Or use the included Procfile:

```bash
# Using Foreman
gem install foreman
foreman start -f Procfile.dev
```

Access the dashboard at: **http://localhost:3000**

---

## 📖 Usage Guide

### Testing Real-Time Updates

1. **Open the dashboard** in your browser at `http://localhost:3000`

2. **Open Rails console** in a separate terminal:
   ```bash
   bin/rails console
   ```

3. **Create a sale:**
   ```ruby
   SalesLog.create!(product: Product.first, quantity: 10, sold_at: Time.current)
   ```

4. **Watch the dashboard**—numbers update instantly without refresh! 🎉

### Understanding Runway Status

| Status | Runway | Color | Action |
|:---|:---:|:---:|:---|
| 🟢 **Healthy** | ≥ 14 days | Green | No action needed |
| 🟡 **Warning** | 7-14 days | Yellow | Consider reordering |
| 🔴 **Critical** | < 7 days | Red | Reorder immediately! |
| ⚪ **No Data** | ∞ | Gray | No sales history yet |

---

## 🔌 GraphQL API

Access the interactive GraphQL playground at: **http://localhost:3000/graphiql**

### Query Products

```graphql
query {
  products {
    id
    name
    sku
    currentStock
    runwayDays
    formattedRunway
  }
}
```

### Create Sales Log

```graphql
mutation {
  createSalesLog(input: { productId: "1", quantity: 5 }) {
    product {
      currentStock
      runwayDays
    }
    errors
  }
}
```

---

## 🔧 Troubleshooting

<details>
<summary><b>❌ "Redis connection failed"</b></summary>

Ensure Redis server is running:
```bash
redis-server
# or
redis-cli ping  # Should return "PONG"
```
</details>

<details>
<summary><b>❌ Dashboard not updating in real-time</b></summary>

1. Check browser console for `🚀 Turbo Loaded` message
2. Verify Redis is running
3. For WSL/local dev, ensure `config/environments/development.rb` has:
   ```ruby
   config.action_cable.disable_request_forgery_protection = true
   ```
</details>

<details>
<summary><b>❌ Sidekiq not processing jobs</b></summary>

```bash
# Check Sidekiq is running
bundle exec sidekiq

# Verify Redis connection in console
Redis.new.ping  # Should return "PONG"
```
</details>

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Run tests (`bundle exec rspec`)
4. Commit your changes (`git commit -m 'Add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

---

## 📜 License

This project is open source and available under the [MIT License](LICENSE).

---

<div align="center">

**Made with 🔥 by [SoroushRF](https://github.com/SoroushRF)**

*Stop guessing. Start predicting.*

</div>
