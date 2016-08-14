get '/stock' do
  @stock = Stock.all()
  erb(:'stock/index')
end

