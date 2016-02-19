class UsersController < ApplicationController

  def show
    @user_object = UserPresenter.new(current_user)
  end

  def following
    gs = GithubService.new(current_user)
    @following_activity = gs.following_activity
  end

end
