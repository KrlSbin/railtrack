class Project < ApplicationRecord
  self.table_name = "projects"
  validates_presence_of :name
  validates_uniqueness_of :name
end
