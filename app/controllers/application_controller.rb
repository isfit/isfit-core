class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  helper :all # include all helpers, all the time
  
  before_filter :login_required
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :controller_name, :action_name

  def set_where_am_i(object)
    session[:whereami] = [object.class.name,(object.nil? ? object.object_id : object.id)]
  end
end
