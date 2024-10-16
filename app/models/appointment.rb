# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :property
  belongs_to :agent

  validates :client_name, :client_address, :client_phone_number, :time_slot, :date, presence: true

  
end
