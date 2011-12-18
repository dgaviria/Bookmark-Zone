class BooksController < ApplicationController
  def new
    @title = "Add book"
    @book = Book.new
  end
  
  def index
    @title = "All Books"
    @books = Book.all
  end
  
  def create
    @book = current_user.books.new(:title => params[:book][:title],
                        :author => params[:book][:author])
    if @book.save
      flash.now[:success] = "Book Created!"
      redirect_to @book
    else
      flash.now[:error] = "Book could not be created."
      @title = "Add book"
      render 'new'
    end
  end
  def show
    @book = Book.find(params[:id])
    @title = @book.title
    @mark = Mark.new
    @user = User.find(@book.user_id)
    @user_is_book_owner = (@user == current_user)
  end
  
  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book Deleted."
    redirect_to book_path
  end

end
