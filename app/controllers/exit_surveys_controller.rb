class ExitSurveysController < ApplicationController
  before_action :set_exit_survey, only: [:show, :edit, :update, :destroy]

  $user = ""
  def index
    exit_surveys= params[:search].to_i
    @exit_surveys = ExitSurvey.all
    #.paginate(:page => params[:page], :per_page => 5)
    result =  Employee.find_by_document_number(exit_surveys)
    if result && exit_surveys == result.document_number

      $user = result.id
      @exit_surveys = ExitSurvey.where(employee_id: $user)
    else

    end
  end

  def output_reports
    @exit_survey = ExitSurvey.all
    render xlsx: "Reporte de salida#{Time.now.strftime('%d%m%Y%H%M%S')} ", template: 'reports/output_reports .xlsx.axlsx'
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
    @exit_survey.date =  Time.now
    @exit_survey.hour =  Time.now.strftime("%I:%M %p")
    @exit_survey.employee_id = $user
    respond_to do |format|
      if @exit_survey.save
        flash[:success] = "La encuesta de #{@exit_survey.employee.name} se ha creado con exito"
        redirect_to action: "create"
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @exit_survey.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /exit_surveys/1
  # PATCH/PUT /exit_surveys/1.json
  def update
    respond_to do |format|
      if @exit_survey.update(exit_survey_params)
        flash[:success] = "La encuesta de #{@exit_survey.employee.name} se ha editado con exito"
        redirect_to action: "index"
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @exit_survey.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit}
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
      params.require(:exit_survey).permit(:recorded_temperature_exit, :new_temperature_recorded_exit, :sore_throat_exit, :nasal_congestion_exit, :cough_exit, :difficulty_breathing_exit, :fatigue_exit, :shaking_chills_exit, :muscle_pain_exit, :other_respiratory_symptom_exit, :which_respiratory_symptom_exit, :disposable_face_mask_exit, :respirator_exit, :latex_gloves_exit, :nitrile_gloves_exit, :rubber_gloves_exit, :another_item_exit, :which_other_element_exit, :does_not_apply_protection_exit, :does_not_apply_because_exit, :hand_disinfection_exit, :discard_used_items_exit, :disinfection_element_exit, :employee_id, :date, :hour)
    end
end
