module Stamps
  module Orders
    module Details
      class MultiOrderDetails < Browser::StampsModal
        private
        def order_count_label
          browser.ps(css: 'b').last
        end

        public
        def order_count
          expect(order_count_label).to be_present
          StampsElement.new(order_count_label).text.gsub(/\d+/).first.to_i
        end
      end
    end
  end
end