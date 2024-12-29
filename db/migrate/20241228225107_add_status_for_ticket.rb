class AddStatusForTicket < ActiveRecord::Migration[7.2]
  def up
    add_column :tickets, :status, :integer, default: 0
  end

  def down
    remove_column :tickets, :status
  end
end
