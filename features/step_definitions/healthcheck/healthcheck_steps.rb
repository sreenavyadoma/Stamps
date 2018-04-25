Then /^Verify Health Check for (.+)$/ do |str|

  env = case(str.downcase)
        when /orders/
          case SdcEnv.env
          when :qacc
            'printext.qacc'
          when :qasc
            'printext.qasc'
          when :stg
            'print.testing'
          when :prod
            ''
          else
            # ignore
          end

        when /address/
          case SdcEnv.env
          when :qacc
            'printext.qacc'
          when :qasc
            'printext.qasc'
          when :stg
            'print.testing'
          when :prod
            ''
          else
            # ignore
          end

        when /or reports/
          case SdcEnv.env
          when :qacc
            'orext.qacc'
          when :qasc
            'orext.qasc'
          when :stg
            'or.staging'
          when :prod
            ''
          else
            # ignore
          end

        when /postage/
          case SdcEnv.env
          when :qacc
            'orext.qacc'
          when :qasc
            'orext.qasc'
          when :stg
            'or.staging'
          when :prod
            ''
          else
            # ignore
          end

        else
          # ignore
        end

  app = case(str.downcase)
        when /orders/
          :orders
        when /address/
          :addressbook
        when /or reports/
          :orreports
        when /postage/
          :postagetools
        else
          raise ArgumentError, "Healthcheck not supported for #{str}"
        end
  SdcHealthCheck.visit(env, app)
  expect(SdcHealthCheck.browser.text).to include("All tests passed") if SdcEnv.health_check
end
