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

get '/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb(:'artists/edit')
end

post '/artists/:id' do
  Artist.update(params)
  redirect to "/artists/#{params['id']}"
end

get '/artists/:id/delete' do
  @artist = Artist.find(params['id'])
  erb(:'artists/delete')
end

post '/artists/:id/delete' do
  Artist.delete(params['id'])
  redirect to '/artists'
end
