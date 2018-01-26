
module Stamps
  module Orders
    module ExternalSites
      class WebPage < BaseCache
        assign({})
        def square_com
          (cache[:orders_print_modal].nil?||!cache[:orders_print_modal].present?)?cache[:orders_print_modal] = SquareLogin.new(param) :cache[:orders_print_modal]
        end

        def other_external_stores

        end

        def etsy
        end
      end
    end
  end
end
