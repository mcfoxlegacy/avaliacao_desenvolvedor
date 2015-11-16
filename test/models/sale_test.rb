# coding: utf-8
require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  def test_import
    line = "João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza"
    sale = Sale.new
    sale.import(line)
    assert_equal(sale.buyer.name, 'João Silva')
    assert_equal(sale.description, 'R$10 off R$20 of food')
    assert_equal(sale.price, 10.0)
    assert_equal(sale.quantity, 2)
    assert_equal(sale.supplier.address, '987 Fake St')
    assert_equal(sale.supplier.name, "Bob's Pizza")
  end
end
