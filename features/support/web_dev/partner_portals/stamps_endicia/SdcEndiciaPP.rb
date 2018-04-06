module Stamps
  module WebDev
    module Portals
      module StampsEndicia
        class SdcEndiciaLanding < SdcPageObject
          page_url { |env| "https://#{env}.partner.stamps.com" }
          def self.visit
            super(case SdcEnv.env
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
                  end)
          end
        end
      end
    end
  end
end
