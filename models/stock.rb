require_relative "../db/sql_runner"

class Stock

  attr_reader :id, :album_id, :format, :buy_price, :sell_price, :current_stock_level, :reorder_threshold

  def self.all()
    sql = "SELECT * FROM stocks;"
    Stock.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM stocks;"
    SqlRunner.run(sql)
  end

  def self.map_items( sql )
    stocks = SqlRunner.run(sql)
    return stocks.map { |stock| Stock.new(stock) }
  end

  def initialize( options )
    @id       = options['id'].to_i
    @album_id = options['album_id'].to_i
    @format   = options['format']

    @buy_price  = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i

    @current_stock_level = options['current_stock_level'].to_i
    @reorder_threshold   = options['reorder_threshold'].to_i
  end

  def save()
    sql = "INSERT INTO stocks (
      album_id,
      format,
      buy_price,
      sell_price,
      current_stock_level,
      reorder_threshold
      ) VALUES (
      #{@album_id},
      '#{@format}',
      #{@buy_price},
      #{@sell_price},
      #{@current_stock_level},
      #{@reorder_threshold}
      ) RETURNING * ;"
    stock = SqlRunner.run( sql ).first
    @id = stock['id'].to_i
  end

  def update()
    sql = "UPDATE stocks SET 
      album_id = #{@album_id},
      format   = '#{@format}',
      buy_price  = #{@buy_price},
      sell_price = #{@sell_price},
      current_stock_level = #{@current_stock_level},
      reorder_threshold   = #{@reorder_threshold}
      WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def album()
    Album.find(@album_id)
  end

  def artist()
    Artist.find(album().artist_id)
  end

  def genre()
    return album.artist.genre
  end

end