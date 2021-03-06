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
  duplicate = Stock.find_duplicate(params)
  if duplicate == nil
    new_stock_item.save()
    redirect to '/stock'
  else
    redirect to "/stock/#{duplicate.id}/edit?alert=show"
  end
end

get '/stock/:id/edit' do
  @stock_item = Stock.find(params['id'])
  @albums = Album.all
  erb(:'stock/edit')
end

post '/stock/:id/update' do
  Stock.update(params)
  redirect to "/stock"
end

