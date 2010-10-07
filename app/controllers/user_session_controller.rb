class UserSessionController < ApplicationController
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
