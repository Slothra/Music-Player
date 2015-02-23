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
