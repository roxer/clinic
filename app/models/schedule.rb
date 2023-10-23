# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :doctor
  belongs_to :clinic
  belongs_to :speciality
  has_many :appoitments
end
