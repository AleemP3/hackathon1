class Addanother < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :trip 
  end
end
