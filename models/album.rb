require_relative "../db/sql_runner"

class Album

  attr_reader :id, :name, :artist_id

  def self.all()
    sql = "SELECT * FROM albums;"
    return Album.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    return Album.map_item(sql)
  end

  def self.map_items( sql )
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def self.map_item( sql )
    return Album.map_items(sql).first
  end

  def initialize( options )
    @id        = options['id'].to_i
    @name      = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', #{@artist_id}) RETURNING * ;"
    album = SqlRunner.run( sql ).first
    @id = album['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET 
      name = '#{@name}', 
      artist_id = #{artist_id}
      WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

end
