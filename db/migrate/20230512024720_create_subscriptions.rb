class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :email, null: false
      t.string :preferences, array: true, default: []

      t.timestamps
    end
  end
end
