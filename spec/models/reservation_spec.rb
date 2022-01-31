require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let!(:reservation) { create(:reservation) }

  describe 'associations' do
    it { should belong_to(:seat) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:from) }
    it { is_expected.to validate_presence_of(:to) }
  end
end
