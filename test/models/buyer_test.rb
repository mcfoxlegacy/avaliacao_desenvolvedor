require 'test_helper'

class BuyerTest < ActiveSupport::TestCase
  def test_find_by_name
    @buyer1 = buyers(:buyer1)
    assert_equal(@buyer1, Buyer.find_by_name(@buyer1.name))

    @buyer2 = buyers(:buyer2)
    assert_equal(@buyer2, Buyer.find_by_name(@buyer2.name))
  end

  def test_find_by_name_new_name
    new_name = 'Buyer 3'
    buyer = Buyer.find(new_name)
    assert_not_nil(buyer)
    assert_not_nil(buyer.id)
    assert_not_nil(buyer.created_at)
    assert_not_nil(buyer.updated_at)
    assert_equal(new_name, buyer.name)
  end
end
