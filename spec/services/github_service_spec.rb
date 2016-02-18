require 'rails_helper'

describe "GithubService" do

  before do
    @service = GithubService.new(user)
  end

  context "starred repos" do
    it "returns users starred repos" do
      VCR.use_cassette("github_service#starred_repos") do
        repos = @service.starred_repos
        repo = repos.first

        expect(repos.count).to eq(3)
        expect(repo["name"]).to eq("api-curious")
      end
    end
  end

  context "followers" do
    it "returns the users followers" do
      VCR.use_cassette("github_service#followers") do
        followers = @service.followers
        follower = followers.first

        expect(followers.count).to eq(9)
        expect(follower["login"]).to eq("mikegowen")
      end
    end
  end

  context "following" do
    it "returns the people the user is following" do
      VCR.use_cassette("github_service#following") do
        followings = @service.following
        following = followings.first

        expect(followings.count).to eq(7)
        expect(following["login"]).to eq("mikegowen")
      end
    end
  end

  context "contributions" do
    it "returns the number of contributions in the last year" do
      VCR.use_cassette("github_service#contributions") do
        contributions = @service.contributions

        expect(contributions).to eq("592 total")
      end
    end
  end

  context "longest streak" do
    it "returns the longest streak for the user" do
      VCR.use_cassette("github_service#longest_streak") do
        longest_streak = @service.longest_streak

        expect(longest_streak).to eq("16 days")
      end
    end
  end

  context "current streak" do
    it "returns the current streak for the user" do
      VCR.use_cassette("github_service#current_streak") do
        current_streak = @service.current_streak

        expect(current_streak).to eq("3 days")
      end
    end
  end

  context "recent commits" do
    it "returns a list of the recent commits for the user" do
      VCR.use_cassette("github_service#recent_commits") do
        recent_commits = @service.recent_commits
        first_commit = recent_commits.first

        expect(recent_commits.count).to eq(13)
        expect(first_commit).to eq("Started Omniauth-testing")
      end
    end
  end

  # context "following activity" do
  #   it "returns a list of followers and their recent commits" do
  #     VCR.use_cassette("github_service#following_activity") do
  #
  #     end
  #   end
  # end

  # "parse_commit_messages"

  context "organizations" do
    it "returns a list of organizations for the user" do
      VCR.use_cassette("github_service#organizations") do
        organizations = @service.organizations
        first_org = organizations.first

        expect(organizations.count).to eq(1)
        expect(first_org["login"]).to eq("TuringTestOrganization")
      end
    end
  end

  context "repositories" do
    it "returns a list of repositories for the user" do
      VCR.use_cassette("github_service#repositories") do
        repositories = @service.repositories
        first_repo = repositories.first

        expect(repositories.count).to eq(30)
        expect(first_repo["name"]).to eq("api-curious")
      end
    end
  end

end
