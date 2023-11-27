require "rails_helper"

describe "creates new subscription relationship and returns affirmation" do
  before :each do
    @customer = Customer.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@email.com", address: "123 Smith place")
    @tea = Tea.create!(title: "Tea 1", description: "First Tea", temperature: "120 degrees", brew_time: "5 mins")
    @tea_sub1 = @tea.subscriptions.create!(title: "Tier 1", price: "$5.00", frequency: "monthly")
    @tea_sub2 = @tea.subscriptions.create!(title: "Tier 2", price: "$2.00", frequency: "weekly")
    @tea_sub3 = @tea.subscriptions.create!(title: "Tier 3", price: "$10.00", frequency: "yearly")
    CustomerSubscription.create!(subscription_id: @tea_sub1.id, customer_id: @customer.id, status: 1)
    CustomerSubscription.create!(subscription_id: @tea_sub2.id, customer_id: @customer.id)
    @comp = Compiler.new(@customer)
  end
  
  it "returns positive message for successful request" do
    
    post "/customers/#{@customer.id}/#{@tea_sub3.id}/create"

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)
    expect(message).to be_a Hash
    expect(message.keys).to eq([:success])
    expect(message[:success]).to eq("Subscription Created Successfully")
  end
  
  it "returns negative message for failed request" do
    
    post "/customers/#{@customer.id}/0/create"

    expect(response).not_to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:failure])
    expect(message[:failure]).to eq("Subscription could not be added")
  end
end