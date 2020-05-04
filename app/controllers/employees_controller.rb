class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]
  # before_action :set_document_number, only: [:show]

  def index
    @employees = Employee.all
  end

  def show
    # number = params[:document_number]
    # puts "inspect ------------<<<<<<<<<<<<<<<<#{number.inspect}"
    # if number
    #   @employee = Employee.where('document_number LIKE ?', "%#{number}%")
    # else
    #   @employee = Employee.all
    # end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if validate_params_create_employee
    else
      parameter_validation_for_validation
    end
  end

  def parameter_validation_for_validation
    @employee.responsible = "ANDRES"
    @employee.responsible_position = "Resepcion"
    @employee.weight += ' KG'
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

  def validate_params_create_employee
    if Employee.where(:document_number => @employee.document_number).present?
      render json: {
          error: "el empleado con el numero de documento #{@employee.document_number} ya existe",
          status: 400
      }
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @employee.errors.full_messages, status: :unprocessable_enty }
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

  # def set_document_number
  #   @employee = Employee.find_by_document_number(params[:document_number])
  # end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:responsible, :responsible_position, :document_number, :name, :organizational_unit, :position, :gender_id, :eps, :age, :blood_type, :phone, :emergency_number, :weight, :size, :imc, :interpretation_id, :date_and_time)
  end
end
