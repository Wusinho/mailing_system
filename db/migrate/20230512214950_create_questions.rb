class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.string :alternatives, array: true, default: []

      t.timestamps
    end
  end
end
