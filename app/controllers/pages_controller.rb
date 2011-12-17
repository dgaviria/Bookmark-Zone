class PagesController < ApplicationController
  def home
    @title = "Mi casa es tu casa"
  end

  def about
    @title = "Who we are"
  end

end
