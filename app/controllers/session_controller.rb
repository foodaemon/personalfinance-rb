class SessionController < ApplicationController
  def new
    render :layout => false
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id

      redirect_to :controller => 'transactions'
    else
      flash.now.alert = 'Invalid email or password'
      render(:layout => false, :action => 'new')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end
end
