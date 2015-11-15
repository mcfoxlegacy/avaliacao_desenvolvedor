require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  def test_find_by_name_and_address
    @supplier1 = suppliers(:supplier1)
    assert_equal(@supplier1,
                 Supplier.find_by_name_and_address(@supplier1.name,
                                                   @supplier1.address))
    @supplier2 = suppliers(:supplier2)
    assert_equal(@supplier2,
                 Supplier.find_by_name_and_address(@supplier2.name,
                                                   @supplier2.address))
    assert_not_equal(@supplier1,
                     Supplier.find_by_name_and_address(@supplier2.name,
                                                       @supplier2.address))
    assert_nil(Supplier.find_by_name_and_address(@supplier1.name,
                                                 @supplier2.address))
  end
end
