class EmployeesController < ApplicationController

  def index
    if current_user.admin? || current_user.hr?
    @employees = Employee.all  
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    if current_user.employee.nil? 
    @employee = Employee.new
    else 
      # render :inline => "<h1> Your Profile are alredy submited by you</h1>"
      render :blank
    end
  end
  
  def create
    @employee = Employee.new(employee_params)
    @employee.user = current_user
    if @employee.save
      redirect_to @employee
    else
      render :new 
    end
  end 

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee was updated Successfully."
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  def blank
  end

  # def active
  #   my = Employee.find(params)
  #   my.status = (params[:status]).to_i
  #   my.save 
  
  # end

  def change_status
    if @employees.is_active?
      @employees.update_attribute(:is_active, false)
    else
      @employees.update_attribute(:is_active, true)
    end 
  end

  private
  def employee_params
    params.require(:employee).permit(:employee_id,:date_of_birth,:gender,:mobile, :date_of_join,:city,:designation,:is_active)
  end
end
