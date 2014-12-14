class RemoveUserIdFromNote < ActiveRecord::Migration
  def change
    remove_column :notes, :user_id
  end
end
