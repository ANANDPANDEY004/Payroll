class AttandancesController < ApplicationController
  def index
    @attandances = Attandance.all.order("created_at DESC")
  end

  def new
 
    @attandance = Attandance.new 

  end

  def show
    @attandance = Attandance.find(params[:id])
    
  end

  def create
    @attandance = Attandance.create(attandance_param)
    @attandance.user = current_user
    # @attandance = current_user.attandances.where(in_time:Today.date)
    # @attandance = Attandance.where(in_time: Time.now.beginning_of_day.utc..Time.now.end_of_day.utc).first_or_create!
    if @attandance.save
      # flash[:alert] = "Attandance  was saved"
      redirect_to @attandance
    else
      render :new
    end

  end

 
  
  private
  def attandance_param
    params.require(:attandance).permit(:in_time,:out_time)
  end
end
