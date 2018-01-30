class AddressesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @user.address.create(address_params)
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:user_id])
    @user.address.update(address_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
  end

  private
  def address_params
    params.require(:address).permit(:city, :state, :country)
  end
end
