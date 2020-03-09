class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string(:email)
      t.string(:password_digest)
      t.date(:d_o_b)
      t.integer(:height_ft,{:default => "0" })
      t.integer(:height_in,{:default => "0"})

      t.timestamps
    end
  end
end
