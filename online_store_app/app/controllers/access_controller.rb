class AccessController < ApplicationController
  skip_before_action :authorize
  
  def new
  	if session[:user_id]
		redirect_to admin_url, notice: "already logged on"
		return
	end
  end


  def create
  	user = User.find_by(name: params[:name])
  	puts "DEFINITELY CAME here ================ >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	if user and user.authenticate(params[:password])
		puts "came here ================ >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		session[:user_id] = user.id
		redirect_to admin_url
	else
		puts "came here ================"
		redirect_to login_url, alert: "Invalid user/password combination"
	end
  end

  def destroy
  	session[:user_id] = nil
	redirect_to shopper_url, notice: "Logged out"
  end
end
