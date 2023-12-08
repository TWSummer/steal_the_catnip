class ApplicationController < ActionController::Base
    attr_reader :current_user

    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(session_token: session[:session_token]) if session[:session_token]
        unless @current_user
            @current_user ||= User.create
            session[:session_token] = @current_user.session_token
        end
    end
end
