class LoginController < ApplicationController
  def create
    run Login::Operation::Create do |ctx|
      @login = ctx[:login]
      flash.notice = "Success"
      redirect_to user_path
    end
  end
end
