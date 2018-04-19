module Stamps

  module NewPartnerPortal #< SdcPage
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
        @login_page ||= PPLoginPage.new()
      end

      def dashboard_page
        @dashboard_page ||=PPDashboardPage.new()
      end

      def reset_password_page
        @reset_password_page ||= PPResetPasswordPage.new()
      end

      def stamps_endicia_common_page
        @stamps_endicia_common_page ||= StampsEndiciaCommon.new()
      end
    end

  end




  module NewUspsPortal #< SdcPage

  # ALL THESE ITEMS BELOW SHOULD BE IN UspsLoginPage
    # page_url { |env| "https://uspsportal.#{env}.stampsendicia.net/login" }
    #
    # def self.visit
    #   super(case SdcEnv.env
    #         when :qacc
    #           'qacc'
    #         when :qasc
    #           'sdcwebsite.qasc'
    #         when :stg
    #           'staging'
    #         when :prod
    #           ''
    #         else
    #           # ignore
    #         end)
    # end

    class << self
      # def login_page
      #   @login_page ||= USPSPLoginPage.new()
      # end

      # def dashboard_page
      #   USPSPDashboardPage.new()
      # end
      #
      # def reset_password_page
      #   USPSPResetPasswordPage.new()
      # end

      # def stamps_endicia_common_page
      #   StampsEndiciaCommon.new()
      # end
    end

  end







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
            @login_page ||= PPLoginPage.new()
          end

          def dashboard_page
            @dashboard_page ||=PPDashboardPage.new()
          end

          def reset_password_page
            @reset_password_page ||= PPResetPasswordPage.new()
          end

          def stamps_endicia_common_page
            @stamps_endicia_common_page ||= StampsEndiciaCommon.new()
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
          # def login_page
          #   @login_page ||= USPSPLoginPage.new()
          # end

          # def dashboard_page
          #   USPSPDashboardPage.new()
          # end
          #
          # def reset_password_page
          #   USPSPResetPasswordPage.new()
          # end

          # def stamps_endicia_common_page
          #   StampsEndiciaCommon.new()
          # end
        end

      end

    end
  end
end



