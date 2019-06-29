class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :departure_airport, index: true, foreign_key: {to_table: :airports}
      t.references :arrival_airport, index: true, foreign_key: {to_table: :airports}
      t.datetime :departure_time
      t.integer :duration
      t.timestamps
    end
  end
end
