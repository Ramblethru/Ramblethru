class AddSlugToRambles < ActiveRecord::Migration
  def change
    add_column :rambles, :slug, :string
    add_reference :rambles, :rambles, index: true
  end
end
