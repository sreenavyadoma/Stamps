class BuyPostage < BrowserObject
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
    browser_helper.set_text buy_other_textbox, value, 'Buy'
    self
  end

  def purchase
    log "Purchase button clicked"
    purchase_button.click
    log "Purchase confirmed"
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
