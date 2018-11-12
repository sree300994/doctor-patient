class PatientsController < ApplicationController
  def index
    binding.pry
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient successfully created"
    else
      render 'new'
    end
  end
  
  private

  def patient_params
    params.require(:patient).permit(:name, :mobile)
  end
  
end
