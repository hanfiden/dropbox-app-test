class TermsController < ApplicationController
  before_action :find_order, only: [:new, :create, :edit, :update]
  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    @term.order = @order

    if @term.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  # def edit

  # end

  # def update

  # end

  private

  def find_order
    @order = Order.find(params[:order_id])
  end

  def term_params
    params.require(:term).permit(:due_date, :amount, :file)
  end
end
