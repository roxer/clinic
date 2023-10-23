# frozen_string_literal: true
#
class BookAppointment
  prepend SimpleCommand
  include ActiveModel::Validations

  # optional, initialize the command with some arguments
  def initialize(params)
    @schedule = Schedule.find(params[:schedule_id])
    @patient  = Patient.find(params[:patient_id])
    @start    = params[:start].to_datetime
    @finish   = params[:finish].to_datetime
  end

  # mandatory: define a #call method. its return value will be available
  #            through #result
  def call
    if schedule_available? && slot_available?
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
    booked = Appointment.where(start: @start...@finish)
      .or(Appointment.where(finish: (@start + 1.minute)..@finish))
                        .where(schedule: @schedule)

    booked.blank?
  end

  def schedule_available?
    require 'pry'; binding.pry
    s1 = @schedule.start.strftime('%H%M')
    s2 = @start.strftime('%H%M')
    f1 = @schedule.finish.strftime('%H%M')
    f2 = @finish.strftime('%H%M')

    (s2 >= s1 && s2 < f1) && (f2 > s1 && f2 <= f1)
  end
end
