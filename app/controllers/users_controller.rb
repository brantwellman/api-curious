class UsersController < ApplicationController

  def show
    @user_object = UserPresenter.new(current_user)
  end

end
