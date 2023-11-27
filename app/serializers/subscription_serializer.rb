class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :customer_id, :active, :cancelled
end