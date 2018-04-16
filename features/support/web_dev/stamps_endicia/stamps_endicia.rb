module Stamps
  module WebDev
    module StampsEndicia
      class PartnerPortals < SdcPage
        
        #stamps and endicia logo
        page_objs(:sdc_endicia_logos)  {{xpath: "//img[@alt='Stamps.com and Endicia']"}}
        _element(:sdc_endicia_logo_browser) {:sdc_endicia_logos[0]}
        _element(:sdc_endicia_logo_mobile) {:sdc_endicia_logos[1]}

        #page_url { |env| "https://#{env}.partner.stamps.com" }
        page_url { |env| "https://uspsportal.#{env}.stampsendicia.net/login" }

        def self.visit
          super(case SdcEnv.env
                  when :qacc
                    'qacc'
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

          def reset_password_page
            PartnerPortal::PasswordResetPage.new()
          end
        end

      end

    end
  end
end



