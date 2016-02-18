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
    @commits = gs.recent_commits
    @repositories = gs.repositories
    @following_activity = gs.following_activity
    # binding.pry
  end
end
