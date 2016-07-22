get '/questions' do
  @questions = Question.all
  erb :index
end


get '/questions/new' do
  redirect_nologin

  erb :'questions/new' #show new questions view
end


post '/questions' do
  redirect_nologin
  tags =  params[:question].delete("tags")
  if tags.nil?
    @errors = "You have to tag your question"
    erb :'questions/new'
  else
    question = Question.new(params[:question])
    if question.save
      tags.split(" ").each do |tag|
        question.tags << Tag.create(name: tag)
      end
      redirect '/questions'
    else
      @errors = question.errors.full_messages
      erb :'questions/new'
    end
  end
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

#shows questions that were search by a tag
post '/questions/tag' do
  @tag = Tag.find_by(name: params[:tag])
  if @tag.nil?
    @questions = Question.all
    @errors = ["No results found with #{params[:tag]} tag."]
    erb :'index'
  else
    @questions = @tag.questions.sort{|top, bottom| bottom.points <=> top.points}

    erb :'tag/show'
  end
end

get '/questions/tag/:id' do
  @tag = Tag.find(params["id"])
  @questions = @tag.questions
  erb :'tag/show'
end


delete '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define question to delete

  @question.destroy #delete question

  redirect '/questions' #redirect back to questions index page

end

post '/questions/:id/comment' do

  @question = Question.find(params[:id])

  @comment = @question.comments.new(body: params[:body])

  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comment/new'
  end

end

get '/questions/:id/edit' do

  #get params from url
  @question = Question.find(params[:id]) #define intstance variable for view

  erb :'questions/edit' #show edit question view

end

put '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define variable to edit

  @question.assign_attributes(params[:question]) #assign new attributes

  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions/edit' #show edit question view again(potentially displaying errors)
  end

end
