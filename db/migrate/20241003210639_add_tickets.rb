class AddTickets < ActiveRecord::Migration[7.2]
  def up
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.integer :priority, limit: 1

      t.timestamps
    end
  end

  def down
    drop_table :tickets
  end
end
