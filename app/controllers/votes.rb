post '/votes' do

  redirect_nologin
  @question = Question.find(params[:question_id])
  vote = current_user.votes.new(params[:votes])

  if request.xhr?
    if vote.save

    else
      @errors = ["Honey Grahams, you can only vote once."]
      @question = Question.find(params[:question_id])
      erb :'questions/show'
    end
  else
    if vote.save
      redirect "/questions/#{params[:question_id]}"
    else
      @errors = ["Honey Grahams, you can only vote once."]
      @question = Question.find(params[:question_id])
      erb :'questions/show'
    end
  end
end
