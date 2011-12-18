module MarksHelper
  
  def current_book
    @current_book = Book.find(@mark.book_id)
  end
  
end
