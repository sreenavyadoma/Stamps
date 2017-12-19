# encoding: utf-8
#AB_ORDERSAUTO_3516
module Stamps
  module Mail
    module MailToolbarLeftSide
      def favorites

      end

      def mail_toolbar_model
        (cache[:mail_toolbar_model].nil?||!cache[:mail_toolbar_model].present?)?cache[:mail_toolbar_model]=PrintModal::MailPrintModal.new(param):cache[:mail_toolbar_model]
      end

      def print_button
        (cache[:print_button].nil?||!cache[:print_button].present?)?cache[:print_button] = StampsField.new(browser.span(text: 'Print')):cache[:print_button]
      end

      def print_postage
        open_window(mail_toolbar_model)
      end

      def open_window(window)
        return window if window.present?

        expect(print_button).to be_present, "Print button is not present."
        30.times do
          begin
            print_button.click
            window.wait_until_present(3)
            return window if window.present?
            expect(install_stamps_connect.body.text).to eql(install_stamps_connect.window_title.text) if install_stamps_connect.present?
            if please_wait.present?
              logger.message(please_wait.paragraph)
              please_wait.ok
              sleep(0.125)
              print_button.click
            end
            expect(insufficient_funds.text).to eql('Insufficient Funds') if insufficient_funds.present?
            if confirm_window.present?
              confirm_window.do_not_prompt.check
              confirm_window.continue
            end
            expect(print_postage_expecting_error.text).to eql(install_stamps_connect.window_title.text) if install_stamps_connect.present?
            if please_wait.present?
              logger.message(please_wait.paragraph)
              please_wait.ok
              sleep(0.125)
              print_button.click
            end
            return window if window.present?
          rescue
            #ignore
          end
        end
        expect(window).to be_present, "Unable to open Mail Print Modal"
      end
    end

    module MailToolbarRightSide
      def reset_fields
        StampsField.new(browser.span(css: "span[class*='sdc-icon-reset']"))
      end

      def feedback

      end

      def settings

      end

    end

    class MailToolbarMenu < Browser::Base
      include MailToolbarLeftSide
      include MailToolbarRightSide
    end
  end
end