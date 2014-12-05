class AddDefaultToRambles < ActiveRecord::Migration
  def change
    change_column :rambles, :name, :string, :default => 'give your ramble a title!'
  end
end
