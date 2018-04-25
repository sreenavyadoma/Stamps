module Stamps

  module PartnerPortal

    class PPLoginPage < SdcPage
      #Welcome content
      page_objs(:welcome_content, index: 0)  { {xpath: "//p"} }

      #Error Message
      page_objs(:error_message, index: 1)  { {xpath: "//p"} }

      #sdcEndica logo
      page_obj(:sdc_endicia_logo) {{xpath: "//img[@alt='Stamps & Endicia Company logo inverted']"}}

      #USPS Portal content
      page_obj(:usps_portal_content) {{xpath: "//h3['USPS Portal']"}}

      #Email textbox
      text_field(:email, tag: :text_field, required: true) { {name: "email"} }
      page_obj(:email_tooltip) { {xpath: "//*[@name='email']/div/div/span"} }
      label(:email_placeholder) { {xpath: "//input[@placeholder='Email']"} }

      #Password textbox
      text_field(:password, tag: :text_field, required: true) { {name: "password"} }
      page_obj(:password_tooltip) { {xpath: "//*[@name='password']/div/div/span"} }
      label(:password_placeholder) { {xpath: "//input[@placeholder='Password']"} }

      #Log In button
      button(:log_in) { {xpath: "//button[@label='Log In']"} }
      button(:login_label) {{xpath: "//button[@label='Log In']/span"}}

      #Forgot Password? link
      link(:forgot_pw) {{xpath: "//a[@href='/reset-password/request']"}}

      #page_url { |env| "http://uspsportal112.#{env}.stamps.com/login" }
      page_url { |env| "https://iigwe-win10.corp.stamps.com/partner/" }

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

    end

    class PPDashboardPage < SdcPage
      #welcome header
      page_obj(:header) {{xpath: "//h1['Welcome to USPS Portal']"}}

      #hamburger button
      button(:hamburger, required: true) {{class: "navbar-toggle collapsed"}}

      #x button
      button(:x, required: true) {{class: "xxx"}}
    end

    class PPResetPasswordPage < SdcPage
      #sdcEndica content
      page_obj(:header) {{xpath: "//h1['Password Reset']"}}

      #Email
      text_field(:email, tag: :text_field, required: true) {{xpath: "//input[@name='email']"}}

      #submit
      button(:submit) {{xpath: "//button[@label='Submit']/span" }}
    end

    class << self
      def login_page
        @login_page ||= PPLoginPage.new
      end

      def dashboard_page
        @dashboard_page ||=PPDashboardPage.new
      end

      def reset_password_page
        @reset_password_page ||= PPResetPasswordPage.new
      end

      def stamps_endicia_common_page
        @stamps_endicia_common_page ||= StampsEndicia::Common.new
      end
    end

  end

end



