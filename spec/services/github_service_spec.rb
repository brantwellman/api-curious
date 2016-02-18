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
end
