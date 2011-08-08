class PositionsController < ApplicationController
  def show
    @position = Position.find(params[:id])  
  end

  def new
    @position = Position.new
    @group = Group.find_by_id(params[:group_id])
    @groups = []
    groups = Festival.find_by_year(session[:festival_year]).groups
    for group in groups
      @groups.push(group)
    end
    sections = Festival.find_by_year(session[:festival_year]).sections
    for section in sections
      for group in section.groups
        @groups.push(group)
      end
    end
  end

  def create
    @position = Position.new(params[:position])
    @position.admission_id = 1
    @group = Group.find_by_id(params[:group_id])
    @position.groups << @group
    if @position.save
      redirect_to @position, :notice => "Successfully created position."
    else
      render :action => 'new'
    end
  end

  def edit
    @position = Position.find_by_id(params[:id])
    @groups = Group.find(:all)
    @group = Group.find_by_id(params[:group_id])
  end

  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(params[:position])
       redirect_to @position, :notice => "Successfully created position."
    else
      render :action => 'edit'
    end 
  end

end
