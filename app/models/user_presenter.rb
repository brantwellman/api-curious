class UserPresenter
  attr_reader :starred,
              :followers,
              :followings,
              :contributions,
              :longest_streak,
              :current_streak,
              :organizations,
              :commits,
              :repositories,
              :following_activity

  def initialize(user)
    gs = GithubService.new(user)
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
  end

end
