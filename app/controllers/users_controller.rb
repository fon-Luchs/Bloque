class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email))

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
