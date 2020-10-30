class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @user = current_user.id
  end

  def create
  end

  def edit
  end

  def update
  end

  def logout
  end

end
