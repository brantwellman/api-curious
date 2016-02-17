class GithubService
  attr_reader :connection

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers = {"User-Agent"=>"Faraday v0.9.2", "Authorization" => "token #{@current_user.token}"}
  end

  def starred_repos
    parse(connection.get("/users/#{@current_user.nickname}/starred"))
  end

  def followers
    parse(connection.get("/users/#{@current_user.nickname}/followers"))
  end

  def following
    parse(connection.get("users/#{@current_user.nickname}/following"))
  end


  private

    def parse(response)
      JSON.parse(response.body)
    end
end
