class BuyPostage < BrowserObject
  private
  def purchase_button
    span = @browser.span :id => "sdc-purchasewin-purchasebtn-btnInnerEl"
    present = span.present?
    text = span.text
    span
  end

  def confirm_purchase_button
    span_array = @browser.spans :text => 'Purchase'
    span = span_array.last
    present = span.present?
    text = span.text
    span
  end

  def ok_button
    span_array = @browser.spans :text => 'OK'
    span = span_array.last
    present = span.present?
    text = span.text
    span
  end

  def buy_10_button
    input = @browser.input :id => "sdc-purchasewin-10dradio"
    present = input.present?
    input
  end

  def buy_25_button
    input = @browser.input :id => "sdc-purchasewin-25dradio"
    present = input.present?
    input
  end

  def buy_50_button
    input = @browser.input :id => "sdc-purchasewin-50dradio"
    present = input.present?
    input
  end

  def buy_100_button
    input = @browser.input :id => "sdc-purchasewin-100dradio"
    present = input.present?
    input
  end

  def buy_other_button
    input = @browser.input :id => "sdc-purchasewin-otherdradio"
    present = input.present?
    input
  end

  def buy_other_textbox
    input = @browser.text_field :id => "sdc-purchasewin-otheramount"
    present = input.present?
    input
  end

  def purchase_processing
    div = @browser.div :css => "div[id^=processingpurchasewindow][id$=innerCt]"
    present = div.present?
    div
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
    confirm_purchase_button.click
  end

  def edit_payment_method

  end

  def autobuy

  end

  def wait_for_purchase_confirmation
    purchase_processing.wait_until_present
    purchase_processing.wait_while_present
  end

  def complete_purchase
    ok_button.click
  end
end
