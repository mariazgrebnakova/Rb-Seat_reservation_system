require 'rails_helper'

RSpec.describe Department, type: :model do
  let!(:department) { create(:department) }

  describe 'uniqueness' do
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:code).case_insensitive }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:code) }
  end

  describe 'associations' do
    it { should have_many(:seats) }
    it { should have_many(:users) }
  end

end
