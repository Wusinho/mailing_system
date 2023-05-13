class SurveysController < ApplicationController
  before_action :set_survey, only: [:update]
  def update
    p '*'*100
    p @survey
    p params
    p '*'*100
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

end
