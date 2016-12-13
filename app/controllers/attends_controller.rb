class AttendsController < ApplicationController
	def create
		event = Event.find(params[:id])
		attend = Attend.new(user: current_user, event: event)
		if attend.save
			flash[:success] = ["You have Joined this Event"]
			redirect_to "/events"
		else
			flash[:errors] = attend.errors.full_messages
			redirect_to '/events'
		end
	end
	def destroy
		event = Event.find(params[:id])
		Attend.where(user: current_user, event: event).destroy_all
		redirect_to :back
	end
	def edit
		
	end
end
