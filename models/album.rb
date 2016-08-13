require_relative "../db/sql_runner"

class Album

  attr_reader :id, :name, :artist_id

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
