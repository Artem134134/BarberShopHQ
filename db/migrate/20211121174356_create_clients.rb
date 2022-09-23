class CreateClients < ActiveRecord::Migration[6.1]
  def change
  	create_table :clients do |t|
    
  		t.text :name
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		t.timestamps
  	end

  Client.create :barber => 'Jessie Pinkman'
  Client.create :barber => 'Walter White'
  Client.create :barber => 'Gus Fring'
  Client.create :barber => 'Mike Ehrmantaut'
  Client.create :barber => 'Kirill Artamonov'	
    end
end
