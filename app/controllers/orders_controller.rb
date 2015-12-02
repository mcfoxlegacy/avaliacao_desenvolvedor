class OrdersController < ActionController::Base
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def show
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:buyer, :description, :unity_price,
                                  :quantity, :address, :customer)
  end
end
