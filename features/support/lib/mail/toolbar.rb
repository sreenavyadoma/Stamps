module Stamps
  module Mail
    class Toolbar < Browser::Modal
      def settings
        ElementWrapper.new (browser.span css: "span[style*='settings.png']")
      end

      def reset
        ElementWrapper.new (browser.span css: "span[style*='reset.png']")
      end

      def help
        ElementWrapper.new (browser.span css: "span[style*='help.png']")
      end

      def feedback
        ElementWrapper.new (browser.span css: "span[style*='feedback.png']")
      end

      def classic
        ElementWrapper.new (browser.span css: "span[style*='classic.png']")
      end

    end
  end
end