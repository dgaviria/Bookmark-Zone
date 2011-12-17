require 'digest'
class Book < ActiveRecord::Base
  attr_accessor :title, :author, :uid
  
  validates :title, :presence => true,
                    :length => { :maximum => 50 },
                    :uniqueness => { :case_sensitive => false }
  
  validates :author, :presence => true,
                     :length => { :maximum => 50 }
                    
  def name
    "#{title} by #{author}"
  end
  
end