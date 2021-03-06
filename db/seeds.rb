# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Admin', email: 'admin@grosirobat.com', password: 'secret', password_confirmation: 'secret')

10.times do |index|
  randomize = Random.new
  Unit.create!(name: "Unit #{index}", value: randomize.rand(1...10))
end

10.times do |index|
  unit = Unit.all.shuffle.first
  Product.create!(name: "Product #{index}", unit_id: unit.id, price: 10000)
end

10.times do |index|
  randomize  = Random.new
  order = Order.create!(customer_name: "Customer #{index}", amount_paid: 15000, is_draft: randomize.rand(0...1))

  2.times do |index|
    product = Product.all.shuffle.first
    order.line_items.create!(product_id: product.id, quantity: randomize.rand(1...10))
  end
end
