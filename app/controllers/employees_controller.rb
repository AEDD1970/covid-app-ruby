class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @employee.errors.full_messages, status: :unprocessable_entity}
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.json { head :no_content}
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

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:document_number, :name, :organizational_unit, :position, :gender, :eps, :age, :blood_type, :phone, :emergency_number, :weight, :size, :imc, :interpretation)
  end
end
