class GithubService
  attr_reader :connection

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new("https://api.github.com")
  end

  def starred_repos
    data = connection.get("/users/#{@current_user.nickname}/starred").body
    json = JSON.parse(data)
  end
end
