module Stamps
  module SdcOrders
    class LoadingPopUp < SdcPage
      page_obj(:loading_orders) { {text: 'Loading orders...'} }
    end

    class << self
      def loading_popup
        LoadingPopUp.new.loading_orders
      end

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
          # return true unless loading_orders.present?
          return true unless loading_popup.present?
          sleep(1)
        end
      end
    end
  end
end

