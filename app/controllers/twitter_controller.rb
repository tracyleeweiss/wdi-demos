class TwitterController < ApplicationController
	
	def tweet
      client = Twitter::Client.new(
	  :oauth_token => session[:twitter_token], 
	  :oauth_token_secret => session[:twitter_secret])
	  client.update(params[:text])

	end
end