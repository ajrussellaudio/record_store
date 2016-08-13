require "pry-byebug"
require_relative "./models/artist"

artist1 = Artist.new({
  'name'  => "Photek",
  'genre' => "electronic"
  })

artist1.save()

binding.pry
nil