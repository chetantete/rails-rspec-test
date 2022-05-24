# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Customers
100.times do
  Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    address: Faker::Address.unique.full_address
  )
end

# Products
10.times do
  Product.create!(
    name: Faker::Coffee.unique.variety,
    price: (10..50).to_a.sample
  )
end

# Orders
(-7..7).each do |advance_day|
  delivery_time = DateTime.current + advance_day.days
  [*15..25].sample.times do
    Order.create!(
      delivery_time: delivery_time.change(hour: [*Order::FIRST_DELIVERY_HOUR..Order::LAST_DELIVERY_HOUR].sample),
      customer: Customer.find(Customer.pluck(:id).sample),
      product: Product.find(Product.pluck(:id).sample),
      status: delivery_time > DateTime.current ? :todo : :delivered
    )
  end
end

# Big order day
delivery_time = DateTime.current + 8.days
3_000.times do
  Order.create!(
    delivery_time: delivery_time.change(hour: [*Order::FIRST_DELIVERY_HOUR..Order::LAST_DELIVERY_HOUR].sample),
    customer: Customer.find(Customer.pluck(:id).sample),
    product: Product.find(Product.pluck(:id).sample),
    status: :todo
  )
end
