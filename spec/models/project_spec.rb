# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    let(:name) { 'my project' }
    let(:description) { 'my project description' }
    let(:project) {
      FactoryBot.build(:project,
                       name: name,
                       description: description)
    }

    subject do
      project
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
