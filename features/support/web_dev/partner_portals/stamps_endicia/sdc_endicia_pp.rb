module Stamps
  module WebDev
    module Portals
      module StampsEndicia

        class SdcEndiciaPP < SdcPageObject

          page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

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

          # def login_page
          #   LoginPage.new()
          # end

        end
      end
    end
  end
end



