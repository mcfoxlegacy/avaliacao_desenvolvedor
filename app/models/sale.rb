class Sale < ApplicationRecord
    belongs_to :customer
    belongs_to :address
    belongs_to :vendor

    validates_presence_of :description, :unit_price, :quantity, :customer,
                        :address, :vendor
end
