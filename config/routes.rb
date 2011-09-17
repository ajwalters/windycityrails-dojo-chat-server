WindycityrailsDojoChatServer::Application.routes.draw do
  root :to => "chat#index"
  match '/chat/sign_in_form' => 'chat#sign_in_form'
  match '/chat/sign_in' => 'chat#sign_in'
  match '/chat/push' => 'chat#push'
  match '/chat/pull/:last_sync' => 'chat#pull'
  match '/chat/sign_out' => 'chat#sign_out', :as => "sign_out"

  get '/users', :to => 'users#active'

  #TODO:  Too lame for the Dojo!
  match 'redis/*redis_args' => 'redis#index'
end
