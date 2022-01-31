require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let!(:admin) { create(:user) }

  context 'user not logged in' do
    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response.status).to eq(302) 
      end
    end
  end

  context 'user logged in' do
    before { sign_in admin }

    describe 'GET #index' do

      it 'returns http success' do
        get :index
        expect(response.status).to eq(200) 
      end
    end
  end
end