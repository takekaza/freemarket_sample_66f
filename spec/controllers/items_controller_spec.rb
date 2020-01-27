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
      # 商品一覧表示のテスト
  describe 'GET #index' do
    it "populates an array of items" do
      items = create_list(:item, 1) 
      get :index
      expect(assigns(:item)).to match(items)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  # 商品詳細表示のテスト
  describe "GET #show" do
    it "renders the :show template" do
      get :show, params: {id: 1}
    end
  end

  # 商品削除のテスト
  describe "delete #destroy" do

    it "deletes the item" do
      @item = create_list(:item,1)
      expect do
        delete :destroy, params: {item: @item}
      end.to change(Item,:count).by(-1)
    end
  end
end