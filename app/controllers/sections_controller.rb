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
    redirect_to(festival_path(params[:festival_id]))
  end

  private

  def save_section
    if @section.save
      redirect_to(festival_section_path(@section.festival,@section))
    else
      render(:action => 'new')
    end
  end
end
