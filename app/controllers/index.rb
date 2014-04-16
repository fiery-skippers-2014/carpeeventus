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
  puts params
  Locations.create(latitude: params[:latitude], longitude: params[:longitude], user_id: sessions[:user_id])
  options = {}
  options[:latitude] = params[:latitude]
  options[:longitude] = params[:longitude]
  if current_user
    options[:radius] = current_user.radius
    options[:category] = current_user.category
  end
  @user_results = Eventbrite::Client.new(options)
  @user_results["events"].to_json
end



