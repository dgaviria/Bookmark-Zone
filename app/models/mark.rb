class Mark < ActiveRecord::Base
  belongs_to :book
  attr_accessible :page, :note
  
  validates :page, :presence => true
  
    
  validates :note, :presence => true,
                     :length => { :maximum => 50 }
end
