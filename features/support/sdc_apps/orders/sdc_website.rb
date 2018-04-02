module Stamps
  class SdcWebsite < SdcPageObject
    class << self
      attr_writer :orders

      def orders
        @orders = Object.const_get(if SdcEnv.browser
                                       "Orders::SdcOrders"
                                     elsif SdcEnv.mobile
                                       "Mobile::SdcOrders"
                                     else
                                       raise "Can not determine if mobile or browser test."
                                     end
        ).new if @orders.nil?
        @orders
      end

      def mail
        raise "Not Implemented"
=begin
        @mail ||= if SdcEnv.browser
                    Orders::SdcMail.new
                  elsif SdcEnv.mobile
                    Mobile::SdcOrders.new
                  else
                    raise "Unable to determine if this is a mobile or browser test."
                  end
=end
      end
    end
  end
end
