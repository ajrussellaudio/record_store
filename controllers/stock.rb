get '/stock' do
  @stock = Stock.all()
  erb(:'stock/index')
end

get '/stock/new' do
  @albums = Album.all
  erb(:'stock/new')
end

post '/stock/new' do
  new_stock_item = Stock.new( params )
  new_stock_item.save()
  redirect to '/stock'
end

get '/stock/:id/edit' do
  @stock_item = Stock.find(params['id'])
  erb(:'stock/edit')
end