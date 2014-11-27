class RemoveAddressFromRambles < ActiveRecord::Migration
  def change
    remove_column :rambles, :address, :string
  end
end
