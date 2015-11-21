# -*- encoding : utf-8 -*-
class Sale < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :supplier

  attr_accessor :upload_file

  # Splits the sale line and creates a sale object
  def import(line)
    line = line.split("\t")
    fail 'Invalid file' if line.count != 6

    self.buyer = Buyer.find(line[0])
    self.description = line[1]
    self.price = line[2].to_f
    self.quantity = line[3].to_i
    self.supplier = Supplier.find_by_name_and_address(line[5], line[4])
    if save
      price * quantity
    else
      false
    end
  end

  # Imports a sales file, which content is passed as parameter
  def self.import_file(file)
    fail 'Invalid file' if file.split("\n").count <= 1
    total_revenue = 0.0
    file.split("\n").each_with_index do |line, index|
      if index > 0 # Ignores first line (Header line)
        sale = Sale.new
        ret = sale.import(line)
        fail 'Import problem' if ret == false
        total_revenue += ret.to_f
      end
    end
    total_revenue
  end
end
