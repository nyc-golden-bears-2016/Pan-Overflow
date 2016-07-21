post '/comments' do
  redirect_nologin
  question_id = params[:comment].delete("question_id")
  comment = current_user.comments.new(params[:comment])
  if comment.save
    redirect "/questions/#{question_id}"
  else
    @errors = comment.errors.full_messages
    erb :'questions/show'
  end
end
