class GithubService
  attr_reader :connection

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers = {"User-Agent"=>"Faraday v0.9.2", "Authorization" => "token #{@current_user.token}"}
  end

  def starred_repos
    data = connection.get("/users/#{@current_user.nickname}/starred").body
    json = JSON.parse(data)
  end

  def followers
    data = connection.get("/users/#{@current_user.nickname}/followers").body
    json = JSON.parse(data)
  end

  def following
    data = connection.get("users/#{@current_user.nickname}/following").body
    json = JSON.parse(data)
    # binding.pry
  end
end
