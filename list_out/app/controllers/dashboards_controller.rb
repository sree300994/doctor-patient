class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @doctors = HTTParty.get("http://localhost:3001/doctors")
    binding.pry
    # @doctors = JSON.parse(@doctor_result.body)
    @patients = HTTParty.get("http://localhost:3001/patients")
    binding.pry
    # @patients = JSON.parse(@patient_result.body)
  end

  def patient_create
    if params[:specialization].present?
      @doctor = HTTParty.post("http://localhost:3001/doctors", body: {doctor: {name: params[:name], mobile: params[:mobile], specialization: params[:specialization]}})
      redirect_to dashboards_path, notice: "Successfully created Doctor"
    elsif params[:diseases].present?
      @appointment = HTTParty.post("http://localhost:3001/appointments", body: {appointment: {diseases: params[:diseases], doctor_id: params[:doctor_id], patient_id: params[:patient_id]}})
      redirect_to dashboards_path, notice: "Successfully created Appointment"
    else
      @patient = HTTParty.post("http://localhost:3001/patients", body: {patient: {name: params[:name], mobile: params[:mobile]}})
      redirect_to dashboards_path, notice: "Successfully created Patient"
    end
  end
end
