class SessionsController < ApplicationController
	def index
	end
	def create
		user = User.find_by_email(login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = ["Invalid Email or Password"]
			redirect_to root_path
		end
	end
	def logout
		reset_session
		redirect_to root_path
	end

	private	
		def login_params
			params.require(:user).permit(:email, :password)
		end
end
