# frozen_string_literal: true

class Admin::RegistrationsController < ApplicationController

  # GET /resource/sign_up
  def new
    run Admin::Registrations::Operation::Create::Present
  end

  def create
    run Admin::Registrations::Operation::Create do |ctx|
      redirect_to admin_path and return
    end

    render :new
  end
end
