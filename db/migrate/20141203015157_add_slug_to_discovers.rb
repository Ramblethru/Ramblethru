class AddSlugToDiscovers < ActiveRecord::Migration
  def change
    add_column :discovers, :slug, :string
    add_reference :discovers, :discovers, index: true
  end
end
