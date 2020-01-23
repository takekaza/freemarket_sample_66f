FactoryBot.define do
  factory :sns_credential, class: SnsCredential do
    provider {"google_oauth2"}
    uid {"12345"}
    user
  end
  
end