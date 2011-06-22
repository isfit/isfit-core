class FestivalsController < ApplicationController
  def show
    @festival = Festival.find_by_id(params[:id])
    session[:festival_year] = @festival.year
    set_where_am_i(@festival)
  end

  def new
    @festival = Festival.new
  end

  def create
    @festival = Festival.new(params[:festival])
    save_festival
  end

  def edit
    @festival = Festival.find_by_id(params[:id])
    render(:action => 'new')
  end

  def update
    @festival = Festival.find_by_id(params[:id])
    @festival.attributes = params[:festival]
    save_festival
  end

  def index
    @festivals = Festival.name_like(params[:q])
    respond_to do |format|
      format.json { render :json => @festivals.map(&:id_name) }
    end
  end

  private

  def save_festival
    if @festival.save
      redirect_to(festival_path(@festival))
    else
      render(:action => 'new')
    end
  end
end
