class CustomersController < ApplicationController
  def index
    @customers = Customer.all
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
    @customer = Customer.find(params[:id])
  end

  def update
    # formから投げられたデータを受け取る
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    # formから投げられたデータを受け取る
    @customer = Customer.find(params[:id])
    @customer.delete

    # show.html.erbに飛ばす
    redirect_to "/customers"
  end

  private
  def customer_params
    # customers.require(:key).permit(:filter)
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
    )
  end
end
