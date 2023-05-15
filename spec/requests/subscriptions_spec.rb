require 'rails_helper'
#
# spec/controllers/subscriptions_controller_spec.rb

RSpec.describe SubscriptionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        { subscription: FactoryBot.attributes_for(:subscription) }
      end

      it 'creates a new subscription' do
        expect {
          post :create, params: valid_params
        }.to change(Subscription, :count).by(1)
      end

      it 'renders the turbo_stream replace response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
        # expect(response.body).to include('subscription_form')
        # expect(response.body).to include('surveys/survey_link')
        # Add any additional expectations for the turbo_stream response
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        { subscription: FactoryBot.attributes_for(:subscription, email: '') }
      end

      # it 'does not create a new subscription' do
      #   expect {
      #     post :create, params: invalid_params
      #   }.not_to change(Subscription, :count)
      # end

      # it 'renders the error message' do
      #   post :create, params: invalid_params
      #   expect(response).to have_http_status(:unprocessable_entity)
      #   expect(response.body).to include('error message')
      #   # Add any additional expectations for the error message
      # end
    end
  end
end
