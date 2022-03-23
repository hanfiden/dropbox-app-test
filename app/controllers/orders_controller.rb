class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders.map do |order|
      check_remain_amount(order)
    end
  end

  def show
    @order = Order.find(params[:id])
    @terms = Term.where(order: @order)
    @term = Term.new
    check_remain_amount(@order)
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

  def check_remain_amount(order)
    order.remains_amount = calculate_remain_amount(order, order.terms)
  end

  def calculate_remain_amount(order, terms)
     order.total_amount - sum_of_terms_amount(terms)
  end

  def sum_of_terms_amount(terms)
    terms.map { |term| term.amount }.sum
  end

  def order_params
    params.require(:order).permit(:name, :client_name, :order_date, :total_amount)
  end
end
