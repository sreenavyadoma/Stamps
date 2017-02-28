module Stamps
  module Orders
    module Details
      class MultiOrderDetails < Browser::StampsHtmlField
        private
        def order_count_label
          browser.ps(css: 'b').last
        end

        public
        def order_count
          expect(order_count_label.present?).to be(true)
          element_helper.text(order_count_label).gsub(/\d+/).first.to_i
        end
      end
    end
  end
end