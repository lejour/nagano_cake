class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to customers_current_customer_path(@customer)
    else
      render :edit
    end

  end

  def confirm_withdraw
    @customer = Customer.find_by(name: params[:email])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:email])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end


end
