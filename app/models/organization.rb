class Organization
  def self.festivals
    Festival.all(:order => 'year desc')
  end

  def self.groups
    Group.organization_groups(:order => :name)
  end
end