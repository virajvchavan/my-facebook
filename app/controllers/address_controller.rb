class AddressController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @address = @user.address.create(address_params)
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:user_id])
    @address = @user.address.update(address_params)
    redirect_to user_path(@user)
  end

  private
  def address_params
    params.require(:address).permit(:city, :state, :country)
  end
end
