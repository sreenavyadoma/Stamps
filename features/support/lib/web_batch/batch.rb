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


  class WebBatch < BatchPage
    def sign_in(*args)
      LoginPage.new(@browser).sign_in *args
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def single_order_form
      SingleOrderForm.new(@browser)
    end

    def grid
      Grid.new(@browser)
    end

    def styles
      PageStyles.new @browser
    end
  end


  class WelcomeOrdersPage < BatchObject
    private
    def continue_span
      @browser.span :text => "Continue"
    end

    public
    def present?
      browser_helper.present? continue_span
    end

    def wait_until_present
      begin
        continue_span.wait_until_present
      rescue
        #ignore
      end
    end

    def continue
      5.times{
        if browser_helper.present? continue_span
          browser_helper.click continue_span, 'continue'
        end
        break unless browser_helper.present? continue_span
      }
    end
  end

  class WelcomeModal < BatchObject
    private
    def okay_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      browser_helper.present? okay_button
    end

    def wait_until_present
      begin
        okay_button.wait_until_present
      rescue
        #ignore
      end
    end

    def ok
      5.times{
        browser_helper.click okay_button, 'OK'
        break unless browser_helper.present? okay_button
      }
    end
  end

end