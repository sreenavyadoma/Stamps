module PartnerPortal


  class PPLoginPage < SdcPage
    #Welcome content
    page_object(:welcome_content) { {xpath: '//p[contains(text(),"Welcome to the")]'} }

    #Error Message
    page_object(:error_message) { {xpath: '//p[@class="text-center"]'} }

    #sdcEndica logo
    page_object(:sdc_endicia_logo) { {xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]'} }

    #Partner Portal content
    page_object(:partner_portal_content) {{xpath: '//h3[contains(text(), "Partner Portal")]'}}

    #Email textbox
    text_field(:email, tag: :text_field, required: true) { {name: 'email'} }
    page_object(:email_tooltip) { {xpath: '//*[@name="email"]/div/div'} }
    label(:email_placeholder) { {xpath: '//input[@placeholder="Email"]'} }

    #Password textbox
    text_field(:password, tag: :text_field, required: true) { {name: 'password'} }
    page_object(:password_tooltip) { {xpath: '//*[@name="password"]/div/div'} }
    label(:password_placeholder) { {xpath: '//input[@placeholder="Password"]'} }

    #Log In button
    button(:log_in) { {xpath: '//button[@label="Log In"]'} }
    button(:login_label) { {xpath: '//button[@label="Log In"]/span'} }

    #Forgot Password? link
    link(:forgot_pw) { {xpath: '//a[@href="/reset-password/request"]'} }

    def partner_user_id_query(user)
      user = PartnerPortal.db_connection.execute("select PartnerUserId, EmailAddress from [dbo].[sdct_PartnerPortal_User] where EmailAddress = '#{user}'")

      user.each do |item|
        return item['PartnerUserId']
      end

    end

    def log_info_date_created_query(user_id)
      log = PartnerPortal.db_connection.execute(
          'select RecordId, LogTypeId, PartnerUserId, LogInfo, DateCreated
          from [dbo].[sdct_PartnerPortal_Log]
          where DateCreated = (
          Select MAX(DateCreated) from [dbo].[sdct_PartnerPortal_Log] where PartnerUserId = #{user_id})'
      )
      log.each do |item|
        return item['LogInfo'], item['DateCreated']
      end

    end

    page_url { |env| "https://partner.#{env}.stamps.com/" }

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
    page_object(:dashboard_header) { {xpath: '//h1[contains(text(), "Dashboard")]'} }

    #Contract header
    page_object(:contract_header) { {class: 'dashboard__contract-header'} }

    #canvas Preferred Rates Qualified Postage
    page_objects(:preferred_rates_qualified_postage, index: 0 ) { {xpath: '//h4[contains(text(), "Preferred Rates Qualified Postage")]'} }

    #Revenue Share
    page_object(:revenue_share_title) { {xpath: '//h4[contains(text(), "Revenue Share")]'} }

    #submit
    button(:submit) { {xpath: '//button[@label="Submit"]'} }

  end

  class PPResetPasswordPage < SdcPage
    #sdcEndica content
    page_object(:header) { {xpath: '//h1[contains(text(), "Reset Password Request")]'} }

    #Email
    text_field(:email, tag: :text_field, required: true) { {xpath: '//input[@name="email"]'} }

  end

  class << self

    def login_page
      @login_page = PPLoginPage.new
    end

    def dashboard_page
      @dashboard_page = PPDashboardPage.new
    end

    def reset_password_page
      @reset_password_page = PPResetPasswordPage.new
    end

    def pp_common_page
      @stamps_endicia_common_page = PartnerPortal::Common.new
    end

    def db_connection
      @connection = PartnerPortalDB.new
    end

  end

end
