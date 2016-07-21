post '/votes' do

  redirect_nologin
  @question = Question.find(params[:question_id])
  vote = current_user.votes.new(params[:votes])
  # vote = Vote.new(value:, user_id: current_user.id)
  # vote.votable = Question.find(params[:id])
  if request.xhr?

    if vote.save
      return "fish"
    else
      @errors = ["Honey Grahams, you can only vote once."]
      @question = Question.find(params[:id])
    end
  else
    if vote.save
      redirect "/questions/#{params[:id]}"
    else
      @errors = ["Honey Grahams, you can only vote once."]
      @question = Question.find(params[:id])
      erb :'questions/show'
    end
  end
end
