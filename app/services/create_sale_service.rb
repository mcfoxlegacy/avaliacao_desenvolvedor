class CreateSaleService
    attr_reader :sale
  
    def initialize(params:)
      @params = params
      @sale = Sale.new(sale_params)
      @customer = Customer.where(name: params[:customer_name]).last
      @customer ||= Customer.create!(name: params[:customer_name])
      @address = Address.where(name: params[:address]).last
      @address ||= Address.create!(name: params[:address])
      @vendor = Vendor.where(name: params[:vendor_name]).last
      @vendor ||= Vendor.create!(name: params[:vendor_name])
    end
  
    def call!
      ActiveRecord::Base.transaction do
        @sale.customer = @customer
        @sale.address = @address
        @sale.vendor = @vendor
        @sale.save!
      end
      @sale
    rescue ActiveRecord::RecordInvalid
      false
    end
  
    private
  
      attr_reader :params

      def sale_params
        @params.except(:customer_name, :vendor_name, :address)
      end
  end
  