class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      flash[:success] = "Share your thoughts!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def secure_params
      p params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
# end private
end