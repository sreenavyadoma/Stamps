module Stamps
  module Registration
    class DownloadPage < Browser::StampsBase
      def field
        StampsField.new browser.h1 css: "div>h1"
      end

      def present?
        field.present?
      end

      def wait_until_present(*args)
        field.wait_until_present(*args)
      end

      def text
        field.text
      end
    end
  end
end
