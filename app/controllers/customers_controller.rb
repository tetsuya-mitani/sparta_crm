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
    @customer.save
    # show.html.erbに飛ばす
    redirect_to "/customers/#{@customer.id}"
  end

  def edit
    @customer = Post.find(params[:id])
  end

  def update
    # formから投げられたデータを受け取る
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)

    # show.html.erbに飛ばす
    redirect_to "/customers/#{@customer.id}"
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    # formから投げられたデータを受け取る
    @customer = Customer.find(params[:id])
    @custoemr.delete

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
