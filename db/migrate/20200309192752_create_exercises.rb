class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.date :date
      t.string :ex_type
      t.integer :user_id

      t.timestamps
    end
  end
end
