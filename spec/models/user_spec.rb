require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'uniqueness' do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should belong_to(:department) }
    it { should belong_to(:user_type) }
  end

  describe 'full_name' do
    it 'returns first_name space last_name' do
      expect(described_class.full_name).to output("#{first_name} #{last_name}")
    end
  end
end
