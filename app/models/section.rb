class Section < ActiveRecord::Base
  belongs_to :festival
  has_many :groups
  has_and_belongs_to_many :roles

  def id_name
    {"id"=>id, "name"=>"#{festival.year.to_s} - #{name_en}"}   
  end
  
  def self.name_like(q)
    where("name_en like '%#{q}%' OR name_no like '%#{q}%'")
  end

end
