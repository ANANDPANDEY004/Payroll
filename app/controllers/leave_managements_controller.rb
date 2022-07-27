class LeaveManagementsController < ApplicationController
   before_action :set_leave_management ,only: [:show, :update,:edit ,:destroy]

  def index
    @leave_managements = LeaveManagement.all
    
    # @leave_management = LeaveManagement.new
  end

  def show
    # @leave_management = LeaveManagement.find(params[:id])
    @leave_managements = current_user.leave_managements.all
  end

  def new
     @leave_management = LeaveManagement.new
  end

  def create
    @leave_management = LeaveManagement.new(leave_params)
    @leave_management.user = current_user
    if @leave_management.save
        redirect_to @leave_management
    else
        render :new
    end
  end

  def edit
    # @leave_management = LeaveManagement.find(params[:id])
  end

  def update
    if @leave_management.update(leave_params)
        flash[:notice] = "updated Successfully."
        redirect_to @leave_management
    else
            render 'edit'
    end
  end
  def destroy
    # @leave_management = LeaveManagement.find(params[:id])
    @leave_management.destroy
    redirect_to leave_managements_path
  end

  def accept
    my = LeaveManagement.find(params[:leave_management_id])
    my.status = (params[:status]).to_i
    my.save 
  
  end

  def decline
    my = LeaveManagement.find(params[:leave_management_id])
    my.status = (params[:status]).to_i
    my.save 
  end

  private

  def set_leave_management
    @leave_management = LeaveManagement.find(params[:id])
  end
  def leave_params
    params.require(:leave_management).permit(:leave_type,:reason,:leave_unit,:start_date,:end_date,:status)
  end
  
end
