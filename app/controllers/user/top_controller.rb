class User::TopController < ApplicationController
  before_action :authenticate_user!
end
