class AddAddressLatitudeLongitudeToRambles < ActiveRecord::Migration
  def change
    add_column :rambles, :address, :string
    add_column :rambles, :latitude, :float
    add_column :rambles, :longitude, :float
  end
end
