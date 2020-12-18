FactoryBot.define do
  factory :user_purchase do
    postal_code     { '123-4567' }
    prefecture_id   { 1 }
    municipality    { '岡山市' }
    house_number    { '1-1' }
    building_name   { '岡山ハイツ' }
    phone_number    { 11_111_111_111 }
    token           { 'tok_abcdefghijk00000000000000000' }
    user_id         { 1 }
    item_id         { 1 }
  end
end
