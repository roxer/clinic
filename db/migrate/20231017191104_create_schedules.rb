class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :doctor, null: false
      t.references :clinic, null: false
      t.references :speciality, null: false

      t.string :weekday, null: false
      t.time :start, null: false
      t.time :finish, null: false

      t.timestamps
    end
  end
end
