class UsersController < ApplicationController
  # http_basic_authenticate_with name: "takhukhu", password: "secret"
  before_action :authenticate_user!

  def index

  end
end
