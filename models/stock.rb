require_relative "../db/sql_runner"

class Stock

  def initialize( options )
    @id         = options['id'].to_i
    @album_id   = options['id'].to_i
    @format     = options['format']
    @stock      = options['stock'].to_i
    @threshold  = options['threshold'].to_i
    @buy_price  = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

end