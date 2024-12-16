class AddConstraintForTicketPriority < ActiveRecord::Migration[7.2]
  def up
    change_column_default :tickets, :priority, 1
    change_column_null :tickets, :priority, false
  end

  def down
    change_column_default :tickets, :priority, nil
    change_column_null :tickets, :priority, true
  end
end
