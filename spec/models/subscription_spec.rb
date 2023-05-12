require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe Subscription do
    context 'validations' do
      it 'should validate presence' do
        should validate_presence_of(:email)
        should validate_presence_of(:preferences)
      end
    end
  end
end
