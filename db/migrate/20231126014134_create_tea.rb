class CreateTea < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :temperature, null: false
      t.string :brew_time, null: false

      t.timestamps
    end
  end
end
