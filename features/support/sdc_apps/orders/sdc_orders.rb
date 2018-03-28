module Stamps
  module Orders
    class SdcOrders < SdcPageObject
      element(:loading_orders) { SdcElement.new(browser.div(text: 'Loading orders...')) } # this stays here
      element(:signed_in_user) {SdcElement.new(browser.span(id: 'userNameText'))} # this will need to move

      def order_details

      end

      def toolbar

      end
    end
  end
end

