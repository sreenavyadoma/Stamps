module Stamps
  module Mail
    class MailToolbar < Browser::Modal
      attr_reader :settings, :reset, :help, :feedback, :classic

      def initialize(param)
        super(param)
        @settings = StampsElement.new(browser.span css: "span[style*='settings.png']")
        @reset = StampsElement.new(browser.span css: "span[style*='reset.png']")
        @help = StampsElement.new(browser.span css: "span[style*='help.png']")
        @feedback = StampsElement.new(browser.span css: "span[style*='feedback.png']")
        @classic = StampsElement.new(browser.span css: "span[style*='classic.png']")
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