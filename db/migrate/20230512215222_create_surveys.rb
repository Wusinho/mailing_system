class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.references :subscription, null: false, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
