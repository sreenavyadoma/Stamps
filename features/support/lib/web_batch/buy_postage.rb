class BuyPostage < BrowserObject
  private
  def purchase_button
    span = @browser.span :id => "sdc-purchasewin-purchasebtn-btnInnerEl"
    present = span.present?
    text = span.text
    span
  end

  public
  def buy value

  end

  def purchase
    purchase_button.click
  end

  def edit_payment_method

  end

  def autobuy

  end
end