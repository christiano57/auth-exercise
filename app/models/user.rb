class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  after_initialize :set_default_role, :if => :new_record?
  
  has_secure_password

  def set_default_role
  	unless self.role
  		self.role = :user
  	end
  end
end
