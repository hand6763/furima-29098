class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :sei, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
  validates :mei, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
  validates :sei_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :mei_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6}\z/, message: "Include both letters and numbers" }
end
