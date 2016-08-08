module Stamps
  module WebReg
    class DownloadPage < Browser::Modal
      def element
        ElementWrapper.new browser.h1 css: "div[class*=main-content-container]>div>div#page>h1"
      end

      def present?
        element.present?
      end

      def wait_until_present
        element.safely_wait_while_present 10
      end

      def text
        element.text
      end
    end
  end
end
