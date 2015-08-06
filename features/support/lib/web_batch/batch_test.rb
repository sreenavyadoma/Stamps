module Batch
  def setup
    @batch = WebBatch.new(Stamps.setup)
  end

  def batch
    @batch
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

  def randomize_ship_to *args
    case args.length
      when 1
        address = args[0]
        if address.downcase.include? "random"
          @ship_to = test_helper.random_ship_to
        else
          @ship_to = address
        end
      else
        raise "Parameter Exception:  Wrong number of arguments for random_ship_from"
    end
  end

  def new_order_row
    1
  end
end