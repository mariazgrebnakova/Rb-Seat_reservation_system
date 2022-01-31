require 'rails_helper'

RSpec.describe Seat, type: :model do
  let!(:seat) { create(:seat) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:coordinates) }
  end

  describe 'associations' do
    it { should belong_to(:department) }
    it { should have_many(:reservations) }
  end
end
