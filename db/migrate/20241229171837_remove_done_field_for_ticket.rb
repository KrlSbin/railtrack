class RemoveDoneFieldForTicket < ActiveRecord::Migration[7.2]
  def up
    remove_column :tickets, :done
  end
  def down
    add_column :tickets, :done, :boolean, default: false, null: false
  end
end
