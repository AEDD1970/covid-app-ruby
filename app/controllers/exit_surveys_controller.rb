class ExitSurveysController < ApplicationController
  before_action :set_exit_survey, only: [:show, :edit, :update, :destroy]

  # GET /exit_surveys
  # GET /exit_surveys.json
  def index
    @exit_surveys = ExitSurvey.all
  end

  # GET /exit_surveys/1
  # GET /exit_surveys/1.json
  def show
  end

  # GET /exit_surveys/new
  def new
    @exit_survey = ExitSurvey.new
  end

  # GET /exit_surveys/1/edit
  def edit
  end

  # POST /exit_surveys
  # POST /exit_surveys.json
  def create
    @exit_survey = ExitSurvey.new(exit_survey_params)

    respond_to do |format|
      if @exit_survey.save
        format.html { redirect_to @exit_survey, notice: 'Exit survey was successfully created.' }
        format.json { render :show, status: :created, location: @exit_survey }
      else
        format.html { render :new }
        format.json { render json: @exit_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exit_surveys/1
  # PATCH/PUT /exit_surveys/1.json
  def update
    respond_to do |format|
      if @exit_survey.update(exit_survey_params)
        format.html { redirect_to @exit_survey, notice: 'Exit survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @exit_survey }
      else
        format.html { render :edit }
        format.json { render json: @exit_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exit_surveys/1
  # DELETE /exit_surveys/1.json
  def destroy
    @exit_survey.destroy
    respond_to do |format|
      format.html { redirect_to exit_surveys_url, notice: 'Exit survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit_survey
      @exit_survey = ExitSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_survey_params
      params.require(:exit_survey).permit(:Sore_throat, :Nasal_congestion, :Cough, :Difficulty_breathing, :Fatigue, :Shaking_chills, :Muscle_pain, :Another, :respiratory, :temperature, :new_temperature)
    end
end
