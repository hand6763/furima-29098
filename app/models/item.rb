class Item < ApplicationRecord
  has_one_attached :image

  belongs to :users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :deliver_fee
  belongs_to :shiooing_area
  belongs_to :shiooing_day
  belongs_to :status

end
