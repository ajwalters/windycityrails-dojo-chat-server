require 'spec_helper'
require File.expand_path('vendor/bots/echo_bot')

describe EchoBot do
  
  describe "should initialize" do 
    after :each do
      @eb.username.should == 'username'
      @eb.last_updated.should == 0
    end
    
    it "with options" do
      hash = {:echo => true}
      @eb=EchoBot.new('username',hash)
      @eb.options.should == hash
    end
    
    it "without options" do
      @eb=EchoBot.new('username')
      @eb.options.should be_empty   
    end    
  end
  
  describe "should respond" do
    before :all do
      @eb=EchoBot.new('EchoBot')
    end
    it 'echo message from another user' do
      @eb.respond('user', 'message').should == 'message'
    end
    
    it 'with nil to myself' do
      @eb.respond('EchoBot', 'message').should be_nil
    end
  end
end
=======

  before do
    @username = "testuser"
    @echo_bot = EchoBot.new(@username)
    @echo_bot.last_updated = 20100910
  end

  it "should push the message if the message_user is not the current user" do
     message_text = "the message"
     message = {"username" => "not testuser", "message" => message_text}
     @echo_bot.should_receive(:push).with(message_text)
     @echo_bot.process_message(message)
  end

  it "should not push the message if the message_user is the current user" do
     message_text = "the message"
     message = {"username" => @username, "message" => message_text}
     @echo_bot.should_not_receive(:push).with(message_text)
     @echo_bot.process_message(message)
  end

  it "should pull from the server and return the data delta" do
    new_time = 20100911
    delta = "the delta"
    payload = {"time" => new_time, "delta" => delta}
    EchoBot.should_receive(:get).with("http://localhost:3000/chat/pull/#{@echo_bot.last_updated}").
      and_return(payload)
    return_value = @echo_bot.pull
    return_value.should == delta
  end

  it "should push the message to the server" do
    message = {"username" => @username, "message" => "the message"}
    
    EchoBot.should_receive(:post).with("http://localhost:3000/chat/push", 
                                       {:body => {:username => @username, :message => message}})

    @echo_bot.push(message)
  end

end
