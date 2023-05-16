require 'rails_helper'

RSpec.describe SurveyAnswer, type: :model do
  describe SurveyAnswer do
    context 'SurveyAnswer associations' do
      it do
        should belong_to(:survey)
        should belong_to(:question)
      end
    end
    context 'validations' do
      it { should validate_presence_of(:answer) }
    end
  end
end
