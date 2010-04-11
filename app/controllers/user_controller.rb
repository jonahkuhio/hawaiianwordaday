class UserController < ApplicationController
  layout 'standard'
  
  def signup
    case request.method
      when :post
        @user = User.new(params[:user])
        if @user.save
          redirect_to root_path
        end
    end
  end
  
  def login
    unless session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
      flash[:error] = "Login failed"
    end
    redirect_to root_path
  end
  
  def logout
    reset_session
    redirect_to root_path
  end
  
  def show
    @user = User.find_by_login(params[:login])
  end
end
