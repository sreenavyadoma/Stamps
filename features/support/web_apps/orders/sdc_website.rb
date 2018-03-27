module Stamps
  class SdcWebsite < PageObject
    class << self
      def visit
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

      end

      def orders
        @orders ||= if SdcEnv.browser
                      Orders::SdcOrders.new
                    elsif SdcEnv.i_device_name
                      Mobile::SdcOrders.new
                    else
                      raise "Unable to determine if this is a mobile or browser test."
                    end
      end

      def mail
        @mail
      end
    end
  end
end
