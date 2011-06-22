class PeopleController < ApplicationController
#  before_filter :login_required, :except => [:new, :create, :index]

  def new
    @person = Person.new
    @position = Position.find_all_by_person_id(@person.id)
    @person.positions << @position
  end


  def show
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      session[:person_id] = @person.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @person = current_person
  end

  def update
    @person = current_person
    if @person.update_attributes(params[:person])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end

  def index
    @people = Person.name_like(params[:q])
    respond_to do |format|
      format.json { render :json => @people.map(&:id_name) }
    end
  end
end
