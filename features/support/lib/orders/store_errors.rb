module Stamps
  module Orders
    module Stores
      class ServerError < WebApps::Base
        def present?
          driver.div(text: "Server Error").present?
        end

        def message
          StampsField.new(driver.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")).text
        end

        def ok
          button = StampsField.new driver.span(text: 'OK')
          button.click_while_present
        end
      end
    end
  end
end