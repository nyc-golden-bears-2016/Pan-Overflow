post '/answers' do
  redirect_nologin
  if params[:answer]["body"].empty?
    @errors = ["Honey Grahams, don't submit empty answers. That's not helpful"]
    @question = Question.find(params[:answer]["question_id"].to_i)
    erb :'questions/show'
  else
  answer = Answer.new(params[:answer])
    if answer.save
      redirect "/questions/#{params[:answer]['question_id']}"
    else
      @errors = answer.errors.full_messages
      erb :'answers/new'
    end
  end
end
