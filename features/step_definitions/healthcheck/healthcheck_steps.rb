Then /^Verify Health Check for (.+)$/ do |str|
  env = case SdcEnv.env
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
