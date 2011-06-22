class SectionsController < ApplicationController
  def show
    @section = Section.find_by_id(params[:id])
    set_where_am_i(@section)
  end

  def new
    @section = Section.new
    @section.festival = Festival.find_by_id(params[:festival_id])
  end

  def create
    @section = Section.new(params[:section])
    @section.festival = Festival.find_by_id(params[:festival_id])
    save_section
  end

  def edit
    @section = Section.find_by_id(params[:id])
    render(:action => 'new')
  end

  def update
    @section = Section.find_by_id(params[:id])
    @section.attributes = params[:section]
    save_section
  end

  def index
    @sections = Section.name_like(params[:q])
    respond_to do |format|
      format.json { render :json => @sections.map(&:id_name) }
    end
  end

  private

  def save_section
    if @section.save
      redirect_to(section_path(@section))
    else
      render(:action => 'new')
    end
  end
end
