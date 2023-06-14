class CreateSurveyAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_answers do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :answer, null: false
      t.string :lang, null: false

      t.timestamps
    end
  end
end
