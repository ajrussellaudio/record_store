require "sinatra"
require "sinatra/contrib/all"

require "pry-byebug"

require_relative "./models/artist"
require_relative "./models/album"
require_relative "./models/stock"

require_relative "./controllers/stock"

get '/' do
  erb(:home)
end