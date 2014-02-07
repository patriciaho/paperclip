class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user

	def current_user
		if session[:user_id]
			User.find_by(id: session[:user_id])
		end
	end

 #  	def create
	# 	@user = User.find_by(username: params[:user][:username])
	# 	if @user.authenticated?(params[:user][:password])
	# 		session[:user_id] = @user.id
	# 		redirect_to images_path
	# 	end
	# end

	# def destroy
	# 	session[:user_id] = nil
	# 	redirect_to new_auth_path
	# end


end