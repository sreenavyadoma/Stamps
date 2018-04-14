module Stamps
  module Orders
    module SdcOrdersInstHelper
      def toolbar_inst
        if SdcEnv.browser
          'Orders::SdcOrdersToolbar'
        else
          'Orders::SdcOrdersToolbar'
        end
      end
    end

    class SdcOrders < SdcPageObject
      element(:loading_orders) { {text: 'Loading orders...'} }
      element(:grid_body, required: true) { {xpath: "//*[contains(@class, 'orders-grid')]"} }

      def order_details
        @order_details ||= SdcOrderDetails.new
      end

      def bulk_update
        @bulk_update = nil
      end

      def toolbar
        #@toolbar ||= Object.const_get(toolbar_inst).new
        @toolbar ||= SdcOrdersToolbar.new
      end

      def grid

      end

      def filter_panel
        @filter_panel ||= SdcOrdersFilterPanel.new
      end

      def wait_until_present(count=30)
        (count.nil? || count == 0 ? 1 : count.to_i).times do
          return true unless loading_orders.present?
          sleep(1)
        end
      end
      #part of grid
      # def paging_toolbar
      #
      # end
    end
  end
end

