class AccountController < ApplicationController
  def signup_form
  end

  def signup
  	user = User.new(signup_user_params)

  	if user.save
  		flash[:notice] = "User created correctly, you can log in now!"
  		redirect_to '/'
  	else
  		redirect_to signup_url
  	end
  end

  def login_form
  end

  def login
  	user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to signup_url
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url
  end

  	private

		def signup_user_params
		  params.require(:user).permit(:email, :password, :password_confirmation)
		end
end
