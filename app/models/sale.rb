class Sale < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :supplier

  def import(line)
    line = line.split("\t")
    self.buyer = Buyer.find(line[0])
    self.description = line[1]
    self.price = line[2].to_f
    self.quantity = line[3].to_i
    self.supplier = Supplier.find_by_name_and_address(line[5], line[4])
  end
end
