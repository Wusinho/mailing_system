class SurveyAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :question
  validates_presence_of :answer
  before_save :update_lang

  def update_lang
    self.lang = I18n.locale || I18n.default_locale
  end

end
