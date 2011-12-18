class MarksController < ApplicationController
  def new
  end
  
  def create
    book_id = params[:mark][:book_id]
    current_book = Book.find(book_id)
    @mark = current_book.marks.new(:page => params[:mark][:page],
                        :note => params[:mark][:note])
    if @mark.save
      flash.now[:success] = "Mark Created!"
      redirect_to current_book
    else
      flash.now[:error] = "Mark could not be created."
      @title = "Add mark"
      redirect_to current_book
      #this is a BUG it should render current_book showing the mark errs
    end
  end
  
  def edit
    @mark = Mark.find(params[:id])
    @title = "Edit mark"
  end
  
  def update
    @mark = Mark.find(params[:id])
    if @mark.update_attributes(params[:mark])
      flash[:success] = "Mark updated."
      redirect_to @mark
    else
      @title = "Edit mark"
      render 'edit'
    end
  end
  
  def show
    @mark = Mark.find(params[:id])
    @title = "Page #{@mark.page}"
  end
  
  def destroy
    Mark.find(params[:id]).destroy
    flash[:success] = "Mark Deleted."
    redirect_to book_path
  end
end
