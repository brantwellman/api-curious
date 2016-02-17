class UsersController < ApplicationController
  def show
    @starred = GithubService.new(current_user).starred_repos
  end
end
