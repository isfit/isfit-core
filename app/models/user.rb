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
  def self.name_like(q)
    query = ""
    query = "given_name like '%#{q}%' OR family_name like '%#{q}%'"
    unless q.nil?
      if q.split(' ').count > 1
        q.split(' ').each do |qu| 
          query += " OR given_name like '%#{qu}%' OR family_name like '%#{qu}%'" 
        end
      end
    end
    where(query)
  end
  def id_name
    {"id"=>id, "name"=>name}   
  end

  def role?(r)
    role = Role.where(:name=>r).first
    role_abstraction.include?(role)
  end

end
