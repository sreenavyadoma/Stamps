class PurchaseProcessing < BrowserObject
  private

  def purchase_processing
    @browser.div :css => "div[id^=processingpurchasewindow][id$=innerCt]"
  end

  def purchase_processing_header
    @browser.div :text => 'Processing Purchase'
  end

  public

  def wait_for_purchase_confirmation
    purchase_processing.wait_until_present(10)
    purchase_processing.wait_while_present
  end

end