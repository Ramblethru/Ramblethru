class AddShareToNote < ActiveRecord::Migration
  def change
    add_column :notes, :share, :boolean
  end
end
