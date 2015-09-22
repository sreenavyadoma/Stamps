module Batch

  class BatchObject < Stamps::Browser::BrowserObject
    def batch_helper
      BatchHelper.instance
    end
  end

  class BatchPage < BatchObject
    public
    def navigation_bar
      Navigation.new @browser
    end

    def toolbar
      Toolbar.new @browser
    end
  end

  class BatchHelper
    include Singleton
    include DataMagic

    def rand_login_credentials
      login_credentials = data_for(:login_credentials, {})[ENV['URL']]
      credentials = login_credentials.values
      credentials[rand(credentials.size)]
    end

    def format_address_arr address_array
      address = ""
      if address_array.is_a?(Array)
        address_array.each_with_index { |element, index|
          if index==address_array.size-1
            address = address + element.to_s.strip
          else
            address = address + element.to_s.strip + "\n"
          end
        }
      else
        raise "Unsupported address format."
      end
      log address
      address
    end

    def format_address address
      if address.is_a?(Hash)
        name = address['name'].to_s.strip
        log "name: #{name}"
        company = address['company'].to_s.strip
        log "company: #{company}"
        street_address = address['street_address'].to_s.strip
        log "street_address: #{street_address}"
        city = address['city'].to_s.strip
        log "city: #{city}"
        state = address['state'].to_s.strip
        log "state: #{state}"
        zip = address['zip'].to_s.strip
        log "zip: #{zip}"
        formatted = "#{name}\n#{company}\n#{street_address}\n #{city}, #{state}. #{zip}"
        log "Formatted Address:  #{formatted}"
        formatted
      elsif address.is_a?(Array)
        format_address_arr(address)
      elsif address.include?(',')
        format_address_arr address.split(/,/)
      elsif address.is_a?(String)
        address
      else
        raise "Unsupported address format."
      end
    end
  end

  class TrackingSelection < BatchObject
    def initialize(browser, selection)
      super browser
      @selection = selection
      self
    end

    def tracking_textbox
      @browser.text_field :name => 'Tracking'
    end

    def drop_down
      @browser.div :css => "div[id^=trackingdroplist-][id$=-trigger-picker]"
    end

    def tracking
      @browser.td :text => @selection
    end

    def select
      browser_helper.click(drop_down, "TrackingDropDown")
      5.times {
        begin
          browser_helper.click(drop_down, "TrackingDropDown") unless browser_helper.present?  tracking
          browser_helper.click tracking, "[#{@selection}]"

          # Click this field 3 times to make tool tip disapper, tool tip appears after setting service.
          3.times
          begin
            browser_helper.click single_order_form_item_label if browser_helper.present?  single_order_form_item_label
          rescue
            #ignroe
          end

          break if browser_helper.text(tracking_textbox).include? @selection
        rescue
          #ignore
        end
      }
      @cost
    end
  end

  class ServiceSelection < BatchObject
    def initialize browser, selection
      #select the service and get service cost
      super browser
      @selection = selection
      self
    end

    public

    def select
      browser_helper.click(drop_down, "ServiceDropDown")
      5.times {
        begin
          browser_helper.click(drop_down, "ServiceDropDown") unless browser_helper.present?  service
          @cost = test_helper.remove_dollar_sign(cost_label.text)
          drop_down.click unless browser_helper.present?  service
          log_browser_set service, @selection, "Service[#{@cost}]"
          service.click

          # Click this field 3 times to make tool tip disapper, tool tip appears after setting service.
          3.times
          begin
            browser_helper.click single_order_form_item_label if browser_helper.present?  single_order_form_item_label
          rescue
            #ignroe
          end
          service_input_text = browser_helper.text service_textbox
          break if service_input_text.include? @selection
        rescue => exception
          #log exception.backtrace
          field = @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
          Watir::Wait.until {field.present?}
        end
      }
      @cost
    end

    private

    def cost_label
      @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(3)"
    end

    def single_order_form_item_label
      @browser.label :text => 'Item:'
    end

    def service_textbox
      @browser.text_field :css => 'input[name^=servicedroplist-]'
    end

    def drop_down
      @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
    end

    def service
      @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(2)"
    end
  end

end