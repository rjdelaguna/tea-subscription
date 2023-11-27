class CustomerSubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(Compiler.new(customer))
  end

  def create
    cs = CustomerSubscription.new(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    if cs.save
      render json: { success: "Subscription Created Successfully" }, status: 201
    else
      render json: { failure: "Subscription could not be added" }, status: 400
    end
  end

  def cancel
    cs = CustomerSubscription.where("customer_id=#{params[:customer_id]} AND subscription_id=#{params[:subscription_id]}")
    cs.update(status: 1)
    render json: { success: "Subscription Cancelled" }, status: 201
  end
end