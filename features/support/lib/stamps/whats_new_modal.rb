module Stamps
  module Common
    class WhatsNewModal < Browser::Modal
      attr_reader :x_btn, :more_info_btn, :continue

      def initialize param
        super param
        @x_btn ||= ElementWrapper.new browser.img css: 'img.x-tool-close'
        @more_info_btn ||= 'More Info'
        @continue ||= ElementWrapper.new browser.span css: 'span[id$=continuebtn-btnInnerEl]'
      end

      def present?
        x_btn.present?
      end

      def safely_wait_until_present
        x_btn.safely_wait_until_present 2
      end

      def close
        x_btn.click_while_present
      end
    end
  end
end