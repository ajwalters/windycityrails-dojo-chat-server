require 'spec_helper'
require File.expand_path('vendor/bots/google_bot')

describe GrouponSaysBot do

  before do
    @username = 'Sample'
    @bot = GrouponSaysBot.new(@username)
  end

  it "should respond with nil if the message text is not 'speak groupon' " do
    @bot.respond("Jim", "some_other_text").should be nil
  end

  it 'returns a random Groupon Says from the Groupon API if the message is "speak groupon"' do
    GrouponSaysBot.stub(:get).and_return({
      "grouponSayings"=> [ { "websiteContent"=> "Content here" }]
    })

    @bot.respond("Jim", "speak groupon").should == "Content here"
  end
end
