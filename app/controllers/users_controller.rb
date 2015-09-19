class UsersController < ApplicationController
  def sign_in
  end

  def index
    @users = User.all
    render :json => @users.to_json
  end

  def create
  end

  def users
  end
end
