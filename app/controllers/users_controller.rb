class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end

  def index
    @users = User.name_like(params[:q])
    respond_to do |format|
      format.json { render :json => @users.map(&:id_name) }
    end
  end

  def generate_password
    @user = User.find(params[:id])
    @user.password = get_password
    if @user.save
      UserMailer.new_password(@user).deliver
      redirect_to @user, notice: "A new password has been sent. The new password is: #{@user.password}"
    else
      redirect_to @user, notice: "Something went wrong"
    end
  end

  private

  def get_password
    IO.popen("pwgen -c -B -n").gets.chomp
  end
end
