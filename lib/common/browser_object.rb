module Stamps
  class BrowserObject
    def initialize(browser)
      @browser = browser
    end

    def browser_helper
      BrowserHelper.instance
    end

    def test_helper
      TestHelper.instance
    end
  end
end