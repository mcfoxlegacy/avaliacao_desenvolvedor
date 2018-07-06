class SalesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @sales = Sale.all
  end

  def new
  end

  def create
    byebug
    document = sale_upload_params[:file].read.force_encoding('UTF-8')
    document = document.split("\n")
    document.shift
    @data = []
    document.each {|i| @data.push(i.split("\t")) }
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy!
    redirect_to sales_path, notice: I18n.t('sales.delete.success')
  end

  def import
    uploaded_file = sale_upload_params[:file]
    file_content = uploaded_file.read.force_encoding('UTF-8')
    rows = file_content.to_s.split(/\n/)
    gross_amout = 0.0
    rows.each.with_index do |row, idx|
      if idx > 0
        col = row.to_s.split(/\t/)
        customer_name = col[0]
        description = col[1]
        unit_price = Float(col[2])
        quantity = Float(col[3])
        address = col[4]
        vendor_name = col[5]
        gross_amout += unit_price * quantity
        @sale = CreateSaleService.new(params:{
          customer_name: customer_name, description: description, unit_price: unit_price, quantity: quantity, address: address, vendor_name: vendor_name
        }).call!
      end
    end
    gross_amout = number_to_currency(gross_amout, unit: 'R$ ', precision: 2, separator: ",", delimiter: ".")
    redirect_to sales_path, flash: {notice: I18n.t('sales.new.success', value: gross_amout)}
  end

  private
    def sale_upload_params
      params.permit(:file)
    end
end
