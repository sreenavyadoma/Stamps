module Stamps
  module Mail
    class Toolbar < Browser::Modal
      attr_reader :settings, :reset, :help, :feedback, :classic

      def initialize(param)
        super(param)
        @settings = BrowserElement.new (browser.span css: "span[style*='settings.png']")
        @reset = BrowserElement.new (browser.span css: "span[style*='reset.png']")
        @help = BrowserElement.new (browser.span css: "span[style*='help.png']")
        @feedback = BrowserElement.new (browser.span css: "span[style*='feedback.png']")
        @classic = BrowserElement.new (browser.span css: "span[style*='classic.png']")
      end

      def present?
        settings.present?
      end

      def wait_until_present *args
        toolbar.wait_until_present *args
      end

    end
  end
end