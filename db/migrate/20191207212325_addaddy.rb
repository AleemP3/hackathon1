class Addaddy < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :location 
  end
end
