require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe Survey do
    context 'Provider associations' do
      it do
        should belong_to(:subscription)
      end
    end
    context 'validations' do
      it { should validate_presence_of(:category) }
    end
  end
end
