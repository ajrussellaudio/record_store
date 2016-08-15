get '/artists' do
  @artists = Artist.all
  erb(:'artists/index')
end

get '/artists/new' do
  erb(:'artists/new')
end

post '/artists/new' do
  new_artist = Artist.new(params)
  new_artist.save()
  redirect to '/artists'
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:'artists/show')
end
