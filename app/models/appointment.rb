# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient

  validate :validate_booking

  private

  def validate_booking
    booked = Appointment.where(start: start...finish)
                        .or(Appointment.where(finish: start..finish))
                        .where(schedule: schedule)

    errors.add(:base, 'slot already taken') if booked.present?
  end
end
