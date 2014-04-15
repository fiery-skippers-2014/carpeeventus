require 'awesome_print'

get '/' do
  erb :index
end

get '/subreddits' do
  client = Reddit::Client.new
  @subreddits = client.get_posts(params[:username])
  @subreddits
  # ap client.get_up_votes(params[:username])
end
