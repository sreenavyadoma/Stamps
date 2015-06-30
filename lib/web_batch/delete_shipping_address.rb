module Batch
  class DeleteShippingAddress < Stamps::BrowserField
    public
    def delete
      5.times {
        begin
          log "Delete Shipping Address :: #{message_field.text}"
          field_helper.click delete_button, 'DeleteShippnigAddress'
        rescue
          #ignore
        end
        break unless present?
      }
    end

    def present?
      field_helper.field_present?  window_title
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