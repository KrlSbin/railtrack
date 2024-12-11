# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#
class Project < ApplicationRecord
  self.table_name = "projects"
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :tickets
end
