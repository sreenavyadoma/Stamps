module Batch
  class PurchaseComplete < BatchObject
    private

    def ok_button
      span_array = @browser.spans :text => 'OK'
      span_array.last
    end

    def purchase_complete_header
      @browser.div :text => 'Purchase Approved'
    end

    public

    def complete_purchase
      log "Purchase Complete, clicking OK"
      begin
        purchase_complete_header.wait_until_present(10)
      rescue
        #ignore
      end
      browser_helper.click ok_button
    end
    self
  end

  class PurchaseProcessing < BatchObject
    private

    def purchase_processing
      div =@browser.div :css => "div[id^=processingpurchasewindow][id$=innerCt]"
      div.style
    end

    def purchase_processing_header
      @browser.div :text => 'Processing Purchase'
    end

    public

    def purchase_complete
      PurchaseComplete.new(@browser)
    end

    def wait_for_purchase_confirmation
      log "Waiting for purchase processing to complete"
      20.times {
        begin
          purchase_processing.wait_while_present
          break unless browser_helper.present? purchase_processing
        rescue
          #ignroe
        end
      }
      self
    end

  end
end