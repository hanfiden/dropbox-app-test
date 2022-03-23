class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @terms = Term.where(order: @order)
    @term = Term.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :client_name, :order_date, :total_amount)
  end
end
