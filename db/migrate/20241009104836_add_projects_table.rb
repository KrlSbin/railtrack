class AddProjectsTable < ActiveRecord::Migration[7.2]
  def up
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
    end
  end

  def down
    drop_table :projects
  end
end
