class Section < ActiveRecord::Base
  belongs_to :festival
  has_many :groups
end
