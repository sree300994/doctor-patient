class DoctorsController < ApplicationController
  
  def index
    
    
    @doctors = Doctor.all
    respond_to do |format|
      
      binding.pry
      
      format.json { @doctors }
    end
  end

  def new
    @doctor = Doctor.new
  end
  
  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: "Doctor successfully created"
    else
      render 'new'
    end
  end

  private
  
  def doctor_params
    params.require(:doctor).permit(:name, :mobile, :specialization)
  end
  
end
