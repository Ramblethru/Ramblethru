class RenameAddressToDestinationInDiscovers < ActiveRecord::Migration
  def self.up
    rename_column :discovers, :address, :destination
  end

  def self.down
  end
end
