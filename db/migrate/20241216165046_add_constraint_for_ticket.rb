class AddConstraintForTicket < ActiveRecord::Migration[7.2]
  def up
    change_column_default :tickets, :priority, 1
    change_column_null :tickets, :priority, false
    change_column_null :tickets, :name, false
    change_column_null :tickets, :description, false
  end

  def down
    change_column_default :tickets, :priority, nil
    change_column_null :tickets, :priority, true
    change_column_null :tickets, :name, true
    change_column_null :tickets, :description, true
  end
end
