get '/stock' do
  @stock = Stock.all()
  erb(:'stock/index')
end

get '/stock/new' do
  @albums = Album.all
  erb(:'stock/new')
end