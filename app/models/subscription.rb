class Subscription < ApplicationRecord
  validates_presence_of :email, :preferences
end
