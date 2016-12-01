module Stamps
  module Mail
    class Toolbar < Browser::Modal
      attr_reader :settings, :reset, :help, :feedback, :classic

      def initialize param
        super param
        @settings = ElementWrapper.new (browser.span css: "span[style*='settings.png']")
        @reset = ElementWrapper.new (browser.span css: "span[style*='reset.png']")
        @help = ElementWrapper.new (browser.span css: "span[style*='help.png']")
        @feedback = ElementWrapper.new (browser.span css: "span[style*='feedback.png']")
        @classic = ElementWrapper.new (browser.span css: "span[style*='classic.png']")
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