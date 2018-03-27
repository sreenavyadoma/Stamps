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
