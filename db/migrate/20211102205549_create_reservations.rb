class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :from
      t.date :to
      t.integer :seat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
