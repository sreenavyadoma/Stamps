module Stamps
  module WebDev
    module StampsEndicia
      class PartnerPortals < SdcPageObject

        #page_url { |env| "https://#{env}.partner.stamps.com" }
        page_url { |env| "https://uspsportal.#{env}.stampsendicia.net/login" }

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
            PartnerPortal::LoginPage.new()
          end

          def dashboard_page
            PartnerPortal::DashboardPage.new()
          end

          def password_reset_page
            PartnerPortal::PasswordResetPage.new()
          end
        end

      end


    end
  end
end



