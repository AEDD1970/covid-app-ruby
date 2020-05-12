class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    if params[:search].blank?
      @employees = Employee.all
    else
      @parameter = params[:search]
      @employees = Employee.where(:document_number => @parameter)
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if Employee.where(:document_number => @employee.document_number).present?
      render json: {
          error: "el empleado con el numero de documento #{@employee.document_number} ya existe",
          status: 400
      }
    else
      @employee.responsible = "ANDRES"
      @employee.responsible_position = "Resepcion"
      @employee.imc = calculate_data
      @employee.interpretation_id = calculate_portion
      @employee.date_and_time = Time.now.strftime("%d-%m-%Y %I:%M %p")
      respond_to do |format|
        if @employee.save
          format.json { head :no_content }
          format.js
        else
          format.json { render json: @employee.errors.full_messages, status: :unprocessable_entity }
          format.js { render :new }
        end
      end
    end
  end

  def calculate_data
    height = @employee.size
    weight = @employee.weight
    @result = weight / (height) ** 2
    @result.ceil(2)
  end

  def calculate_portion
    if((@result < 18.5) || (@result == 18.5))
      Interpretation.find(4).id
    elsif((@result > 18.5) && (@result < 25))
      Interpretation.find(3).id
    elsif((@result > 24.9) && (@result < 30))
      Interpretation.find(2).id
    elsif((@result > 30) && (@result == 30))
      Interpretation.find(1).id
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @employee.errors.full_messages, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:responsible, :responsible_position, :document_number, :name, :organizational_unit, :position, :gender_id, :eps, :age, :blood_type, :phone, :emergency_number, :weight, :size, :imc, :interpretation_id, :date_and_time)
  end
end
