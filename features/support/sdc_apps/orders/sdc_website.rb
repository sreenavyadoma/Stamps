module Stamps
  class SdcWebsite < SdcPageObject
    class << self
      def visit
        if SdcEnv.browser
          case SdcEnv.sdc_app
            when :orders
              Orders::LandingPage.visit(case SdcEnv.env
                                          when :qacc
                                            'ext.qacc'
                                          when :qasc
                                            'ext.qasc'
                                          when :stg
                                            '.testing'
                                          when :prod
                                            ''
                                          else
                                            # ignore
                                        end
              )
            when :mail
              raise "Not implemented!"
            else
              raise ArgumentError, "Don't know how to visit app :#{SdcEnv.sdc_app}"
          end
        elsif SdcEnv.i_device_name
          raise "Not Implemented"
        else
          raise ""
        end

      end

      def orders
        @orders ||= Object.const_get(if SdcEnv.browser
                                       "Orders::SdcOrders"
                                     elsif SdcEnv.i_device_name
                                       "Mobile::SdcOrders"
                                     else
                                       raise "Unable to determine if this is a mobile or browser test."
                                     end
        ).new
      end

      def mail
        raise "Not Implemented"
=begin
        @mail ||= if SdcEnv.browser
                    Orders::SdcMail.new
                  elsif SdcEnv.i_device_name
                    Mobile::SdcOrders.new
                  else
                    raise "Unable to determine if this is a mobile or browser test."
                  end
=end
      end
    end
  end
end
