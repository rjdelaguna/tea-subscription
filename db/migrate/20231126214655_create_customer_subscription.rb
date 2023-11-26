class CreateCustomerSubscription < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_subscriptions do |t|
      t.integer :status, default: 0
      t.references :subscription, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
