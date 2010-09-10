require 'spec_helper'

describe "chat interactions" do
  it "redirects when the username cookie is not set" do
    get "/"
    response.should be_redirect
  end

  context "with username cookie" do 
    before do 
      cookies[:username] = "tyler"
      RedisClient.redis = FakeRedis.new
    end

    it "renders the initial chat page when there is a username cookie" do 
      get "/"
      response.should be_success
      response.should have_selector("div.chat_window")
    end

    it "pushes a chat message" do 
      post "/chat/push", :message => "Hello"
    end

  end
end


