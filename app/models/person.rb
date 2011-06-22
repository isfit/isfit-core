class Person < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  has_many :groups, :through => :positions
  has_and_belongs_to_many :positions
  belongs_to :country
  belongs_to :study_place
  
  has_many :people_roles
  has_many :people_role_abstraction
  has_many :roles, :through => :people_roles, :source => :role
  has_many :role_abstraction, :through => :people_role_abstraction, :source => :role
  
#  has_and_belongs_to_many :roles

#  has_many :roles

#FIXME: Fix dette her skikkelig
#  attr_accessible :username, :email, :password, :password_confirmation

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    person = find_by_username(login) || find_by_email(login)
    return person if person && person.password_hash == person.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def id_name
    {"id"=>id, "name"=>name}   
  end

  def role?(r)
    role = Role.where(:name=>r).first
    role_abstraction.include?(role)
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

  def name
    "#{family_name}, #{given_name}"
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
