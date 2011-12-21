class Mark < ActiveRecord::Base
  belongs_to :book
  has_attached_file :image, :styles => { :large => "600x450>", :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :page, :note
  
  validates :page, :presence => true,
                    :length => { :maximum => 10 }
  
  validates :note, :presence => true
  
end
