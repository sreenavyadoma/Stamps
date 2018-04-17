module Stamps
  module WebDev
    module StampsEndicia
      class PartnerPortal < SdcPage
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
            @login_page ||= LoginPage.new()
          end

          def dashboard_page
            DashboardPage.new()
          end

          def reset_password_page
            PasswordResetPage.new()
          end

          def stamps_endicia_common_page
            StampsEndiciaCommon.new()
          end
        end

      end

      class UspsPortal < SdcPage
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
            LoginPage.new()
          end

          def dashboard_page
            DashboardPage.new()
          end

          def reset_password_page
            PasswordResetPage.new()
          end

          def stamps_endicia_common_page
            StampsEndiciaCommon.new()
          end
        end

      end

    end
  end
end



