class UsersController < ApplicationController
  def show
    @username = User.find(session[:user_id]).user_name
  end
end
