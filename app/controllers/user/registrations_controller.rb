# frozen_string_literal: true

class User::RegistrationsController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    run User::Registrations::Operation::Create::Present
  end

  def create
    run User::Registrations::Operation::Create do |ctx|
      redirect_to new_user_session_path and return
    end

    render :new
  end
end
