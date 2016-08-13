require_relative "../db/sql_runner"

class Album

  attr_reader :id, :name, :artist_id

  def initialize( options )
    @id        = options['id'].to_i
    @name      = options['name']
    @artist_id = options['artist_id']
  end

end
