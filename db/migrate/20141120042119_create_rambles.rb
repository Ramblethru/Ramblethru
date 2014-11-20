class CreateRambles < ActiveRecord::Migration
  def change
    create_table :rambles do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :destination

      t.timestamps
    end
  end
end
