
module Stamps
  module Orders
    module StampsExternalSites
      def square_com
        (cache[:orders_print_modal].nil?||!cache[:orders_print_modal].present?)?cache[:orders_print_modal] = Base.new(param).extend(ExternalSquare) :cache[:orders_print_modal]
      end

    end
  end
end
