module Stamps
  module Orders
    module Stores
      class ServerError < Browser::StampsBase
        def present?
          browser.div(text: "Server Error").present?
        end

        def message
          StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")).text
        end

        def ok
          button=StampsField.new browser.span(text: 'OK')
          button.click_while_present
        end
      end
    end
  end
end