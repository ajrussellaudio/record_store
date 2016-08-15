get '/artists/:artist_id/albums/new' do
  @artist = Artist.find(params['artist_id'])
  erb(:'albums/new')
end

post '/artists/:artist_id/albums/new' do
  new_album = Album.new(params)
  new_album.save()
  redirect to "/artists/#{params['artist_id']}"
end

get '/artists/:artist_id/albums/:id' do
  @album = Album.find(params['id'])
  erb(:'albums/show')
end

