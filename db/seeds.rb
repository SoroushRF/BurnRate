# Clear existing data
puts "Cleaning database..."
SalesLog.destroy_all
Product.destroy_all

puts "Seeding BurnRate v1.2 Personas..."

# Persona A: The Baker (Steady Seller)
# 100 units, ~5 sales/day for 30 days. High predictability.
baker = Product.create!(name: "Sourdough Loaf (The Baker)", sku: "BAKE-001", current_stock: 100)
30.times do |i|
  SalesLog.create!(product: baker, quantity: 5, sold_at: i.days.ago)
end

# Persona B: The Influencer (Viral Trend)
# 500 units. 2/day for 20 days, then 50/day for 10 days. 
influencer = Product.create!(name: "Viral Glow Serum (The Influencer)", sku: "GLOW-999", current_stock: 500)
10.times do |i| # Recent 10 days: Spike
  SalesLog.create!(product: influencer, quantity: 50, sold_at: i.days.ago)
end
20.times do |i| # Prior 20 days: Slow
  SalesLog.create!(product: influencer, quantity: 2, sold_at: (i + 10).days.ago)
end

# Persona C: The Boutique (Risk Level)
# High sales (10/day), but extremely low stock (12 units left).
boutique = Product.create!(name: "Silk Scarf (The Boutique)", sku: "BOUT-888", current_stock: 12)
30.times do |i|
  SalesLog.create!(product: boutique, quantity: 10, sold_at: i.days.ago)
end

# Persona D: The Ghost (Zero Velocity)
# 10 units in stock, but zero sales in 30 days.
ghost = Product.create!(name: "Dusty Antique Clock (The Ghost)", sku: "GHOST-000", current_stock: 10)
# No SalesLogs created

# Persona E: The Jeweler (Low Velocity, High Value)
# 3 units in stock, 1 unit sold every 10 days (3 sales total).
jeweler = Product.create!(name: "Diamond Studs (The Jeweler)", sku: "JEWEL-777", current_stock: 3)
[5, 15, 25].each do |i|
  SalesLog.create!(product: jeweler, quantity: 1, sold_at: i.days.ago)
end

# Persona F: The Hibernator (Seasonal Drop-off)
# Sold 10/day for 20 days (days 30 to 10 ago), then 0/day for last 10 days.
hibernator = Product.create!(name: "Winter Parka (The Hibernator)", sku: "SEASON-123", current_stock: 200)
20.times do |i|
  SalesLog.create!(product: hibernator, quantity: 10, sold_at: (i + 10).days.ago)
end
# No SalesLogs for the last 10 days

puts "Seeding complete!"
puts "Created #{Product.count} products and #{SalesLog.count} sales logs."
