class AddDefaultValueToNoteShare < ActiveRecord::Migration
  def change
    change_column :notes, :share, :boolean, default: true, null: false
  end
end
