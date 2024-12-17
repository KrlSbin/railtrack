# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#
FactoryBot.define do
  factory :project, class: Project do
    name { 'name' }
    description { 'description' }
  end
end
