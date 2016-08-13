require "pry-byebug"
require_relative "./models/artist"
require_relative "./models/album"

Album.delete_all
Artist.delete_all

artist1 = Artist.new({
  'name'  => "Photek",
  'genre' => "electronic"
  })
artist2 = Artist.new({
  'name'  => "Boards of Canada",
  'genre' => "electronic"
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'name' => "Modus Operandi",
  'artist_id' => artist1.id # Photek
  })
album2 = Album.new({
  'name' => "Solaris",
  'artist_id' => artist1.id # Photek
  })
album3 = Album.new({
  'name' => "Music Has the Right to Children",
  'artist_id' => artist2.id # Boards of Canada
  })
album4 = Album.new({
  'name' => "Geogaddi",
  'artist_id' => artist2.id # Boards of Canada
  })

album1.save()
album2.save()
album3.save()
album4.save()

binding.pry
nil