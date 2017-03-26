class SessionsController < ApplicationController
 
	before_filter :authenticate_user, :except => [:home, :login, :login_attempt, :logout]
	before_filter :find_user, :only => [:home]
	before_filter :save_login_state, :only => [:login, :login_attempt]

	def home
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
	end

	def login
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:info] = t('sessions.login.messages.success', user: authorized_user.username)
			redirect_to '/home'
		else
			flash[:danger] = t('sessions.login.messages.error')
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to '/login'
	end

end
