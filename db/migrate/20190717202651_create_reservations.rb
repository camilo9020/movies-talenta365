class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :movie_function, foreign_key: true
      t.string :name
      t.string :email
      t.string :identification_number

      t.timestamps
    end
  end
end
