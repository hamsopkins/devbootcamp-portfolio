get '/users/new' do
	erb :'users/new'
end

post '/users' do
	@user = User.new(	name:		params[:name],
										email:	params[:email])
	@user.password= params[:password]
	if @user.save
		session[:user_id] = @user.id
		redirect "/"
	else
		redirect "/users/new"
	end
end

get '/users/:id/entries' do
	@entries = Entry.where(author_id: params[:id])
  erb :'entries/index'
end

get '/logout' do
	session[:user_id] = nil
	redirect "/"
end

get '/login' do
	if session[:user_id]
		redirect "/"
	else
		erb :login
	end
end

post '/login' do
	@user = User.find_by_email(params[:email])
	if @user
		if @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/"
		else
			@errors = ["Incorrect password"]
			erb :login
		end
	else
		@errors = ["User does not exist."]
		erb :login
	end
end