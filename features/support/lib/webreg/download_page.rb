module Stamps
  module WebReg
    class DownloadPage < Browser::Modal
      def element
        BrowserElement.new browser.h1 css: "div>h1"
      end

      def present?
        element.present?
      end

      def wait_until_present *args
        element.safely_wait_while_present *args
      end

      def text
        element.text
      end
    end
  end
end
