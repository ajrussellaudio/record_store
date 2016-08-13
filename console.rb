require "pry-byebug"
require_relative "./models/artist"
require_relative "./models/album"

artist1 = Artist.new({
  'name'  => "Photek",
  'genre' => "electronic"
  })

artist1.save()

album1 = Album.new({
  'name' => "Modus Operandi",
  'artist_id' => artist1.id
  })

# album1.save

binding.pry
nil