class UsersController < ApplicationController
  before_action :load_user, only: [:destroy, :show, :update]
  def index
    @users = User.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @users }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end

  end

  def show
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @user }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :gender)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
