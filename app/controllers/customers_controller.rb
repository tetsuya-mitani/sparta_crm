class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:edit, :destroy, :update]

  def index
    @q = Customer.ransack(params[:q])
    @customers = @q.result.page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    # formから投げられたデータを受け取る
    @customer = Customer.new(customer_params)
    # これを保存する
    if @customer.save
      # show.html.erbに飛ばす
      # redirect_to "/customers/#{@customer.id}"
      redirect_to @customer
    else
      render :new
      # redirect_to "/customers/new"
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @customer.delete

    # show.html.erbに飛ばす
    # redirect_to "/customers"
    redirect_to customers_url
  end

  private
  def customer_params
    # customers.require(:key).permit(:filter)
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
      :company_id
    )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
