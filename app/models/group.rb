class Group < ActiveRecord::Base
  belongs_to :section
  belongs_to :festival
  has_and_belongs_to_many :positions
  has_and_belongs_to_many :roles

  scope :organization_groups, :conditions => {:section_id => nil, :festival_id => nil}

  def id_name
    if(section.nil?)
      {"id"=>id, "name"=>"#{festival.year.to_s} - #{name_en}"}   
    else
      {"id"=>id, "name"=>"#{section.festival.year.to_s} - #{section.name_en} - #{name_en}"}  
    end
  end
  
  def self.name_like(q)
    where("name_en like '%#{q}%' OR name_no like '%#{q}%'")
  end
end
