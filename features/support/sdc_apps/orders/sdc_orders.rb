module Stamps
  module Orders
    module SdcOrdersInstHelper

    end

    class SdcOrders < SdcPageObject
      element(:loading_orders, {text: 'Loading orders...'})
      element(:signed_in_user, {id: 'userNameText'})

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

