# frozen_string_literal: true

class AppointmentMailer < ApplicationMailer
  def notify_agent_email
    @property = params[:property]
    @appointment = params[:appointment]
    @agent = @property.agent
    mail(to: @agent.email, subject: "New appointment on '#{@property.caption}'")
  end
end
