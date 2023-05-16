# spec/controllers/surveys_controller_spec.rb
require 'rails_helper'

RSpec.describe SurveysController, type: :request do
  describe 'POST #create' do
    let(:subscription) { create(:subscription) }
    let(:subscription2) { create(:subscription) }
    let(:valid_attributes) { { subscription_id: subscription.id, category: 'coupon_subscription' } }
    let(:invalid_attributes) { { subscription_id: subscription2.id, category: '' } }

    context 'with valid attributes' do
      it 'creates a new survey' do
        expect {
          post surveys_path, params: valid_attributes
        }.to change(Survey, :count).by(1)
      end

      it 'redirects to the survey show page' do
        post surveys_path, params: valid_attributes
        expect(response).to redirect_to(survey_path(Survey.last))
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new survey' do
        expect {
          post surveys_path, params: invalid_attributes
        }.not_to change(Survey, :count)
      end

      it 'renders the turbo error message' do
        post surveys_path, params: invalid_attributes
        expect(response.body).to render_template('shared/_error_message')
      end
    end
  end

  describe 'PATCH #update' do
    let!(:survey) { create(:survey) }
    let!(:valid_attributes) { { completed: true } }
    let!(:q1) { create(:question) }
    let!(:q2) { create(:question) }
    let!(:sq1) { create(:survey_question, survey: survey, question: q1) }
    let!(:sq2) { create(:survey_question, survey: survey, question: q2) }


    context 'with valid attributes' do
      let(:valid_survey) do
        {
          completed: true,
          survey_answers_attributes: {
            '0' => { question_id: q1.id, answer: 'Updated answer 1' },
            '1' => { question_id: q2.id, answer: 'Updated answer 2' },
        }
      }
      end

      let(:invalid_survey) do
        {
          completed: true,
          survey_answers_attributes: {
            '0' => { question_id: q1.id, answer: '' },
            '1' => { question_id: q2.id, answer: '' },
          }
        }
      end

      it 'updates the survey' do
        patch survey_path(locale: I18n.locale.to_s, id: survey.id), params: { id: survey.id, survey: valid_survey }, xhr: true
        expect(Survey.last.completed).to eq(true)
        expect(response).to redirect_to(root_path)
      end

      it 'does not update when passing empty answers' do
        patch survey_path(locale: I18n.locale.to_s, id: survey.id), params: { id: survey.id, survey: invalid_survey }, xhr: true
        expect(Survey.last.completed).to eq(false)
        expect(response.body).to render_template('shared/_error_message')
      end
    end
  end
end

