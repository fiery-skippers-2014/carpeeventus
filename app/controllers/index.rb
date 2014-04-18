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
  @locations = current_user.locations
  @events = current_user.events
  @past_events = []
  @upcoming_events = []

  @events.each do |event|
    if Time.parse(event.end_date)- Time.now > 0
      @past_events << event
    else
      @upcoming_events << event
    end
  end
  erb :profile
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/location' do
  p params
  puts "we're in location route"
  session[:user_id] = 1    #remove this at some point
  if current_user
    latitude = params["position"][0].to_f.round(3).to_s
    longitude = params["position"][1].to_f.round(3).to_s
    Location.create(latitude: latitude, longitude: longitude, user_id: session[:user_id])
  end
  options = {}
  options[:latitude] = params["position"][0]
  options[:longitude] = params["position"][1]
  options[:radius] = params[:radius]
  options[:category] = params[:category]

  @search_results = Eventbrite::Client.new(options)

  x= @search_results.to_json
  y = JSON.parse(x)

  @all_events = y["user_results"]["events"]

  @summary_of_results = @all_events.shift
  erb :_list_events, :layout => false
end


post '/event/new' do
  session[:user_id] = 1
  params[:user_id] = session[:user_id]
  Event.create(params)
end


post '/location/new' do
  p params
  Location.find_by_id(params[:id]).update_attribute('location', params[:location])
end

post '/feedback/new' do
  p params
  UserOpinion.create(feedback: params[:feedback], event_id: params[:id], user_id: session[:user_id])
end

get '/opinions' do
  @opinions = UserOpinion.all.order(created_at: :desc)
  erb :_opinions
end










