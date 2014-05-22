require 'awesome_print'
require 'time'

get '/' do
  erb :index
end

post '/user' do
  if user_exists(params[:facebook_id]) == true
    @user = User.find_by_facebook_id(params[:facebook_id])
    @user.token = params[:token]
    @user.save
    session[:user_id] = @user.id
  else
    @user = User.create(params)
  end
  redirect("/user/#{session[:user_id]}")
end

get '/user/:id' do
  @locations = current_user.locations
  @events = current_user.events
  @past_events = []
  @upcoming_events = []
  @events.each do |event|
    if Time.parse(event.start_date)- Time.now > 0
      @past_events << event
      @past_events.sort_by! { |event| Time.parse(event.start_date) }.reverse
    else
      @upcoming_events << event
    end
  end
  erb :profile, :layout => false
end

get '/location' do
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

  x = @search_results.to_json
  y = JSON.parse(x)

  @all_events = y["user_results"]["events"]

  @summary_of_results = @all_events.shift
  erb :_list_events, :layout => false
end

post '/event/new' do
  event = Event.new(params)
  current_user.events << event
  if event.save
  else 
    puts "Failed"
  end 
  redirect("/user/#{session[:user_id]}")
end

post '/location/new' do
  Location.find_by_id(params[:id]).update_attribute('location', params[:location])
  redirect("/user/#{session[:user_id]}")
end

post '/event/feedback' do
  UserOpinion.create(feedback: params[:feedback], event_id: params[:id], user_id: session[:user_id])
  redirect("/user/#{session[:user_id]}")
end

get '/opinion/new' do
  @opinions = UserOpinion.all.order(created_at: :desc)
  redirect("/user/#{session[:user_id]}")
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end








