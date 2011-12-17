class Book < ActiveRecord::Base
  belongs_to :user
  has_many :marks
  attr_accessible :title, :author
  
  
  validates :title, :presence => true,
                    :length => { :maximum => 50 },
                    :uniqueness => { :case_sensitive => false }
  
  validates :author, :presence => true,
                     :length => { :maximum => 50 }
                    
  def name
    "#{title} by #{author}"
  end
  
end