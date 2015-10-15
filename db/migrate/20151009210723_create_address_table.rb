class CreateAddressTable < ActiveRecord::Migration
  def change
  	create_table :addresses do |t|
  		t.string :address
  		t.string :city
  		t.integer :zipcode
  	end
  end
end
