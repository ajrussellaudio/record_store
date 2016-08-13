require_relative "../db/sql_runner"

class Artist

  attr_reader :id, :name, :genre

  def self.all
    sql = "SELECT * FROM artists;"
    return Artist.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id};"
    artist = Artist.map_item(sql)
    return artist
  end

  def self.delete(id)
    sql = "DELETE FROM artists WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new( artist ) }
    return result
  end

  def self.map_item(sql)
    result = Artist.map_items(sql)
    return result.first
  end

  def initialize( options )
    @id    = options['id'].to_i
    @name  = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists (name, genre)
      VALUES ('#{@name}', '#{@genre}') RETURNING * ;"
    artist = SqlRunner.run( sql ).first
    @id = artist['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET
      name = '@name',
      genre = '@genre'
      WHERE id = #{@id};"
    SqlRunner.run( sql )
    return self
  end

  def albums()
    Album.all.select { |album| album.artist_id == @id }
  end

end