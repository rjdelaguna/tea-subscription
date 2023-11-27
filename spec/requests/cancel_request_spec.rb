require "rails_helper"

describe "cancels an existing subscription relationship and returns affirmation" do
  before :each do
    @customer = Customer.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@email.com", address: "123 Smith place")
    @tea = Tea.create!(title: "Tea 1", description: "First Tea", temperature: "120 degrees", brew_time: "5 mins")
    @tea_sub1 = @tea.subscriptions.create!(title: "Tier 1", price: "$5.00", frequency: "monthly")
    @tea_sub2 = @tea.subscriptions.create!(title: "Tier 2", price: "$2.00", frequency: "weekly")
  end
  
  it "returns positive message for successful request" do
    CustomerSubscription.create!(subscription_id: @tea_sub1.id, customer_id: @customer.id)
    sub = CustomerSubscription.create!(subscription_id: @tea_sub2.id, customer_id: @customer.id)

    expect(CustomerSubscription.find(sub.id).status).to eq("active")
    
    post "/customers/#{@customer.id}/#{@tea_sub2.id}/cancel"

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)
    expect(message).to be_a Hash
    expect(message.keys).to eq([:success])
    expect(message[:success]).to eq("Subscription Cancelled")
    expect(CustomerSubscription.find(sub.id).status).to eq("cancelled")
  end
end