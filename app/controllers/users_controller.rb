class UsersController < ApplicationController

  def active
    track_user # Defined in app controller
    @users = ActiveSupport::JSON.decode(RedisClient.redis.get("room:default:active_users").to_s) || []
    @users = @users.sort_by { |u| u["name"] }
    respond_to do |format|
      format.js { render :partial => 'active' }
    end
  end

end
