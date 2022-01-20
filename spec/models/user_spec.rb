require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user, first_name: 'Hubert', last_name:'Sampansky', discarded_at: nil)}

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

  describe '.full_name' do
    it 'returns first_name space last_name' do     
      expect(user.full_name).to eq("Hubert Sampansky")
    end
  end

  describe '.is_discarded' do
    it 'returns false if not discarded' do
      expect(user.is_discarded).to eq("false")
    end
  end
end
