class CommentsController < ApplicationController
	def create
		event = Event.find(comment_params[:event])
		comment = Comment.new(content:comment_params[:content], user:current_user, event:event)
		if comment.save
			redirect_to :back
		else
			flash[:errors] = comment.errors.full_messages
			redirect_to  :back
		end
	end

		private
			def comment_params
				params.require(:comment).permit(:content, :event)
			end
	end		
