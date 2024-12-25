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
#
class Ticket < ApplicationRecord
  self.table_name = "tickets"
  module CONST
    PRIORITIES = {
      1 => "low",
      3 => "medium",
      5 => "high"
    }.freeze

    STATUSES = {
      "new" => 1,
      "in progress" => 2,
      "finished" => 3
    }.freeze

    DONE_STATUSES = [true, false].freeze
  end

  validates_presence_of :name, :priority
  validates_inclusion_of :priority, { in: CONST::PRIORITIES.keys }
  validates_inclusion_of :done, { in: CONST::DONE_STATUSES }

  belongs_to :project

  # def priority
  #   ["low", "medium", "high"]
  # end
end
