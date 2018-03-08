module Stamps
  module Registration
    class DownloadPage < WebApps::Base
      def field
        StampsField.new driver.h1 css: "div>h1"
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
