class UserController < ApplicationController
  layout 'standard'
  
  def signup
    case request.method
      when :post
        @user = User.new(params[:user])
        if @user.save
          redirect_to :controller => 'classified', :action => 'list'
        end
    end
  end
  
  def login
    if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
      redirect_to :controller => 'classified', :action => 'list'
    else
      redirect_to :controller => 'classified', :action => 'list'
    end
  end
  def logout
    reset_session
    redirect_to :controller => 'classified', :action => 'list'
  end
  def show
    @user = User.find(:first, :conditions => ["login = ?", params[:login]])
  end
end
