# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :schedules
  has_many :appoitments, through: :schedules
end
