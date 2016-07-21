post '/votes' do
  redirect_nologin
  vote = current_user.votes.new(params[:votes])

  if vote.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = vote.errors.full_messages
    @question = Question.find(params[:question_id])
    erb :'questions/show'
  end
end
