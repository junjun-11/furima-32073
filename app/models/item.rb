class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day_to_ship
  

  validates :image, presence: true

  has_one_attached :image
  belongs_to :user
end
