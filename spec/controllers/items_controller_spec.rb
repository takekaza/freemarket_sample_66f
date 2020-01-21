require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }
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
end