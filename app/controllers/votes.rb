post '/votes' do

  @question = Question.find(params[:id])
  @question.votes.create(value: params[:vote].to_i)

  redirect "/questions/#{@question.id}"

end
