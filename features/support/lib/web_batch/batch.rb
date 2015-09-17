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

  def setup
    @batch = WebBatch.new(Stamps.setup)
  end

  def batch
    @batch ||= WebBatch.new(Stamps.setup)
  end

  def single_order_form *args
    case args.length
      when 0
        @single_order_form
      when 1
        @single_order_form = args[0]
      else
        raise "Parameter Error:  Illegal number of arguments.  single_order_form"
    end

  end

  def teardown
    Stamps.teardown
  end

  def randomize_ship_from *args
    case args.length
      when 1
        address = args[0]
        if address.downcase.include? "random"
          @random_ship_from = test_helper.random_ship_from
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