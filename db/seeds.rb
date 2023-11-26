# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tea1 = Tea.create!(title: "Tea 1", description: "First Tea", temperature: "120 degrees", brew_time: "5 mins")
tea2 = Tea.create!(title: "Tea 2", description: "Second Tea", temperature: "130 degrees", brew_time: "6 mins")
tea3 = Tea.create!(title: "Tea 3", description: "Third Tea", temperature: "140 degrees", brew_time: "7 mins")
tea1_sub1 = tea1.subscriptions.create!(title: "Tier 1", price: "$5.00", frequency: "monthly")
tea1_sub2 = tea1.subscriptions.create!(title: "Tier 2", price: "$2.00", frequency: "weekly")
tea1_sub3 = tea1.subscriptions.create!(title: "Tier 3", price: "$10.00", frequency: "yearly")
tea2_sub1 = tea2.subscriptions.create!(title: "Tier 1", price: "$4.00", frequency: "monthly")
tea2_sub2 = tea2.subscriptions.create!(title: "Tier 2", price: "$1.00", frequency: "weekly")
tea2_sub3 = tea2.subscriptions.create!(title: "Tier 3", price: "$9.00", frequency: "yearly")
tea3_sub1 = tea3.subscriptions.create!(title: "Tier 1", price: "$6.00", frequency: "monthly")
tea3_sub2 = tea3.subscriptions.create!(title: "Tier 2", price: "$3.00", frequency: "weekly")
tea3_sub3 = tea3.subscriptions.create!(title: "Tier 3", price: "$11.00", frequency: "yearly")
customer1 = Customer.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@email.com", address: "123 Smith place")
customer2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", address: "123 Doe place")
customer3 = Customer.create!(first_name: "Fred", last_name: "Claus", email: "fredclaus@email.com", address: "123 Claus place")
CustomerSubscription.create!(subscription_id: tea1_sub1.id, customer_id: customer1.id, status: 1)
CustomerSubscription.create!(subscription_id: tea2_sub2.id, customer_id: customer1.id)
CustomerSubscription.create!(subscription_id: tea3_sub3.id, customer_id: customer1.id)
CustomerSubscription.create!(subscription_id: tea1_sub2.id, customer_id: customer2.id)
CustomerSubscription.create!(subscription_id: tea2_sub3.id, customer_id: customer2.id, status: 1)
CustomerSubscription.create!(subscription_id: tea3_sub1.id, customer_id: customer2.id)
CustomerSubscription.create!(subscription_id: tea1_sub3.id, customer_id: customer3.id)
CustomerSubscription.create!(subscription_id: tea2_sub1.id, customer_id: customer3.id)
CustomerSubscription.create!(subscription_id: tea3_sub2.id, customer_id: customer3.id, status: 1)