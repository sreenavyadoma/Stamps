module Stamps
  module Print
    class Toolbar < Print::Postage::PrintObject
      def settings
        BrowserElement.new (browser.span :css => "span[style*='settings.png']")
      end

      def reset
        BrowserElement.new (browser.span :css => "span[style*='reset.png']")
      end

      def help
        BrowserElement.new (browser.span :css => "span[style*='help.png']")
      end

      def feedback
        BrowserElement.new (browser.span :css => "span[style*='feedback.png']")
      end

      def classic
        BrowserElement.new (browser.span :css => "span[style*='classic.png']")
      end

    end
  end
end