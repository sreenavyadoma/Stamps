module Batch
  include Stamps

  def self.grid_columns *args
    case args.length
      when 1
        @column_index_hash ||= args[0]
      when 0
        @column_index_hash
      else
        raise "Illegal number of arguments"
    end
  end

  def self.grid_column_fields *args
    case args.length
      when 1
        @column_fields ||= args[0]
      when 0
        @column_fields
      else
        raise "Illegal number of arguments"
    end
  end

  def self.url_prefix
    @url_prefix ||= data_for(:url_prefix, {})[ENV['URL']]
  end

  def self.order_id=(order_id)
    @order_id = order_id
    log "New Order ID:  #{order_id}"
  end

  def self.order_id
    @order_id
  end

end