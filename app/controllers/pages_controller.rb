class PagesController < ApplicationController
  def home
    @title = "Mi casa es tu casa"
    if signed_in?
      @user = current_user
      @book = Book.new
    end
  end

  def about
    @title = "Who we are"
  end
  
end
