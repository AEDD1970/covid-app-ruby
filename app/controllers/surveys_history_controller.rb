class SurveysHistoryController < ApplicationController
  before_action :set_survey_history, only: [:edit, :update, :destroy]

  def index
    @surveys_history = SurveyHistory.all
  end

  def new
    @survey_history = SurveyHistory.new
  end

  def create
    @survey_history = SurveyHistory.new(survey_history_params)

    respond_to do |format|
      if @survey_history.save
        format.json { head :no_content }
        format.json
      else
        format.json { render json: @survey_history.errors.full_messages, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @survey_history.update(survey_history_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @survey_history.errors.full_messages, status: :unprocessable_entity }
        format.json { render :edit }
      end
    end
  end

  def destroy
    @survey_history.destroy
    respond_to do |format|
      format.json
      format.json { head :no_content }
    end
  end

  private

  def set_survey_history
    @survey_history = SurveyHistory.find(params[:id])
  end

  def survey_history_params
    params.require(:survey_history).permit(:entry_time, :departure_time, :temperature, :mask, :new_mask, :symptom)
  end
end