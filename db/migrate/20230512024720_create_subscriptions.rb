class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :email, null: false
      t.integer :preferences, null: false

      t.timestamps
    end
  end
end
