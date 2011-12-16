class PagesController < ApplicationController
  def home
    @title = "home"
  end

  def about
    @title = "Daniel is gay"
  end

end
