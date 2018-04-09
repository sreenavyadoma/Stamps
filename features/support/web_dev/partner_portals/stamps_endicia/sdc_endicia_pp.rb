module Stamps
  module WebDev
    module Portals
      module StampsEndicia

        class SdcEndiciaPP < SdcPageObject

          page_url { |env| "https://#{env}stamps.com" }

          def self.visit
            super(case SdcEnv.env
                    when :qacc
                      'ext.sdcwebsite.staging'
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

          # def login_page
          #   LoginPage.new()
          # end

        end
      end
    end
  end
end



