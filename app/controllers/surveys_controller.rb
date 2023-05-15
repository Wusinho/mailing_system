class SurveysController < ApplicationController
  before_action :set_survey, only: [:update, :show]
  before_action :create_answer_instances, only: [:show]
  def update
    if @survey.update(survey_params)
        redirect_to root_path
      else
        turbo_error_message(@survey)
    end
  end

  def show

  end

  def create

    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to survey_path(@survey)
    else
      turbo_error_message(@survey)
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def create_answer_instances
    @survey.create_survey_answer_instances
  end


  def survey_params
    params.require(:survey).permit(:completed, :subscription_id, :category, survey_answers_attributes: [:answer, :question_id])
  end
end
