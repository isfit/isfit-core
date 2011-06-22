class Festival < ActiveRecord::Base
  has_many :sections
  has_many :groups
  has_and_belongs_to_many :roles

  validates_presence_of :year
  validates_numericality_of :year, :allow_blank => true

  def id_name
    {"id"=>id, "name"=>year.to_s}   
  end
  
  def self.name_like(q)
    where("year > 0")
  end

end
