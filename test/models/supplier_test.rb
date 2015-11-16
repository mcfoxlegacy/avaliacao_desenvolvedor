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

    supplier = Supplier.find_by_name_and_address(@supplier1.name,
                                                 @supplier2.address)
    assert_not_nil(supplier)
    assert_not_nil(supplier.id)
    assert_not_nil(supplier.created_at)
    assert_not_nil(supplier.updated_at)
    assert_equal(@supplier1.name, supplier.name)
    assert_equal(@supplier2.address, supplier.address)
  end
end
