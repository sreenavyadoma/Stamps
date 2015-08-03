class PurchaseComplete < BrowserObject
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
