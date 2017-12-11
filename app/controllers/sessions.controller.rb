class SessionsController < ApplicationController
		def new

		end

		def create
			user=User.find_by(email: params[:session][:email].downcase)
			if user && user.authenticate(params[:sessio][:password])
				sessions[:user_id]=user.id
				flash.now[:danger] ="You have succefully logged in"	
				redirect_to users_path			
			else
				flash.now[:danger] ="Password or username is invalid"
				render 'new'
			end			

		end

		def destroy
		end
end

	