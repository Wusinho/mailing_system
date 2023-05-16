require 'rails_helper'

RSpec.describe SubscriptionsController, type: :request do
  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:subscription) }
      let(:valid_attributes2) { attributes_for(:subscription) }

      it 'saves the new subscription' do
        expect {
          post subscriptions_path, params: { subscription: valid_attributes }
        }.to change(Subscription, :count).by(1)
      end

      it 'sends a subscription email' do
        expect {
          post subscriptions_path, params: { subscription: valid_attributes }
        }.to have_enqueued_mail(SubscriptionMailer)
      end

      it 'renders the turbo stream response' do
        post subscriptions_path, params: { subscription: valid_attributes2 }, xhr: true
        # expect(response).to have_http_status(:ok)
        # expect(response.body).to include('"<turbo-stream action=\"replace\" target=\"subscription_form\"><template></template></turbo-stream>"')
        expect(response.body).to render_template('surveys/_survey_link')
      end
    end

    # context 'with invalid attributes' do
    #   let(:invalid_attributes) { attributes_for(:subscription, email: nil) }
    #
    #   it 'does not save the new subscription' do
    #     expect {
    #       post :create, params: { subscription: invalid_attributes }
    #     }.not_to change(Subscription, :count)
    #   end
    #
    #   it 'renders the turbo error message' do
    #     post :create, params: { subscription: invalid_attributes }
    #     expect(response).to have_http_status(:unprocessable_entity)
    #     expect(response.body).to include('Subscription could not be saved')
    #   end
    # end
  end
end

