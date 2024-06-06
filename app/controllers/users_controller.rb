class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/"
  end
end