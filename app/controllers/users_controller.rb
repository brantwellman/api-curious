class UsersController < ApplicationController
  def show
    gs = GithubService.new(current_user)
    @starred = gs.starred_repos
    @followers = gs.followers
    @followings = gs.following
    @contributions = gs.contributions
    @longest_streak = gs.longest_streak
    @current_streak = gs.current_streak
    @organizations = gs.organizations
  end
end
