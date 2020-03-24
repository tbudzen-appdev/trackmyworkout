class AddDistanceToCardio < ActiveRecord::Migration[6.0]
  def change
    add_column :cardios, :distance, :integer
  end
end
