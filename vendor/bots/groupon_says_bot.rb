require File.expand_path('../../../config/boot', __FILE__)
require File.join(File.dirname(__FILE__), 'bot_base')
Bundler.require(:bot) if defined?(Bundler)

class GrouponSaysBot < BotBase

  URL_ENDPOINT = "http://api.groupon.com/v2/groupon_says.json"
  GROUPON_API_CLIENT = "4c20539fdaeaaf52046d302edfe9e9ec47938d9f"

  def respond(message_user, message_text)
    if message_text == "speak groupon"
      response_body = self.class.get("#{URL_ENDPOINT}?client_id=#{GROUPON_API_CLIENT}&limit=1&random=true")
      response_body['grouponSayings'].first['websiteContent']
    end
  end
end

if __FILE__ == $0
  GrouponSaysBot.run!("Groupon Says Bot")
end
