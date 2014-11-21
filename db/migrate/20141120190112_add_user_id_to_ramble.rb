class AddUserIdToRamble < ActiveRecord::Migration
  def change
    add_reference :rambles, :user, index: true
  end
end
