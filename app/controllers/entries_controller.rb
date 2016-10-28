# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries/:entry_id/comments' do
  if session[:user_id]
    @comment = Comment.new( entry_id: params[:entry_id],
                            author_id: session[:user_id],
                            body: params[:body])
    if @comment.save
      redirect "/entries/#{params[:entry_id]}"
    else
      @errors = @comment.errors.full_messages
      @entry = Entry.find(params[:entry_id])
      erb :'entries/show'
    end
  else
    @entries = Entry.most_recent
    @errors = ["You must be logged in to post."]
    erb :'entries/index'
  end
end

post '/entries' do
  if session[:user_id]
    @entry = Entry.new
    tags = params[:tags].split(" ").map { | entry_tag | Tag.find_or_create_by(name: entry_tag.downcase) }
    @entry.assign_attributes(params[:entry])
    @entry.author_id = session[:user_id]
    # @entry.tags = params[:tags].split(" ").map { | entry_tag | Tag.find_or_create_by(name: entry_tag.downcase) }
    # @entry.author_id = session[:user_id]
    # @entry.assign_attributes(params[:entry])
    if @entry.save
      @entry.update_attributes(tags: tags)
      redirect "/entries/#{@entry.id}"
    else
      @errors = @entry.errors.full_messages
      erb :'entries/new'
    end
  else
    @entries = Entry.most_recent
    @errors = ["You must be logged in to post."]
    erb :'entries/index'
  end
end

get '/entries/new' do
  if session[:user_id]
    erb :'entries/new'
  else
    @entries = Entry.most_recent
    @errors = ["You must be logged in to post."]
    erb :'entries/index'
  end
end

# route handlers dealing with a specific entry
before '/entries/:id' do
  pass if request.path_info.match /new/
  @entry = find_and_ensure_entry(params[:id])
end

get '/entries/:id' do
  erb :'entries/show'
end

put '/entries/:id' do
  if @entry.author_id == session[:user_id]
    params[:entry][:tags] = params[:tags].split(" ").map { | entry_tag | Tag.find_or_create_by(name: entry_tag.downcase) }
    @entry.assign_attributes(params[:entry])
    if @entry.save
      redirect "entries/#{@entry.id}"
    else
      @errors = @entry.errors.full_messages
      erb :'entries/edit'
    end
  else
    @errors = ["You are not logged in as the correct user."]
    erb :'entries/show'
  end
end

delete '/entries/:id' do
  if @entry.author_id == session[:user_id]
    @entry.destroy
    redirect '/entries'
  else
    @errors = ["You are not logged in as the correct user."]
    erb :'entries/show'
  end
end

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  if @entry.author.id == session[:user_id]
    erb :'entries/edit'
  else
    @errors = ["You are not logged in as the correct user."]
    erb :'entries/show'
  end
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @entry = @comment.entry
  if @comment.author_id == session[:user_id]
    @comment.destroy
    redirect "/entries/#{@entry.id}"
  else
    @errors = ["You are not logged in as the correct user."]
    erb :'entries/show'
  end
end
