class GroupsController < ApplicationController
  def show
    @group = Group.find_by_id(params[:id])
    set_where_am_i(@group)
  end

  def new
    @group = Group.new
    @group.festival = Festival.find_by_id(params[:festival_id])
    @group.section = Section.find_by_id(params[:section_id])
  end

  def create
    @group = Group.new(params[:group])
    @group.festival = Festival.find_by_id(params[:festival_id])
    @group.section = Section.find_by_id(params[:section_id])
    save_group
  end

  def edit
    @group = Group.find_by_id(params[:id])
    render(:action => 'new')
  end

  def update
    @group = Group.find_by_id(params[:id])
    @group.attributes = params[:group]
    save_group
  end

  def index
    @groups = Group.name_like(params[:q])
    respond_to do |format|
      format.json { render :json => @groups.map(&:id_name) }
    end
  end

  private

  def save_group
    if @group.save
      redirect_to(group_path(@group))
    else
      render(:action => 'new')
    end
  end
end
