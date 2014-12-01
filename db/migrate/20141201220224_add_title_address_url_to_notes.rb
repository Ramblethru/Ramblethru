class AddTitleAddressUrlToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :title, :string
    add_column :notes, :address, :string
    add_column :notes, :url, :string
  end
end
