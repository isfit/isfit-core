class Role < ActiveRecord::Base
  has_many :people_roles
  has_many :people_role_abstraction
  has_many :people, :through => :people_roles, :source => :person
  has_many :people_abstraction, :through => :people_role_abstraction, :source => :person

  has_and_belongs_to_many :sections
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :festivals

  attr_accessible :name, :person_tokens, :section_tokens, :group_tokens, :festival_tokens
  attr_reader :person_tokens, :section_tokens, :group_tokens, :festival_tokens

  def person_tokens=(ids)
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
