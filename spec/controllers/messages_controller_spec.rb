require 'rails_helper'

describe MessagesController do
  login_user
  let(:group) { create(:group) }
  let(:invalid_attributes){ FactoryGirl.attributes_for(:message, body: nil) }

  it "have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe 'GET #index' do
    before :each do
      get :index, params: { group_id: group.id }
    end

    it "assigns the requested contact @message" do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new contact in the database" do
        expect {
          post :create, params: { group_id: group.id, message: attributes_for(:message) }
        }.to change(Message, :count).by(1)
      end

      it " create successful to render the :index template" do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
        expect(response).to redirect_to(group_id: group.id)
      end

      it 'shows notice a message' do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
        expect(flash[:notice]).to include('メッセージが投稿されました')
      end
    end

    context 'with invalid attributes' do
      it 'can not the new contact in the database' do
        expect{
          post :create, params: { group_id: group.id, message: invalid_attributes }
          }.to change(Message, :count).by(0)
      end

      it " create unsuccessful to render the same template" do
        post :create, params: { group_id: group.id, message: invalid_attributes }
        expect(response).to render_template :index, group_id: group.id
      end

      it 'shows alert a message' do
        post :create, params: { group_id: group.id, message: invalid_attributes }
        expect(flash[:alert]).to include('メッセージを入力してください')
      end
    end
  end
end
