require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  
  describe 'POST #create' do
    it "一覧表示に遷移するか" do
      item_params = FactoryBot.attributes_for(:item)
      post :create, params: {item:item_params}
      expect(response).to_not redirect_to root_path
    end
  end
end