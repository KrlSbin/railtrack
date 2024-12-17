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
FactoryBot.define do
  factory :ticket do
  end
end
