# frozen_string_literal: true

class Api::V1::SchedulesController < ApplicationController
  def index
    doctor = Doctor.find(params[:doctor_id])

    schedules = doctor.schedules.as_json(
      include: {
        clinic: {only: :name},
        speciality: { only: :name },
        doctor: { only: [:first_name, :last_name]}
      }
    )

    render json: schedules
  end
end
