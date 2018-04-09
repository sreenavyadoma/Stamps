module Stamps
  module WebDev
    module Portals
      class StampsEndicia < SdcPageObject

        #page_url { |env| "https://#{env}.partner.stamps.com" }
        page_url { |env| "https://#{env}-registration.stamps.com/registration/#!&p=profile" }

        def self.visit
          super(case SdcEnv.env
                  when :qacc
                    'qa'
                  when :qasc
                    'sdcwebsite.qasc'
                  when :stg
                    'staging'
                  when :prod
                    ''
                  else
                    # ignore
                end)
        end

        class << self
          def login_page
            LoginPage.new()
          end

        end

      end
    end
  end
end



