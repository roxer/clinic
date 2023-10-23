# Schedule for appointments

* Doctor has multiple specialities

* Doctor works at multiple clinics

* Doctor can work at any clinic for short time slot serving given speciality 

* Doctor can work for many slots per day (at many clinics)

# Bookings

* the first step for booking is to chose Doctor's time slot "schedule" (clinic, speciality, day of
week, hours)

* the second step is to book appointment having `patient_id`, `schedule_id`, start and
finish time of the appointment

* there is no "edit appointment" - just delete existing and create a new one
