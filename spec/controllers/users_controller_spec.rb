require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:admin) { create(:user, :admin) }

  describe 'GET #index' do
    before { sign_in admin }

    it 'returns http success' do
      get :index
      expect(response.status).to eq(200) 
    end
  end

  describe 'GET #index' do
    context 'not signed' do
      it 'redirects to login page' do
        get :index
        expect(response.status).to eq(302) 
      end
    end
  end

  describe 'GET #new' do
    before { sign_in admin }

    it 'returns http success' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    before { sign_in admin }

    it 'returns http success' do
      get :edit, params: { id: admin.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    before { sign_in admin }

    it 'returns http success' do
        get :edit, params: { id: admin.id }
        expect(response.status).to eq(200)
      end
    end

  describe 'GET #new' do
    before { sign_in admin }

    it 'returns http success' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #create' do
    before { sign_in admin }

    context 'invalid' do
      it 'returns not saved user' do
        post :create, params: { user: { first_name: '' } }
        expect(flash[:danger]).to eq I18n.t('users.alerts.user_not_saved')
      end
    end
  end

  describe 'GET #show' do
    before { sign_in admin }

    it 'returns http success' do
      get :show, params: { id: admin.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    let!(:some_user) { create(:user, first_name: 'Merlot', last_name:'Wine', discarded_at: nil)}

    before { sign_in admin }

    it 'returns http success' do
      delete :destroy, xhr: true, params: { id: some_user.id } 
      expect(response.status).to eq(200)
      expect(User.exists?(some_user.id)).to be_falsey
    end
  end
end
