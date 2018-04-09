module Stamps
  module WebDev
    module Portals
      module StampsEndicia

        class SdcEndiciaPP < SdcPageObject

          #page_url { |env| "https://#{env}.stamps.com" }
          page_url { |env| "https://#{env}-registration.stamps.com/registration/#!&p=profile" }

          def self.visit
            super(case SdcEnv.env
                    when :qacc
                      'qa'
                    when :qasc
                      'sdcwebsite.qasc'
                    when :stg
                      'sdcwebsite.staging'
                    when :prod
                      ''
                    else
                      # ignore
                  end)
          end

           def login_page
             LoginPage.new()
           end

        end
      end
    end
  end
end



