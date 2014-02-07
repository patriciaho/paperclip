class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  		if @user.save
  			redirect_to action: 'index'
  		else
  			render action: 'new'
  		end
  	# Another way to do the same thing:
  	# User.create(params[:user].permit(:username, :password))
  	# 	redirect_to user_path
  end

  def login
  	@user = User.find(params[:username])
  	if @user.authenticate? == true
  		redirect_to action: 'images/index'
  	else
  		render action: 'login'
  	end
  end
  
  private

  def user_params
  	params.require(:user).permit(:username, :password)
  end


end
