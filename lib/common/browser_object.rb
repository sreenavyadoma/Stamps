module Stamps
  class BrowserObject
    def initialize(browser)
      @browser = browser
    end

    def browser_helper
      BrowserHelper.instance
    end
  end
end