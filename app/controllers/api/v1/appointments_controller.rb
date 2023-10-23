# frozen_string_literal: true

class Api::V1::AppointmentsController < ApplicationController
  def create
    booking = BookAppointment.call(booking_params)

    if booking.success?
      render status: :created
    else
      render json: { error: booking.errors.full_messages.to_sentence },
             status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.permit(:doctor_id, :patient_id, :schedule_id, :start, :finish)
  end
end
