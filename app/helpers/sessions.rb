helpers do

  def current_user
  	p session[:user_id]
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def user_exists(facebook_id)
    User.exists?(facebook_id: facebook_id)
  end

end
