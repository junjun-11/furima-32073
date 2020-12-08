FactoryBot.define do
  factory :user do
    nickname              { '太郎' }
    email                 { 'taro@example' }
    password              { '11111a' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    furigana_last         { 'ヤマダ' }
    furigana_first        { 'タロウ' }
    date_of_birth         { 19_300_101 }
  end
end
