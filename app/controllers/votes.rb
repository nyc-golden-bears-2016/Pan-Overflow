post '/votes' do
  redirect_nologin
  vote = current_user.votes.new(params[:votes])

  if vote.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = ["Honey Grahams, you can only vote on a post once."]
    @question = Question.find(params[:question_id])
    erb :'questions/show'
  end
end
