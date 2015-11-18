# -*- encoding : utf-8 -*-
class Supplier < ActiveRecord::Base
  def self.find_by_name_and_address(name, address)
    supplier = Supplier.where(name: name, address: address).first
    if supplier.nil?
      Supplier.create(name: name, address: address)
    else
      supplier
    end
  end
end
