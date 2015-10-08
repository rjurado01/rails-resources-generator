require 'rails_helper'

describe YYYController do
  set_content_type "application/json"

  before :all do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    let(:result){ JSON::parse(response.body)['xxx'] }

    context "when all is ok" do
      before{ sign_in @user }

      it "returns 200 Http status code" do
        get :index, format: :json
        expect(response).to have_http_status(200)
      end
    end

    context "when user is not logged" do
      it "returns 401 Http status code" do
        get :index, format: :json
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "GET #show" do
    let(:result){ JSON::parse(response.body)['xxx'] }

    before :all do
      @id = FactoryGirl.create(:xxx).id.to_s
    end

    context "when all is ok" do
      before{ sign_in @user }

      it "returns 200 Http status code" do
        get :show, format: :json, id: @id
        expect(response).to have_http_status(200)
      end
    end

    context "when user is not allowed" do
      before{ sign_in @user2 }

      it "returns 403 Http status code" do
        get :show, format: :json, id: @id
        expect(response).to have_http_status(403)
      end
    end

    context "when user is not logged" do
      it "returns 401 Http status code" do
        get :show, format: :json, id: @id
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "POST #create" do
    let(:attributes) { FactoryGirl.attributes_for(:xxx) }

    before do
      XXX.destroy_all
    end

    context "when all is ok" do
      before{ sign_in @user }

      it "creates resource" do
        expect {
          post :create, format: :json,  xxx: attributes
        }.to change(XXX, :count).by(1)
        expect(response).to have_http_status(201)
      end
    end

    context "when user is not allowed" do
      before{ sign_in @user2 }

      it "returns 403 Http status code" do
        expect {
          post :create, format: :json, xxx: attributes
        }.to change(XXX, :count).by(0)
        expect(response).to have_http_status(403)
      end
    end

    context "when user is not logged" do
      it "returns 401 Http status code" do
        expect {
          post :create, format: :json, xxx: attributes
        }.to change(XXX, :count).by(0)
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "PUT #update" do
    before do
      @new_xxx = FactoryGirl.create(:xxx)
      @id = @new_xxx.id.to_s
    end

    context 'when all is ok' do
      before{ sign_in @user }

      it 'updates resource' do
        put :update, format: :json, id: @id, xxx: {key: 'new_value'}
        expect(@new_xxx.reload.key).to eq('new_value')
      end
    end

    context 'when user is not allowed' do
      before{ sign_in @user2 }

      it 'returns 403 Http status' do
        put :update, format: :json, id: @id, xxx: {key: 'new_value'}
        expect(@new_xxx.reload.key).not_to eq('new_value')
        expect(response).to have_http_status(403)
      end
    end

    context 'when user is not logged' do
      it 'returns 401 Http status' do
        put :update, format: :json, id: @id, xxx: {key: 'new_value'}
        expect(@new_xxx.reload.key).not_to eq('new_value')
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @id = FactoryGirl.create(:xxx).id.to_s
    end

    context 'when all is ok' do
      before{ sign_in @user }

      it 'removes resource' do
        expect {
          delete :destroy, format: :json, id: @id
        }.to change(XXX, :count).by(-1)
      end
    end

    context 'when user is not allowed' do
      before{ sign_in @user2 }

      it 'returns 403 Http status' do
        expect {
          delete :destroy, format: :json, id: @id
        }.to change(XXX, :count).by(0)
        expect(response).to have_http_status(403)
      end
    end

    context 'when user is not logged in' do
      it 'returns 401 Http status' do
        expect {
          delete :destroy, format: :json, id: @id
        }.to change(XXX, :count).by(0)
        expect(response).to have_http_status(401)
      end
    end
  end
end
