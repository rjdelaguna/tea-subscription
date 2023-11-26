class CreateSubscription < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :title, null: false
      t.string :price, null: false
      t.string :frequency, null: false

      t.timestamps
    end
  end
end
