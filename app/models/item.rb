class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 1, message: "Select" } do
      validates :category_id
      validates :deliver_fee_id
      validates :shipping_area_id
      validates :shipping_day_id
      validates :status_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :deliver_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :status

end
