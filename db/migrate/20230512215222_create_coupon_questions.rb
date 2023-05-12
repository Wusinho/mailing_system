class CreateCouponQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_questions do |t|
      t.references :coupon_survey, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
