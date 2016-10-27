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

get '/logout' do
	session[:user_id] = nil
	redirect "/"
end

get '/login' do
	if session[:user_id]
		redirect "/restricted"
	else
		erb :login
	end
end

post '/login' do
	if User.authenticate(params[:email], params[:password])
		session[:user_id] = User.find_by_email(params[:email]).id
		redirect "/"
	else
		erb :login
	end
end