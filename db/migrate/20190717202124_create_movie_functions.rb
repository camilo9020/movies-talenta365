class CreateMovieFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_functions do |t|
      t.references :movie, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
