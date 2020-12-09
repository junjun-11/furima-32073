class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day_to_ship

  validates :item_name, presence: true
  validates :explanation, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :day_to_ship_id, numericality: { other_than: 1 } 

  validates :selling_price, presence: true

  validates :image, presence: true

  has_one_attached :image
  belongs_to :user
end
