require 'rails_helper'

describe SnsCredential, type: :model do
  describe  '#facebook validation' do
    before do
      Rails.application.env_config['omniauth.auth'] = facebook_mock
    end
    context '認可サーバーから返ってきたメールアドレスを、すでに登録済みのuserが持っていた場合' do
      let(:user) {create(:user, email: 'sample@test.com')}
      it "is valid with a name, email, provider, uid" do
        sns_credential = build(:sns_credential)
        expect(sns_credential).to be_valid
      end
    end
  end
end