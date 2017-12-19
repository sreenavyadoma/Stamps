module Stamps
  module Mail
    class MailInsufficientFunds < Browser::Base
      attr_reader :window_title, :body, :add_funds_btn, :close_btn

      def initialize(param)
        super
        @window_title=StampsField.new(browser.div(text: 'Insufficient Funds'))
        @body=StampsField.new(browser.div(text: 'div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]'))
        @add_funds_btn=StampsField.new(browser.span(text: 'Add Funds'))
        @close_btn=StampsField.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))
      end

      def present?
        window_title.present?
      end

      def text
        body.text
      end

      def close
        close_btn.click_while_present
      end

      def add_funds
        add_funds_btn.click #todo-rob need to connect this to AddFundsModal
      end
    end

    class PrintQuantityWarning < Browser::Base
      attr_reader :agree_and_continue_btn, :close, :cancel

      def initialize(param)
        super
        @close=StampsField.new(browser.div(text: 'span[id^=button-1248-btnInnerEl]'))
        @cancel=StampsField.new(browser.div(text: 'span[id^=button-1249-btnInnerEl]'))
        #@agree_and_continue_btn=StampsElement.new()
      end

      def close
        close.click
      end

      def cancel
        cancel.click
      end

      def agree_and_continue
        agree_and_continue_btn.click_while_present
        expect(agree_and_continue_btn.present?).not_to be(true)
      end

    end

    class HiddenPostageWarning < Browser::Base
      attr_reader :continue_button, :cancel_button

      def initialize(param)
        super
        @continue_button=StampsField.new(browser.span text: "Continue")
        @cancel_button=StampsField.new(browser.span text: "Cancel")
        #@agree_and_continue_btn=StampsElement.new()
      end

      def present?
        window_title.present?
      end

      def window_title
        StampsField.new(browser.div text: "Hidden Postage Not Allowed")
      end

      def extra_service service
        StampsField.new(browser.li text: service)
      end

      def continue
        continue_button.click
      end

      def cancel
        cancel_button.click
      end
    end
  end
end
