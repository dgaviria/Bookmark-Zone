module BooksHelper
  
  def userIsBookOwner?(currentUser)
    User.find(@book.user_id) == currentUser
  end
  
  def good_reads_widget
    require 'open-uri'

    begin

    	bookuri = 'http://www.goodreads.com/book/title?format=json&author=' + @book.author + '&title=' + @book.title + '&key=LNsDBhLQTvWd1JSdLIUXQ'
    	j = open bookuri.tr(' ','+')

    	string = j.string

    	allReviews = ActiveSupport::JSON.decode(string)
    	allReviewsCode = allReviews["reviews_widget"]

    rescue Exception=>e
    	allReviewsCode = "Could not Good Reads"
    end
    
    return allReviewsCode
  end
    
end
