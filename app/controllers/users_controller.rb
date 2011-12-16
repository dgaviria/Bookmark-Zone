class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Sign up"
  end
end
