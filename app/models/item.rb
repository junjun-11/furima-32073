class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
  end
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_to_ship_id
  end

  validates :selling_price, presence: true, numericality: { message: 'Half-width number' }, inclusion: { in: (300..9_999_999), message: 'Out of setting range' }

  has_one_attached :image
  belongs_to :user
end
