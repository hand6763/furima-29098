class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, :municipality, :address, :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

   def save
    Order.create
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, user_id: user.id)
   end
end