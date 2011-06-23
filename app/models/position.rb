class Position < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
  has_and_belongs_to_many :groups
  belongs_to :group

  validates_presence_of :title_en, :title_no
  attr_reader :group_tokens, :user_tokens

  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end
end
