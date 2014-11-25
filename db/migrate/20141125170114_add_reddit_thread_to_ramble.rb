class AddRedditThreadToRamble < ActiveRecord::Migration
  def change
    add_column :rambles, :reddit_thread, :string
  end
end
