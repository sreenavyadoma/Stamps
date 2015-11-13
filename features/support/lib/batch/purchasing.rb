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
      log.info "Purchase Complete, clicking OK"
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
      log.info "Waiting for purchase processing to complete"
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

  class ConfirmPostage < BatchObject
    private

    def confirm_purchase_button
      span_array = @browser.spans :text => 'Purchase'
      span_array.last
    end

    def exit_button
      span_array = @browser.imgs :class => 'x-tool-img x-tool-close'
      span_array.last
    end

    def confirm_purchase_header
      @browser.div :text => 'Confirm Purchase'
    end

    public

    def purchase_processing
      PurchaseProcessing.new(@browser)
    end

    def exit_confirm_modal
      exit_button.click
    end

    def click_confirm_modal
      log.info "Confirming Purchase"
      confirm_purchase_header.wait_until_present(10)
      confirm_purchase_button.click
      self
    end


  end

  class BuyPostage < BatchObject
    private
    def purchase_button
      @browser.span :id => "sdc-purchasewin-purchasebtn-btnInnerEl"
    end

    def ok_button
      span_array = @browser.spans :text => 'OK'
      span_array.last
    end

    def buy_10_button
      @browser.input :id => "sdc-purchasewin-10dradio"
    end

    def buy_25_button
      @browser.input :id => "sdc-purchasewin-25dradio"
    end

    def buy_50_button
      @browser.input :id => "sdc-purchasewin-50dradio"
    end

    def buy_100_button
      @browser.input :id => "sdc-purchasewin-100dradio"
    end

    def buy_other_button
      @browser.input :id => "sdc-purchasewin-otherdradio"
    end

    def buy_other_textbox
      @browser.text_field :id => "sdc-purchasewin-otheramount"
    end

    public

    def confirm_postage
      ConfirmPostage.new(@browser)
    end

    def buy_10
      buy_10_button.click
      self
    end

    def buy_25
      buy_25_button.click
      self
    end

    def buy_50
      buy_50_button.click
      self
    end

    def buy_100
      buy_100_button.click
      self
    end

    def buy_other(value)
      buy_other_button.click
      browser_helper.set buy_other_textbox, value, 'Buy'
      self
    end

    def purchase
      log.info "Purchase button clicked"
      purchase_button.click
      log.info "Purchase confirmed"
      self
    end

    def edit_payment_method
      raise "Edit Payment Method is not yet implemented."
    end

    def autobuy
      raise "AutoBuy is not implemented"
    end

    def complete_purchase
      ok_button.click
      self
    end
  end

end