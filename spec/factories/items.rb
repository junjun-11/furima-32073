FactoryBot.define do
  factory :item do
    item_name { 'テスト' }
    explanation      { 'テストだよ' }
    category_id      { 1 }
    status_id        { 1 }
    delivery_fee_id  { 1 }
    prefecture_id    { 1 }
    day_to_ship_id   { 1 }
    selling_price    { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
