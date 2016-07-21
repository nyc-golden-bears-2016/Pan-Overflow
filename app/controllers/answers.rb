post '/answers' do
  redirect_nologin
  answer = Answer.new(params[:answer])
    if answer.save
      redirect "/questions/#{params[:answer]['question_id']}"
    else
      @errors = answer.errors.full_messages
      erb :'answers/new'
    end
end
