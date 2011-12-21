class Mark < ActiveRecord::Base
  belongs_to :book
  has_attached_file :image, :styles => { :large => "600x450>", :medium => "300x300>", :thumb => "100x100>" }
  # in order for this to work you must have imagemagick installed
  # brew install imagemagick
  attr_accessible :page, :note, :image
  
  validates :page, :presence => true,
                    :length => { :maximum => 10 }
  
  validates :note, :presence => true
  
end
