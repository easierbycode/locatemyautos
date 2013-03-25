class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def fake_admin
    @users = User.all
  end
end
