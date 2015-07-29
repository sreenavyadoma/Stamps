class ConfirmPostage < BrowserObject
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

  def verify_confirm_modal
    confirm_purchase_header.wait_until_present(10)
    confirm_purchase_button.click
  end


end