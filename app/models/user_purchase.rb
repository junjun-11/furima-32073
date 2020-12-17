class UserPurchase
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token, :hoge
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly'}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{1,11}\z/, message: 'Input only number'}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end   
end