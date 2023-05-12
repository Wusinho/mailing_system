class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question_type, null: false
      t.string :question, null: false
      t.string :alternatives, array: true, default: []
      t.string :category_type, null:false

      t.timestamps
    end
  end
end
