class AddDefaultToUsers < ActiveRecord::Migration
  def change
    change_column :users, :lives_in, :string, :default => 'where do you live?'
    change_column :users, :bio, :string, :default => 'add a bio!'
  end
end
