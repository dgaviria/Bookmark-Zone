class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @book = Book.new
  end
  
  def new
    @user = User.new(params[:user])
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Bookmark Zone!"
      redirect_to root_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
end
