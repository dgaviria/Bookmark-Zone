class User < ActiveRecord::Base
  attr_accessible :username, :first, :last
  
  #If we ever decide to add email
  #email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                        :length => { :maximum => 50 },
                        :uniqueness => { :case_sensitive => false }
end
