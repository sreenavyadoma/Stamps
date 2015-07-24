class BuyPostage < BrowserObject
  private
  def purchase_button
    @browser.span :id => "sdc-purchasewin-purchasebtn-btnInnerEl"
  end

  def confirm_purchase_button
    span_array = @browser.spans :text => 'Purchase'
    span_array.last
  end

  def confirm_purchase_modal
    @browser.div :text => 'Confirm Purchase'
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

  def purchase_processing
    @browser.div :css => "div[id^=processingpurchasewindow][id$=innerCt]"
  end

  public

  def buy_10
    buy_10_button.click
  end

  def buy_25
    buy_25_button.click
  end

  def buy_50
    buy_50_button.click
  end

  def buy_100
    buy_100_button.click
  end

  def buy_other=(value)
    buy_other_button.click
    browser_helper.set_text buy_other_textbox, value, 'Buy'
  end

  def purchase
    purchase_button.click
  end

  def confirm_purchase

  end

  def verify_confirm_modal
    confirm_purchase_modal.wait_until_present(10)
    confirm_purchase_button.click
  end

  def edit_payment_method
    raise "Edit Payment Method is not yet implemented."
  end

  def autobuy
    raise "AutoBuy is not implemented"
  end

  def wait_for_purchase_confirmation
    purchase_processing.wait_until_present
    purchase_processing.wait_while_present
  end

  def complete_purchase
    ok_button.click
  end
end
