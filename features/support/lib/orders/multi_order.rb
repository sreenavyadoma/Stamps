module Orders
  module Details
    class MultiOrder < OrdersObject
      private
      def order_count_label
        @browser.ps(:css => 'b').last
      end

      public
      def order_count
        raise "Multi-order Count Label does not exist or Multi-order form not opened." unless browser_helper.present? order_count_label
        browser_helper.text(order_count_label).gsub(/\d+/).first.to_i
      end
    end
  end
end