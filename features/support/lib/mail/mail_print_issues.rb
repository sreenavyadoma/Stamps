module Stamps
  module Mail
    class MailInsufficientFunds < Browser::Base
      attr_reader :window_title, :body, :add_funds_btn, :close_btn

      def initialize(param)
        super
        @window_title = StampsField.new(browser.div(text: 'Insufficient Funds'))
        @body = StampsField.new(browser.div(text: 'div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]'))
        @add_funds_btn = StampsField.new(browser.span(text: 'Add Funds'))
        @close_btn = StampsField.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))
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
        @close = StampsField.new(browser.div(text: 'span[id^=button-1248-btnInnerEl]'))
        @cancel = StampsField.new(browser.div(text: 'span[id^=button-1249-btnInnerEl]'))
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

    class HiddenPostageWarning < Browser::Base #This class represents the hidden postage warning modal. It appears when the hidden postage button is checked while an incompatible extra service option is selected

      def continue_button
        (cache[:continue_button].nil? || !cache[:continue_button].present?) ? cache[:continue_button] = StampsField.new(browser.span text: "Continue") : cache[:continue_button]
      end

      def cancel_button
        (cache[:cancel_button].nil? || !cache[:cancel_button].present?) ? cache[:cancel_button] = StampsField.new(browser.span text: "Cancel") : cache[:cancel_button]
      end

      def window_title
        (cache[:window_title].nil? || !cache[:window_title].present?) ? cache[:window_title] = StampsField.new(browser.div text: "Hidden Postage Not Allowed") : cache[:window_title]
      end

      def present?
        window_title.present?
      end

      def extra_service service #This method confirms that the appropriate extra service text appears in the hidden postage warning modal, indicating which extra service caused the warning.
        StampsField.new(browser.li text: service)
      end

      def continue
        sleep 1
        continue_button.click
        sleep 1
        if continue_button.present?
          continue_button.click
        end
      end

      def cancel
        sleep 1
        cancel_button.click
      end
    end
  end
end
