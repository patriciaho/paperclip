class AuthsController < ApplicationController

	# Show a login form
	def new
		if current_user
			redirect_to images_path
		else
			#Make a login form from an object that has username and password
			@user = User.new
		end
	end

	#Log them in!
	def create
		@user = User.find_by(username: params[:user][:username])
		if @user && @user.authenticated?(params[:user][:password]) && 
				session[:user_id] = @user.id
				redirect_to images_path
		else
				flash[:error] = "BAAAAADDDD"
				redirect_to images_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to images_path
	end

end