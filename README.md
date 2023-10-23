# README

Steps are necessary to get the application up and running.


* Ruby version 3.2.2

`$ rbenv install 3.2.2`

`$ brew install httpie`

`$ bundle install`

* Database creation

`$ rails db:setup`

* Deployment instructions

`$ rails server`

* API endpoint to list doctor's schedules

`$ http http://localhost:3000/api/v1/doctors/1/schedules`

* API endpoint to list doctor's availability

`$ http://localhost:3000/api/v1/doctors/1/schedules/availability?start=2023-10-10&finish=2023-11-20`

* API endpoint to book an appointment

```
$ printf '{
    "schedule_id": 1,
    "start": "2023-10-20 9:00",
    "finish": "2023-10-20 10:00",
    "patient_id": 1
}'| http  --follow --timeout 3600 POST 'http://localhost:3000/api/v1/appointments' \
 Content-Type:'application/json'
```
