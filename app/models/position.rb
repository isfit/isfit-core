class Position < ActiveRecord::Base
  belongs_to :person
  has_and_belongs_to_many :people
  has_and_belongs_to_many :groups
  belongs_to :group

  validates_presence_of :title_en, :title_no
  attr_reader :group_tokens, :person_tokens

  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
  def person_tokens=(ids)
    self.person_ids = ids.split(",")
  end
end
