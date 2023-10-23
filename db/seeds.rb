# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'


10.times do
  Speciality.create(name: Faker::Creature::Animal.name )
end unless Speciality.first

3.times do
  Clinic.create(name: Faker::Address.city)
end unless Clinic.first

3.times do
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end unless Patient.first

3.times do
  d = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end unless Doctor.first

3.times do
  doctor = Doctor.first
  clinic = Clinic.first
  speciality = Speciality.first

  start = (8..17).to_a.sample
  finish = ((start + 1)..18).to_a.sample.to_s
  start = start.to_s

  Schedule.create(doctor:,
                  clinic:,
                  speciality:,
                  start:,
                  finish:,
                  weekday: Faker::Date::DAYS_OF_WEEK.sample.to_s)
end unless Schedule.first

8.times do
  p = Patient.order('RANDOM()').first
  s = Schedule.order('RANDOM()').first

  # schedule_start =
  start = '2023-10-20 11:00'
  finish = '2023-10-20 13:00'

  Appointment.create(patient: p,
                     schedule: s,
                     start:,
                     finish:)
end
