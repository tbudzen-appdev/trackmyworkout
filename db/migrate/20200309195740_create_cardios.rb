class CreateCardios < ActiveRecord::Migration[6.0]
  def change
    create_table :cardios do |t|
      t.string :cardio_type
      t.time :time
      t.integer :ex_id

      t.timestamps
    end
  end
end
