class AddInstagramUrlToRamble < ActiveRecord::Migration
  def change
    add_column :rambles, :instagram_url, :string
  end
end
