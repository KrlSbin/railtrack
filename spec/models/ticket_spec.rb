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
require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    let(:name) { 'my ticket' }
    let(:description) { 'my description' }
    let(:priority) { 3 }
    let(:project) { FactoryBot.create(:project) }
    let(:ticket) {
      FactoryBot.build(:ticket,
                       name: name,
                       description: description,
                       priority: priority,
                       project: project,
                       done: false)
    }

    subject do
      ticket
    end

    context 'when valid' do
      it_behaves_like :subject_valid
    end

    context 'when invalid' do
      let(:name) { nil }

      it_behaves_like :subject_invalid
    end
  end
end
