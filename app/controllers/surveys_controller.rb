class SurveysController < ApplicationController
  before_action :set_survey, only: [:update]
  def update
    if @survey.update(survey_params)
        redirect_to root_path
      else
        turbo_error_message(@survey)
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
