class Order < ActiveRecord::Base
  validates :buyer, :description, :unity_price, :quantity, :address, :customer,
            presence: true
end
