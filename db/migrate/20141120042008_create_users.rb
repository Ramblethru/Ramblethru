class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string :lives_in
      t.string :username
      t.string :password_digest
      t.timestamps
    end
  end
end
