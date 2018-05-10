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
    page_object(:contract_header) { {class: 'dashboard__contract-header ng-star-inserted'} }

    #Last Updated On
    page_object(:contract_last_updated_on) { {class: 'dashboard__contract-updated ng-star-inserted'} }

    #charts
    page_objects(:preferred_rates_qualified_transactions_usd_chart, index: 0 ) { {xpath: '//canvas'} }
    page_objects(:preferred_rates_qualified_transactions_packages_chart, index: 1 ) { {xpath: '//canvas'} }
    page_objects(:active_customers_customers_chart, index: 2 ) { {xpath: '//canvas'} }
    page_objects(:revenue_share_chart, index: 3 ) { {xpath: '//canvas'} }

    #charts title
    page_objects(:preferred_rates_qualified_transactions_usd_chart_title, index: 0 ) { {xpath: '//h4'} }
    page_objects(:preferred_rates_qualified_transactions_packages_chart_title, index: 1 ) { {xpath: '//h4'} }
    page_objects(:active_customers_customers_chart_title, index: 2 ) { {xpath: '//h4'} }
    page_objects(:revenue_share_chart_title, index: 3 ) { {xpath: '//h4'} }

    #chart Y-axis
    page_objects(:preferred_rates_qualified_transactions_usd_y_axis, index: 0 ) { {xpath: '//div[contains(text(), "USD ($)")]'} }
    page_objects(:revenue_share_chart_y_axis, index: 1 ) { {xpath: '//div[contains(text(), "USD ($)")]'} }

    page_object(:preferred_rates_qualified_transactions_packages_chart_y_axis ) { {xpath: '//div[contains(text(), "# of packages")]'} }
    page_object(:active_customers_customers_chart ) { {xpath: '//div[contains(text(), "# of customers")]'} }

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

    def common_page
      @stamps_endicia_common_page = PartnerPortal::Common.new
    end

    def db_connection
      @connection = PartnerPortalDB.new
    end

  end

end
