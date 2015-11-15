class Supplier < ActiveRecord::Base
  def self.find_by_name_and_address(name, address)
    Supplier.where(name: name, address: address).first
  end
end
