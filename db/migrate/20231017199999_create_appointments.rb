class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false
      t.references :schedule, null: false

      t.datetime :start, null: false
      t.datetime :finish, null: false

      t.timestamps
    end
  end
end
