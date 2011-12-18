class Mark < ActiveRecord::Base
  belongs_to :book
  attr_accessible :page, :note
  
  validates :page, :presence => true,
                    :length => { :maximum => 10 }
  
  validates :note, :presence => true
  
end
