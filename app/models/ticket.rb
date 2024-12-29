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
#  done        :boolean          default(FALSE), not null
#  status      :integer          default(0)
#
class Ticket < ApplicationRecord
  self.table_name = "tickets"

  module CONST
    LOW = "Low".freeze
    MEDIUM = "Medium".freeze
    HIGH = "High".freeze

    PRIORITIES = {
      1 => LOW,
      3 => MEDIUM,
      5 => HIGH
    }.freeze

    NEW = "New".freeze
    IN_PROGRESS = "In Progress".freeze
    FINISHED = "Finished".freeze

    STATUSES = {
      0 => NEW,
      3 => IN_PROGRESS,
      5 => FINISHED
    }.freeze

    DONE_STATUSES = [true, false].freeze
  end

  validates_presence_of :name, :priority
  validates_inclusion_of :priority, { in: CONST::PRIORITIES.keys }
  validates_inclusion_of :done, { in: CONST::DONE_STATUSES }

  belongs_to :project

  def priority_label
    CONST::PRIORITIES[self.priority]
  end

  def status_label
    CONST::STATUSES[self.status]
  end
end
