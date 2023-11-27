require "rails_helper"

describe "Return index of subscriptions for a customer" do
  before :each do
    @customer = Customer.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@email.com", address: "123 Smith place")
    @tea = Tea.create!(title: "Tea 1", description: "First Tea", temperature: "120 degrees", brew_time: "5 mins")
    @tea_sub1 = @tea.subscriptions.create!(title: "Tier 1", price: "$5.00", frequency: "monthly")
    @tea_sub2 = @tea.subscriptions.create!(title: "Tier 2", price: "$2.00", frequency: "weekly")
    @tea_sub3 = @tea.subscriptions.create!(title: "Tier 3", price: "$10.00", frequency: "yearly")
    CustomerSubscription.create!(subscription_id: @tea_sub1.id, customer_id: @customer.id, status: 1)
    CustomerSubscription.create!(subscription_id: @tea_sub2.id, customer_id: @customer.id)
    CustomerSubscription.create!(subscription_id: @tea_sub3.id, customer_id: @customer.id)
    @comp = Compiler.new(@customer)
  end
  
  it "returns all the favorites for a user" do
    
    get "/customers/#{@customer.id}/customer_subscriptions"

    expect(response).to be_successful

    subs = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(subs).to be_an Hash
    expect(subs.keys).to eq([:id, :type, :attributes])
    expect(subs[:id]).to be nil
    expect(subs[:type]).to eq("subscription")
    expect(subs[:attributes]).to be_a Hash
    expect(subs[:attributes].keys).to eq([:id, :customer_id, :active, :cancelled])
    expect(subs[:attributes][:id]).to be nil
    expect(subs[:attributes][:customer_id]).to be_a Integer
    expect(subs[:attributes][:active]).to be_an Array
    expect(subs[:attributes][:cancelled]).to be_an Array
  end
end