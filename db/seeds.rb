require 'faker'

puts "Cleaning database"
Order.destroy_all


puts "Generate 30 orders"
i = 0
30.times do
  Order.create!(
    name: Faker::Beer.name,
    client_name: Faker::Name.name,
    order_date: Faker::Date.between(from: '2022-03-23', to: '2022-09-25'),
    total_amount: (200..1500).to_a.sample
  )
  i += 1
  puts "Create order n°#{i}"
end

puts "Done"
