class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :extras

  protected

    def extras
      @conference =  Conference.find 1
    end

    def after_sign_in_path_for(resource)
      post_login_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name,:nationality, :middle_name, :gender, :title, :institutional_affiliation, :phone, :address, :pio, :oci, :guardian_names, :date_of_birth, :place_of_birth, :passport_number, :passport_place, :passport_date_of_issue, :passport_place_of_issue, :passport_date_of_expiry, :address_as_stated_in_your_passport, :indian_consulate, :role ,:email, :ticket_number, :password, :password_confirmation, :passportscan, :student, :studying, :mothers_name, :consulate_email, :consulate_phone, :abstract_submitted)
      end
    end
end
