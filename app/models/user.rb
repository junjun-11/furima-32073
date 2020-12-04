class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
   validates :last_name
   validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } do
   validates :furigana_last
   validates :furigana_first
  end
  validates :date_of_birth, presence: true
       
end
