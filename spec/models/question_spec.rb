require 'rails_helper'

RSpec.describe Question, type: :model do
  describe Question do
    context 'validations' do
      it 'should validate presence' do
        should validate_presence_of(:question)
        should validate_presence_of(:alternatives)
        should validate_presence_of(:category_type)
        should validate_presence_of(:question_type)
      end
    end
  end
end
