class UsersController < ApplicationController
	
	before_action :require_correct_user, only: [:edit, :update]
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to root_path
		end
	end
	def show
		@user = User.find(current_user.id)
	end
	def edit	
	end
	def update
		User.find(current_user.id).update(user_params)
			redirect_to "/events"
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
		end
		def update_params
			params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
		end
end
