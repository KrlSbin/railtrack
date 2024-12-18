# == Schema Information
#
# Table name: tickets
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  priority    :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#
class Ticket < ApplicationRecord
  PRIORITIES = {
    "low" => 1,
    "medium" => 3,
    "high" => 5
  }.freeze

  STATUSES = {
    "new" => 1,
    "in progress" => 2,
    "finished" => 3
  }.freeze

  self.table_name = "tickets"
  validates_presence_of :name, :priority
  # validates :priority, inclusion: { in: %w[1 2 3] }

  belongs_to :project

  # def priority
  #   [ "low", "medium", "high" ]
  # end
end
