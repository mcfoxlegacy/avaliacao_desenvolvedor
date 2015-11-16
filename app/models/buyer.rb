class Buyer < ActiveRecord::Base
  # Overrides the find_by_name method to create the new buyer if
  # there are no other with the name passed as parameter
  def self.find(name)
    buyer = find_by_name(name)
    if buyer.nil?
      Buyer.create(name: name)
    else
      buyer
    end
  end
end
