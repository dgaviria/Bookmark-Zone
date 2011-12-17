class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def signup
    @user = User.new(params[:user])
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      @title = "Sign up"
      render 'signup'
    end
  end
  
end
