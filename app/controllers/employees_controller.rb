class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  $user = ""

  def index
    employee = params[:search].to_i
    @employees = Employee.all
    #.paginate(:page => params[:page], :per_page => 5)
    result = Employee.find_by_document_number(employee)

    if result.present?
      $user = result.document_number
      @employees = Employee.where(document_number: $user)
    elsif !result.present? && employee != 0
      @error = true
    end
  end

  def new
    @employee = Employee.new
  end


  def create
    @employee = Employee.new(employee_params)
    if Employee.where(:document_number => @employee.document_number).present?
      sweetalert_warning("el empleado con el numero de documento #{@employee.document_number} ya existe", 'Ya existe', persistent: 'Aceptar')
      redirect_to action: "create"
    else
      @employee.responsible = "ANDRES"
      @employee.responsible_position = "Resepcion"
      @employee.imc = calculate_data
      @employee.interpretation = calculate_portion
      @employee.date_and_time = Time.now.strftime("%d-%m-%Y %I:%M %p")
      respond_to do |format|
        if @employee.save
          sweetalert_success("El empleado #{@employee.name} se ha registrado con exito", 'Creado', persistent: 'Aceptar')
          redirect_to action: "create"
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
    weight = @employee.weight.to_f
    height = @employee.size
    @imc = weight/(height * height)
    @imc.ceil(2)
  end

  def calculate_portion
    if((@imc < 18.5) || (@imc == 18.5))
      @imc_result = 'DESNUTRICION'
    elsif((@imc > 18.5) && (@imc < 25))
      @imc_result = 'NORMAL'
    elsif((@imc > 24.9) && (@imc < 30))
      @imc_result = 'SOBREPESO'
    elsif((@imc > 30) && (@imc == 30))
      @imc_result = 'OBESIDAD'
    end
  end

  # def calculate_muscle_mass_index
  #   #weight = peso
  #   weight = @employee.weight.to_f
  #   height = @employee.size
  #   @imc = weight/(height * height)
  #
  #   if((@imc < 18.5) || (@imc == 18.5))
  #     @imc_result = 'DESNUTRICION'
  #   elsif((@imc > 18.5) && (@imc < 25))
  #     @imc_result = 'NORMAL'
  #   elsif((@imc > 24.9) && (@imc < 30))
  #     @imc_result = 'SOBREPESO'
  #   elsif((@imc > 30) && (@imc == 30))
  #     @imc_result = 'OBESIDAD'
  #   end
  # end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        sweetalert_success("El empleado #{@employee.name} se ha editado con exito", 'Actualizado', persistent: 'Aceptar')
        redirect_to action: "index"
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
    params.require(:employee).permit(:responsible, :responsible_position, :document_number, :name, :organizational_unit, :position, :gender_id, :eps, :age, :blood_type, :phone, :emergency_number, :weight, :size, :imc, :interpretation, :date_and_time)
  end
end
