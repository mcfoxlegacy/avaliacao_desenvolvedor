require 'rails_helper'

describe Sale do
  describe 'Create' do
    before do
      @customer = create_or_find_customer
      @address = create_or_find_address
      @vendor = create_or_find_vendor
      @sale = Sale.new(sale_params.merge({ 
        customer: @customer, address: @address, vendor: @vendor
      }))
    end

    context 'with success' do
      it 'create sale' do
        sale = @sale.save!
        expect(sale).to eq(true)
      end
    end

    context 'fails' do
      it 'does not create sale without customer' do
        sale = Sale.new(sale_params.merge({ 
          address: @address, vendor: @vendor
        }))
        expect {
          sale.save
        }.to change { Sale.count }.by(0)
      end

      it 'does not create sale without address' do
        sale = Sale.new(sale_params.merge({ 
          customer: @customer, vendor: @vendor
        }))
        expect {
          sale.save
        }.to change { Sale.count }.by(0)
      end

      it 'does not create sale without vendor' do
        sale = Sale.new(sale_params.merge({ 
          customer: @customer, address: @address
        }))
        expect {
          sale.save
        }.to change { Sale.count }.by(0)
      end
    end
  end

  def sale_params
    { description: 'Oferta nova de Cereal', quantity: 6, unit_price: 10.0}
  end

  def create_or_find_customer
    customer = Customer.where(name: customer_params[:name]).last
    customer ||= Customer.create!(customer_params)
  end

  def create_or_find_address
    address = Address.where(name: address_params[:name]).last
    address ||= Address.create!(address_params)
  end

  def create_or_find_vendor
    vendor = Vendor.where(name: vendor_params[:name]).last
    vendor ||= Vendor.create!(vendor_params)
  end

  def customer_params
    { name: "João Pedro" }
  end

  def address_params
    { name: "Rua Almirante Saboia" }
  end

  def vendor_params
    { name: "Bob's" }
  end
end
