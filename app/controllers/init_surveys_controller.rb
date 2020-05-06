class InitSurveysController < ApplicationController
  before_action :set_init_survey, only: [:show, :edit, :update, :destroy]
  include InitSurveysHelper

  # GET /init_surveys
  # GET /init_surveys.json
  def index
    employee = params[:document_number].to_i
    employees = Employee.find_by(document_number: employee)
    if employees && employees.document_number == employee
      @data = employees.id
    @employees= Employee.where(id: @data)
    else
      ##tengo que buscar una forma de mandar un alerta desde aca
    end
  end

  # GET /init_surveys/1 1
  # GET /init_surveys/1.json
  def show
  end

  # GET /init_surveys/new
  def new
    @init_survey = InitSurvey.new
  end

  # GET /init_surveys/1/edit
  def edit
  end

  # POST /init_surveys
  # POST /init_surveys.json
  def create
    byebug
    @init_survey = InitSurvey.new(init_survey_params)
    @init_survey.employee_id = @data

    respond_to do |format|
      if @init_survey.save
        format.html { redirect_to @init_survey, notice: 'Init survey was successfully created.' }
        format.json { render :show, status: :created, location: @init_survey }
      else
        format.html { render :new }
        format.json { render json: @init_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /init_surveys/1
  # PATCH/PUT /init_surveys/1.json
  def update
    respond_to do |format|
      if @init_survey.update(init_survey_params)
        format.html { redirect_to @init_survey, notice: 'Init survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @init_survey }
      else
        format.html { render :edit }
        format.json { render json: @init_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /init_surveys/1
  # DELETE /init_surveys/1.json
  def destroy
    @init_survey.destroy
    respond_to do |format|
      format.html { redirect_to init_surveys_url, notice: 'Init survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_init_survey
      @init_survey = InitSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def init_survey_params
      params.require(:init_survey).permit(:sore_throat_init, :nasal_congestion_init, :cough_init, :difficulty_breathing_init, :fatigue_init, :shaking_chills_init, :muscle_pain_init, :another_init, :respiratory_init, :temperature_init, :new_temperature_init, :employee_id)
    end
end
