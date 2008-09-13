# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  before_filter :find_or_build_person

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '41b67c2565064bd9c07992127501e5ed'
  
  
  protected

  def current_page
    params[:page].to_i < 1 ? 1 : params[:page].to_i
  end

  def find_or_build_person
    @current_person ||= Person.find_or_initialize_by_id(session[:person_id])
    if @current_person.new_record?
      @current_person.save
      login_as_person
    end
  end

  def login_as_person
    session[:person_id] = @current_person.id
  end


end
