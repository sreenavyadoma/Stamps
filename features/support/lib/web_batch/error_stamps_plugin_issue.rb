module Batch
  class ErrorStampsPluginIssue < BrowserObject
    private
    def close_window_button
      img = @browser.img :css => "img[class='x-tool-img x-tool-close']"
      log "#{(browser_helper.present? img)?'Stamps.com Plugin Issue':''}"
      img
    end

    def window_title
      span = @browser.span :text => "Stamps.com Plugin Issue"
      log "#{(browser_helper.present? span)?'Stamps.com Plugin Issue':''}"
      span
    end

    public
    def present?
      browser_helper.present? window_title
    end

    def close
      browser_helper.click close_window_button, 'close'
    end
  end
end