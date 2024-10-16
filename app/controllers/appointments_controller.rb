# frozen_string_literal: true

class AppointmentsController < InheritedResources::Base
  before_action :set_property, only: %i[new create]

  def new
    @appointment = @property.appointments.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to property_url(@property), notice: 'Appointment successfully created. You will recieve a mail shortly'
      AppointmentMailer.with(appointment: @appointment, property: @property).notify_agent_email.deliver_later
    else
      p @appointment.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:property_id, :agent_id, :date,
                                        :client_name, :client_address, :time_slot,
                                        :client_phone_number, :addtional_query)
  end

  def set_property
    @property = Property.find(params[:property_id])
  end
end
