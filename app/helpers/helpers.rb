helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_nologin
    redirect '/' unless logged_in?
  end

  def vote_path(model)
    "/#{model.class.name.downcase}s/#{model.id}/vote"
  end

  def comment_path(model)
    "/#{model.class.name.downcase}s/#{model.id}/comment"
  end

end
