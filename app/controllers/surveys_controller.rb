class SurveysController < ApplicationController
  before_action :set_survey, only: [:update]
  def update
    if @survey.update(survey_params)
      p '*'*100
      p @survey.survey_answers
      p '*'*100

      else
        p '*'*100
        p @survey.errors
        p '*'*100

    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end


  def survey_params
    params.require(:survey).permit(survey_answers_attributes: [:answer, :question_id])
  end
end
