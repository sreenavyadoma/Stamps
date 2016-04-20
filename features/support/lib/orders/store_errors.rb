module Orders
  module Stores
    class ServerError < OrdersObject
      def present?
        browser_helper.present? @browser.div(text: "Server Error")
      end

      def message
        browser_helper.text @browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
      end

      def ok
        button = StampsButton.new @browser.span(text: 'OK')
        button.click_while_present
      end
    end
  end
end