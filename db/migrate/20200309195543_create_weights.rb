class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.string :lift
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.integer :ex_id

      t.timestamps
    end
  end
end
