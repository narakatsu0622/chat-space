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
      get :index, group_id: group.id
    end

      it "assigns the requested contact @message" do
          expect(assigns(:message)).to be_a_new(Message)
      end

      it "renders the :index template" do
          expect(response).to render_template :index
      end
  end

  describe 'POST #create' do
    it "saves the new contact in the database" do
      expect {
        post :create, { group_id: group.id, message: attributes_for(:message) }
      }.to change(Message, :count).by(1)
    end

    context 'create successful' do
      example ": create successful to render the :index template" do
        post :create, { group_id: group.id, message: attributes_for(:message) }
        expect(response).to redirect_to(group_id: group.id)
      end
    end
    context 'create unsuccessful' do
      example ": create unsuccessful to render the same template" do
        post :create, { group_id: group.id, message: invalid_attributes }
        expect(response).to render_template :index, group_id: group.id
      end
    end
  end
end
