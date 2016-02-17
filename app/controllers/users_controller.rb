class UsersController < ApplicationController
  def show
    gs = GithubService.new(current_user)
    @starred = gs.starred_repos
    @followers = gs.followers
    @followings = gs.following
  end
end
