class AddDoneFlagForTickets < ActiveRecord::Migration[7.2]
  def up
    add_column :tickets, :done, :boolean, default: false, null: false
  end

  def down
    remove_column :tickets, :done
  end
end
