class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
    @orders.map do |order|
      check_remain_amount(order)
    end
  end

  def show
    @terms = Term.where(order: @order)
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

  def edit
  end

  def update
    @order.update(order_params)

    if @order.save
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

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
