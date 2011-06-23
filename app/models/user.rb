class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :groups, :through => :positions
  has_and_belongs_to_many :positions
  belongs_to :country
  belongs_to :study_place
  
  has_many :users_roles
  has_many :users_role_abstraction
  has_many :roles, :through => :users_roles, :source => :role
  has_many :role_abstraction, :through => :users_role_abstraction, :source => :role
 
  def name
    "#{family_name}, #{given_name}"
  end

end
