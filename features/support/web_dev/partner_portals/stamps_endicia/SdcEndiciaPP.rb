module Stamps
  module WebDev
    module Portals
      module StampsEndicia
        class SdcEndiciaLanding < SdcPageObject
          page_url { |env| "https://#{env}.partner.stamps.com" }

          # create sections aka classes having elements
            class LoginPage
              # LoginPage elements
              text_field(:username, :text_field, required: true) { {xpath: "xpath "} }
              text_field(:password, :text_field, required: true) { {xpath: "xpath "} }
              button(:sign_in, required: true) { {xpath: "xpath "} }
              link(:forgot_pw, required: true) {{id: "xxx"}}
            end

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

          def sign_in_with(usr, pw)
            username.set usr
            username.set pw
            sign_in.click
            sign_in.send_keys :enter
            username.safe_wait_while_present
          end
        end

        class SdcEndiciaPort < SdcPageObject
        end
      end
    end
  end
end
