module Batch
  class GeneralStyles < BrowserObject
    def font_family
      styles = app_content.style "font-family"
      log styles
      styles
    end

    def font_size
      size = app_content.style "font-size"
      log size
      size
    end

    def app_content
      div= @browser.div :id => "appContent"
      present = browser_helper.present? div
      log present
      div
    end
  end
end