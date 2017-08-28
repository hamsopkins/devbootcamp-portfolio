class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name, { limit: 36, null: false }
  		t.string :email, { limit: 50, null: false }
  		t.string :encrypted_password, { null: false }

  		t.timestamps(null: false)
  	end
  add_index :users, :email, unique: true	
  end
end
