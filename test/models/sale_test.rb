# -*- encoding : utf-8 -*-
require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  def file
    <<eof
Comprador	descrição	Preço Uniário	Quantidade	Endereço	Fornecedor
João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	R$30 of awesome for R$10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
Marty McFly	R$20 Sneakers for R$5	5.0	1	123 Fake St	Sneaker Store Emporium
Snake Plissken	R$20 Sneakers for R$5	5.0	4	123 Fake St	Sneaker Store Emporium
eof
  end

  def line
    "João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza"
  end

  def blanck_file
    ''
  end

  def invalid_file
    <<eof
Comprador	descrição	Preço Uniário	Quantidade	Endereço	Fornecedor
eof
  end

  def test_import
    sale = Sale.new
    sale.import(line)
    assert_equal(sale.buyer.name, 'João Silva')
    assert_equal(sale.description, 'R$10 off R$20 of food')
    assert_equal(sale.price, 10.0)
    assert_equal(sale.quantity, 2)
    assert_equal(sale.supplier.address, '987 Fake St')
    assert_equal(sale.supplier.name, "Bob's Pizza")
  end

  def test_import_file
    sales_count = Sale.all.count
    Sale.import_file(file)
    assert_equal(sales_count + 4, Sale.all.count)

    sale = Sale.last
    assert_equal('Snake Plissken', sale.buyer.name)
    assert_equal('R$20 Sneakers for R$5', sale.description)
  end

  def test_error_import_blanck_file
    sales_count = Sale.all.count
    exception = assert_raise(Exception) { Sale.import_file(blanck_file) }
    assert_equal(sales_count, Sale.all.count)
    assert_equal('Invalid file', exception.message)
  end

  def test_error_import_invalid_file
    sales_count = Sale.all.count
    exception = assert_raise(Exception) { Sale.import_file(blanck_file) }
    assert_equal(sales_count, Sale.all.count)
    assert_equal('Invalid file', exception.message)
  end

  def test_import_return_total_revenue
    assert_equal(95.0, Sale.import_file(file))
  end
end
