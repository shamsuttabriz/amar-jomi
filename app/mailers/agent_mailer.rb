# frozen_string_literal: true

class AgentMailer < ApplicationMailer
  def welcome_email
    @agent = params[:agent]
    mail(to: @agent.email, subject: 'Welcome to Amar-Jomi, You are an agent now')
  end
end
