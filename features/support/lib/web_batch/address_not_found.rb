module Batch
  class AddressNotFound < Stamps::BrowserObject

    private
    def exact_address_not_found_field
      @browser.div :text => 'Exact Address Not Found'
    end

    public
    def present?
      begin
        exact_address_not_found_field.wait_until_present
      rescue
        #ignore
      end
      browser_helper.present? exact_address_not_found_field
    end

    def row=(number=0)
      row = number.to_i<=0?0:number.to_i-1
      rox_input = @browser.input :css => "input[name=addrAmbig][value='#{row}']"
      accept_button = @browser.span :text => 'Accept'
      3.times do
        begin
          rox_input.click
          checked = rox_input.attribute_value("checked")
          rox_input.attribute_value("checked").include? "checked"
          if checked
            accept_button.click
            accept_button.wait_while_present
            break
          end
        rescue
          #ignore
        end
      end
    end

    def set(partial_address_hash)
      single_order_form = SingleOrderFormBase.new(@browser)
      single_order_form.validate_address_link
      single_order_form.expand_ship_to
      browser_helper.set single_order_form.browser_ship_to_textbox, BatchHelper.instance.format_address(partial_address_hash), 'Address'
      5.times {
        begin
          item_label.click
          break if (browser_helper.present?  exact_address_not_found_field) || (browser_helper.present?  single_order_form.validate_address_link)
        rescue
          #ignore
        end
      }
      single_order_form.less
      self
    end
  end
end