class SessionsController < ApplicationController

def create

	#render :json => request.env['omniauth.auth'].to_json
	session[:twitter_token] = request.env['omniauth.auth']['credentials']['token']
	session[:twitter_secret] = request.env['omniauth.auth']['credentials']['secret']
	@name = request.env['omniauth.auth']['info']['name']

	#auth_hash = request.env['omniauth.auth']
	#@name = auth_hash = request.env['omniauth.auth']
end

def tweet
      client = Twitter::Client.new(
	  :oauth_token => session[:twitter_token], 
	  :oauth_token_secret => session[:twitter_secret])
	  client.update(params[:text])

	end

end