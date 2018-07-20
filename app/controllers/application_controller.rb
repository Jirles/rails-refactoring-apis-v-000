class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

    def authenticate_user
<<<<<<< HEAD
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT']}&redirect_uri=#{CGI.escape(auth_url)}&scope=repo" if !logged_in?
=======
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT']}&redirect_uri=#{CGI.escape(auth_path)}&scope=repo" if !logged_in?
>>>>>>> dda808de02288c8a1bc201f921b68ee5316c0384
    end

    def logged_in?
      !!session[:token]
    end
end
