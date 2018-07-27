class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      puts "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRs"
      puts request.env["omniauth.auth"]
      puts "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
  
      puts "---------------------------------"
      puts @user
      puts @user.provider
      puts @user.uid
      puts @user.email
      puts @user.name
      puts @user.password
      puts @user.image
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
  end   