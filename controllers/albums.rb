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

get '/artists/:artist_id/albums/:id/edit' do
  @album = Album.find(params['id'])
  erb(:'albums/edit')
end

post '/artists/:artist_id/albums/:id/edit' do
  Album.update(params)
  redirect to "/artists/#{params['artist_id']}"
end

get '/artists/:artist_id/albums/:id/delete' do
  @album = Album.find(params['id'])
  erb(:'albums/delete')
end

post '/artists/:artist_id/albums/:id/delete' do
  Album.delete(params['id'])
  redirect to "/artists/#{params['artist_id']}"
end