class Admin::TopController < ApplicationController
  before_action :authenticate_admin!
end
