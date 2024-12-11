class AddForeignKeyForTickets < ActiveRecord::Migration[7.2]
  def up
    add_column :tickets, :project_id, :integer, null: false
    add_foreign_key :tickets, :projects
  end

  def down
    remove_column :tickets, :project_id
  end
end
