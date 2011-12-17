class BooksController < ApplicationController
  def new
    @title = "Add book"
    @book = Book.new
  end
  
  def index
    @title = "All Books"
    @users = Book.all
  end
  
  def create
    book = current_user.books.create!(:title => params[:book][:title],
                        :author => params[:book][:author])
    if book.nil?
      flash.now[:error] = "Book could not be created."
      @title = "Add book"
      render 'new'
    else
      flash.now[:success] = "Book Created!"
      redirect_to book
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @title = @book.title
    @mark = Mark.new
  end
  
  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book Deleted."
    redirect_to book_path
  end

end
