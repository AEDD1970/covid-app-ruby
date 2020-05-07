class EntranceSurveysController < ApplicationController
  before_action :set_entrance_survey, only: [:edit, :update, :destroy]

  def index
    @entrance_surveys = EntranceSurvey.all
  end

  def new
    @entrance_survey = EntranceSurvey.new
  end

  def create
    @entrance_survey = EntranceSurvey.new(entrance_survey_params)
    @entrance_survey.creation_date_and_time =  Time.now.strftime("%d-%m-%Y %I:%M %p")
    @entrance_survey.employee_id = 1
    respond_to do |format|
        if @entrance_survey.save
          format.json { head :no_content }
          format.js
        else
          format.json { render json: @entrance_survey.errors.full_messages, status: :unprocessable_entity }
          format.js { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @entrance_survey.update(entrance_survey_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @entrance_survey.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit}
      end
    end
  end

  def destroy
    @entrance_survey.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_entrance_survey
    @entrance_survey = EntranceSurvey.find(params[:id])
  end

  def entrance_survey_params
    params.require(:entrance_survey).permit(:recorded_temperature, :new_temperature_recorded, :sore_throat, :nasal_congestion, :cough, :difficulty_breathing, :fatigue, :shaking_chills, :muscle_pain, :other_respiratory_symptom, :which_respiratory_symptom, :disposable_face_mask, :respirator, :latex_gloves, :nitrile_gloves, :rubber_gloves, :another_item, :which_other_element, :does_not_apply_protection, :does_not_apply_because, :hand_disinfection, :discard_used_items, :disinfection_element, :employee_id, :creation_date_and_time)
  end

end