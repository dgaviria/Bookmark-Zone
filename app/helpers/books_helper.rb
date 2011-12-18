module BooksHelper
  
  def userIsBookOwner?(currentUser)
    User.find(@book.user_id) == currentUser
  end
  
end
