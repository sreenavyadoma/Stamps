
module Stamps
  module Orders
    module Stores
      include Stamps

      def volusion
        Stores::VolusionLoginPage.new param
      end
    end
  end
end
#todo fix volusion store