class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is invalid. Input wrong characters."}
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input half-width characters."}
    validates :birth_date
  end
  with_options presence: true, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters."} do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters."} do
    validates :last_name_kana
    validates :first_name_kana
  end
  has_many :items
end
