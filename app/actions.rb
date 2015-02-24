# Homepage (Root path)
get '/' do
    erb :index
end

get '/songs' do
	@songs = Song.all
  erb :"songs/index"
end

get '/songs/new' do
  erb :"songs/new"
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author:  params[:author]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/:id' do
  @other = []
  @song = Song.find params[:id]
  author1 = @song.author
  Song.where(author: author1).each do |record|
    @other << record.title
  end
  erb :'songs/details'
end

get '/sign_up' do
  erb :'users/sign_up'
end

post '/sign_up' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/songs'
  else
    erb :'users/sign_up'
  end
end

post '/login' do
    response.set_cookie("name", :value => params[:name], :path => "/", :expires => Time.now + 60*60*24*365*3)
    redirect '/'
end
