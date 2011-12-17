require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :username, :first, :last, :password, :password_confirmation
  
  #If we ever decide to add email
  #email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                        :length => { :maximum => 50 },
                        :uniqueness => { :case_sensitive => false }
                        
  # Automatically create the virtual attribute 'password_confirmation'.
    validates :password, :presence     => true,
                         :confirmation => true,
                         :length       => { :within => 6..40 }
  def name
    "#{first} #{last}"
  end
  
  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
   def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
   end
   
   def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
   end

   def self.authenticate(username, submitted_password)
     user = find_by_username(username)
     return nil  if user.nil?
     return user if user.has_password?(submitted_password)
   end
   

  private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end