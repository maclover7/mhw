class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def configure_devise_params
    [:sign_up, :account_update].each do |s|
      devise_parameter_sanitizer.for(s) do |u|
        u.permit(:name, :type, :email, :password, :password_confirmation, :current_password)
      end
    end
  end

  %w(Student Teacher).each do |k|
    define_method "current_#{ k.underscore }" do
      current_user if current_user.is_a?(k.constantize)
    end

    define_method "authenticate_#{ k.underscore }!" do
      |opts={}| send("current_#{ k.underscore }") || not_found
    end

    define_method "#{ k.underscore }_signed_in?" do
      !send("current_#{ k.underscore }").nil?
    end
  end
end
