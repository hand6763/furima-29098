class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" } do
      validates :sei
      validates :mei
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do  
      validates :sei_kana
      validates :mei_kana
    end
  
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6}\z/, message: "Include both letters and numbers" }
end