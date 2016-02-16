class SessionsController < ApplicationController
	def new
		# login form
	end

	def create
		# login (create a session)
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/'
		else
			redirect_to '/login'
		end	
	end

	def destroy
		# logout (delete the session)
		session.clear
		redirect_to '/'
	end
end
