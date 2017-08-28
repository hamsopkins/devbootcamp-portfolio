get "/tags" do
	erb :'tags/index'
end

get "/tags/:id" do
	@entries = Tagging.where(tag_id: params[:id]).map {|tagging| tagging.entry }
  erb :'entries/index'
end