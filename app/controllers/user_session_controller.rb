class UserSessionController < ApplicationController
  before_filter :require_no_user, :only => [:login]
  before_filter :require_user, :only => [:logout]

  def login
    if request.post? 
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Login successful!"
        redirect_to authors_url
      else
        render :action => :login
      end
    elsif request.get?
      @user_session = UserSession.new
      render :action => :login
    end
  end

  def logout
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to "/"
  end
end
