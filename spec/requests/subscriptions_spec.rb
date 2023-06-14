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
        expect(response).to have_http_status(:ok)
        expect(response.body).to render_template('surveys/_survey_link')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for(:subscription, email: nil) }

      it 'does not save the new subscription' do
        expect {
          post subscriptions_path, params: { subscription: invalid_attributes }
        }.not_to change(Subscription, :count)
      end

      it 'renders the turbo error message' do
        post subscriptions_path, params: { subscription: invalid_attributes }, xhr: true
        expect(response.body).to render_template('shared/_error_message')
      end

    end

    context 'with duplicated email' do
      let(:subscription) { create(:subscription) }

      it 'renders the turbo error message' do
        post subscriptions_path, params: { subscription: {:email=>subscription.email, :preferences=>["men"]}
        }, xhr: true
        expect(response.body).to render_template('shared/_error_message')
      end

    end


  end
end

