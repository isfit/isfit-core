class Role < ActiveRecord::Base
  has_many :users_roles
  has_many :users_role_abstraction
  has_many :users, :through => :users_roles, :source => :user
  has_many :users_abstraction, :through => :users_role_abstraction, :source => :user

  has_and_belongs_to_many :sections
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :festivals

  attr_accessible :name, :user_tokens, :section_tokens, :group_tokens, :festival_tokens
  attr_reader :user_tokens, :section_tokens, :group_tokens, :festival_tokens

  def user_tokens=(ids)
    self.person_ids = ids.split(",")
  end
  def section_tokens=(ids)
    self.section_ids = ids.split(",")
  end
  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
  def festival_tokens=(ids)
    self.festival_ids = ids.split(",")
  end

end
