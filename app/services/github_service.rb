require "open-uri"

class GithubService
  attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers = {"User-Agent"=>"Faraday v0.9.2", "Authorization" => "token #{current_user.token}"}
  end

  def starred_repos
    parse(connection.get("/users/#{current_user.nickname}/starred"))
  end

  def followers
    parse(connection.get("/users/#{current_user.nickname}/followers", {access_token: current_user.token}))
  end

  def following
    parse(connection.get("users/#{current_user.nickname}/following"))
  end

  def contributions
    page = Nokogiri::HTML(open("https://github.com/#{current_user.nickname}"))
    page.xpath("//*[@id='contributions-calendar']/div[3]/span[2]").text
  end

  def longest_streak
    page = Nokogiri::HTML(open("https://github.com/#{current_user.nickname}"))
    page.xpath('//*[@id="contributions-calendar"]/div[4]/span[2]').text
  end

  def current_streak
    page = Nokogiri::HTML(open("https://github.com/#{current_user.nickname}"))
    page.xpath('//*[@id="contributions-calendar"]/div[5]/span[2]').text
  end

  def recent_commits
    commit_events = parse(connection.get("/users/#{current_user.nickname}/events")).select do |collection|
      collection["type"] == "PushEvent"
    end
    commit_events.map do |event|
      event["payload"]["commits"].map do |commit|
        commit["message"]
      end
    end.flatten
  end

  def organizations
    parse(connection.get("users/#{current_user.nickname}/orgs"))
  end

  def repositories
    parse(connection.get("users/#{current_user.nickname}/repos"))
  end


  private

    def parse(response)
      JSON.parse(response.body)
    end
end
