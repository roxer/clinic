# frozen_string_literal: true

class Api::V1::SchedulesController < ApplicationController
  def index
    doctor = Doctor.find(params[:doctor_id])

    schedules = doctor.schedules.as_json(
      include: {
        clinic: { only: :name },
        speciality: { only: :name },
        doctor: { only: %i[first_name last_name] }
      }
    )

    render json: schedules
  end

  def availability
    start = params[:start].to_date
    finish = params[:finish].to_date

    doctor = Doctor.find(params[:doctor_id])
    schedules = doctor.schedules
    availabilities = []

    (start..finish).each do |day|
      weekday = Date::DAYNAMES[day.wday].downcase
      s = Schedule.where(doctor:, weekday:)
      next if s.empty?

      app = Appointment.where(start: day.all_day, schedule: s)

      availabilities << { schedule: s, appointments: app }
    end

    render json: availabilities.to_json
  end
end
