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
            raise "Mail not implemented!"
          else
            raise ArgumentError, "SDC Website not defined."
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
