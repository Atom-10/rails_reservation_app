class CreateRoomReservationRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :room_reservation_relations do |t|
      t.references :Room, null: false, foreign_key: true
      t.references :Reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end