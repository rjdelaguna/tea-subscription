class Compiler
  attr_reader :id, :customer_id, :active, :cancelled
  
  def initialize(customer)
    @id = nil
    @active = []
    @cancelled = []
    compile(customer)
  end

  def compile(customer)
    @customer_id = customer.id
    subscriptions = customer.subscriptions
    subscriptions.each do |sub|
      if customer.customer_subscriptions.any? {|s| s.subscription_id == sub.id && s.status == "active"}
        @active << sub
      elsif customer.customer_subscriptions.any? {|s| s.subscription_id == sub.id && s.status == "cancelled"}
        @cancelled << sub
      end
    end
  end

end