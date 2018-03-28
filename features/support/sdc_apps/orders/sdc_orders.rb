module Stamps
  module Orders
    class SdcOrders < SdcPageObject
      element(:loading_orders) { SdcElement.new(browser.div(text: 'Loading orders...')) } # this stays here
      element(:signed_in_user, required: true) {SdcElement.new(browser.span(id: 'userNameText'))} # this will need to move to Navigation > Signed-in Dropdown

      def order_details

      end

      def navigation

      end

      def toolbar

      end

      def orders_grid

      end

      def left_filter_panel

      end

      def paging_toolbar

      end
    end
  end
end

