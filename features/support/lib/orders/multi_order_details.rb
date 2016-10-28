module Stamps
  module Orders
    module Details
      class MultiOrderDetails < Browser::Modal
        private
        def order_count_label
          browser.ps(css: 'b').last
        end

        public
        def order_count
          begin
            logger.info "Teardown: Begin tearing down test"
            TestHelper.teardown
            logger.info "Teardown: Done!"
            "Multi-order Count Label does not exist or Multi-order form not opened.".should eql ""
          end unless order_count_label.present?
          element_helper.text(order_count_label).gsub(/\d+/).first.to_i
        end
      end
    end
  end
end