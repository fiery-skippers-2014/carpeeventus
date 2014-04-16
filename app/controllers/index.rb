require 'awesome_print'

get '/' do
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/user' do
  @user = User.create(params)
  if @user.errors.full_messages.count != 0
    erb :_errors
  else
    session[:user_id] = @user.id
    redirect("/user/#{session[:user_id]}")
  end
end

get '/sessions/new' do
  erb :sign_in
end

get '/user/:id' do

  @location = current_user.Locations.all
  erb :profile
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/location' do
  puts "we're in location route"
  unless current_user
    session[:user_id]=nil
  end
  Location.create(latitude: params["position"][0], longitude: params["position"][1], user_id: session[:user_id])
  options = {}
  options[:latitude] = params["position"][0]
  options[:longitude] = params["position"][1]
  if current_user
    options[:radius] = current_user.radius
    options[:category] = current_user.category
  end
  @search_results = Eventbrite::Client.new(options)
  x= @search_results.to_json
  y = JSON.parse(x)
  @all_events = y["user_results"]["events"]
  @summary_of_results = @all_events.shift
  # p @all_events
  p @all_events.first["event"]["distance"] #distance to location, this works!
  p @all_events.first["event"]["venue"]["address"]
  p @all_events.first["event"]["venue"]["latitude"]
  p @all_events.first["event"]["venue"]["longitude"]
  erb :_list_events, :layout => false
end



