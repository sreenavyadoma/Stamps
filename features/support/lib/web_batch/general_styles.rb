module Batch
  class GeneralStyles < BrowserObject
    def app_content
      div= @browser.div :id => "appContent"
      present = browser_helper.present? div
      log present
      styles = div.style "font-family"
      log styles
      styles2 = div.style
      log styles2
    end
  end
end