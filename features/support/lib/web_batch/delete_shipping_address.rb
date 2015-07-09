module Batch
  class DeleteShippingAddress < Stamps::BrowserObject
    public
    def delete
      5.times {
        begin
          log "Delete Shipping Address :: #{message_field.text}"
          browser_helper.click delete_button, 'Delete'
        rescue
          #ignore
        end
        break unless present?
      }
    end

    def present?
      browser_helper.field_present?  window_title
    end

    def close
      field = @browser.elements(:css => 'img[class$=close]').last
      present = field.present?
      field.click if present
    end

    private
    def window_title
      @browser.div :text => "Delete Shipping Address"
    end
    def message_field
      @browser.div :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
    end

    def delete_button
      field = @browser.elements(:text => 'Delete').last
      present = field.present?
      field
    end
  end
end