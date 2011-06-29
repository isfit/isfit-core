class SessionsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  def new
  end

  def create
    user = User.find_by_username(params[:login])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    elsif user
      flash.now[:alert] = "Not authorized to login."
      render :action => 'new'
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def create2
    person = Person.authenticate(params[:login], params[:password])
    if person && person.role?(:admin)
      session[:person_id] = person.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    elsif person
      flash.now[:alert] = "Not authorized to login."
      render :action => 'new'
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end
