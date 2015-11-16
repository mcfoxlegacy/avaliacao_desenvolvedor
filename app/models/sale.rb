class Sale < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :supplier

  # Splits the sale line and creates a sale object
  def import(line)
    line = line.split("\t")
    self.buyer = Buyer.find(line[0])
    self.description = line[1]
    self.price = line[2].to_f
    self.quantity = line[3].to_i
    self.supplier = Supplier.find_by_name_and_address(line[5], line[4])
    save
  end

  # Imports a sales file, which content is passed as parameter
  def self.import_file(file)
    file.split("\n").each_with_index do |line, index|
      if index > 0 # Ignores first line (Header line)
        sale = Sale.new
        sale.import(line)
      end
    end
  end
end
