# frozen_string_literal: true
#
class BookAppointment
  prepend SimpleCommand
  include ActiveModel::Validations

  # optional, initialize the command with some arguments
  def initialize(params)
    @schedule = Schedule.find(params[:schedule_id])
    @patient  = Patient.find(params[:patient_id])
    @start    = params[:start]
    @finish   = params[:finish]
  end

  # mandatory: define a #call method. its return value will be available
  #            through #result
  def call
    if slot_available?
      appointment = Appointment.create(patient: @patient,
                                       schedule: @schedule,
                                       start: @start,
                                       finish: @finish)


      if appointment.errors.any?
        errors.add(:base, appointment.errors.full_messages)
      else
        return appointment
      end
    else
      errors.add(:base, 'slot already taken')
    end

    nil
  end

  private

  def slot_available?
     # require 'pry'; binding.pry
    booked = Appointment.where(start: @start...@finish)
                        .or(Appointment.where(finish: @start..@finish))
                        .where(schedule: @schedule)

    booked.blank?
  end
end
