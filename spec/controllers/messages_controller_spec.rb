require 'rails_helper'

describe MessagesController do
  login_user
  let(:group) { create(:group) }
  
  describe 'GET #index' do
    it "renders the :index template" do
      get :index, group_id: group.id
      expect(response).to render_template :index
    end
  end
end
