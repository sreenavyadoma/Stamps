module Stamps
  module Orders
    class USPSTermsModal < Browser::Modal
      private
      def usps_terms_modal
        browser.div(:text => "USPS Terms")
      end

      def checkbox_array
        browser.spans :css => 'span[id^=checkbox]'
      end

      def i_agree_button
        browser.span :css => 'span[id*=agree]'
      end

      def cancel_button
        browser.span :css => 'span[id*=cancel]'
      end

      def dont_show_again_checkbox
        checkbox_array[1]
      end

      public

      def is_usps_terms_modal_present
        usps_terms_modal.present?
      end

      def click_i_agree_button
        browser_helper.click i_agree_button
      end

      def click_cancel_button
        browser_helper.click cancel_button
      end

      def check_dont_show_again_checkbox
        browser_helper.click dont_show_again_checkbox
      end

    end
  end
end