module Batch
  include Stamps

  def batch
    @batch ||= WebBatch.new(@browser)
  end

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
    return data_for(:url_prefix, {})[ENV['URL']]
  end

  def self.order_id=(order_id)
    @order_id = order_id
    log "New Order ID:  #{order_id}"
  end

  def self.order_id
    @order_id
  end

  def teardown
    Stamps.teardown
  end

  def randomize_ship_from *args
    case args.length
      when 1
        address = args[0]
        if address.downcase.include? "random"
          @random_ship_from = TestHelper.instance.random_ship_from
        else
          @random_ship_from = address
        end
      else
        raise "Parameter Exception:  Wrong number of arguments for random_ship_from"
    end
  end

  def random_ship_to *args
    case args.length
      when 1
        address = args[0]
        if address.downcase.include? "random"
          test_helper.random_ship_to
        else
          address
        end
      else
        raise "Parameter Exception:  Wrong number of arguments for random_ship_from"
    end
  end

  def new_order_row
    1
  end
end