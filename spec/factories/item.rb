FactoryBot.define do

  factory :item do
    association :user, factory: :user,strategy: :build
    id {1}
    name              {"ケニア　マサイAA"}
    price                 {"3000"}
    text              {"深煎り。酸味はない。"}
    user_id {1}
    condition {"未使用に近い"}
    size {"XS(SS)"}
    way {"未定"}
    date {"2~3日で発送"}
    berser {"着払い(購入者負担)"}
    region {"青森県"}
    category_id {6}
    brand_id {27}
    

  end

end