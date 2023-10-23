# frozen_string_literal: true

class Clinic < ApplicationRecord
  has_many :schedules
  has_many :appointments, through: :schedules
end
