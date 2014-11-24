class AddRambleToNote < ActiveRecord::Migration
  def change
  	add_reference :notes, :ramble, index: true
  end
end
