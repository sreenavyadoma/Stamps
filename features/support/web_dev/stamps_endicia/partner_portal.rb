module PartnerPortal


  ##
  # Partner Portal Login page HTML elements included in this page object are;
  #  * Welcome content
  #  * Error Message
  #  * sdcEndica logo
  #  * Partner Portal content
  #  * Email textbox
  #  * Password textbox
  #  * Log In button
  #  * Forgot Password? link
  class PPLoginPage < SdcPage
    page_object(:welcome_content) { { xpath: '//p[contains(text(),"Welcome to the")]' } }
    page_object(:error_message) { { xpath: '//p[@class="text-center"]' } }
    page_object(:sdc_endicia_logo) { { xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]' } }
    page_object(:partner_portal_content) {{ xpath: '//h3[contains(text(), "Partner Portal")]' }}
    text_field(:email, tag: :text_field, required: true) { { name: 'email' } }
    page_object(:email_tooltip) { { xpath: '//*[@name="email"]/div/div' } }
    label(:email_placeholder) { { xpath: '//input[@placeholder="Email"]' } }
    text_field(:password, tag: :text_field, required: true) { { name: 'password' } }
    page_object(:password_tooltip) { { xpath: '//*[@name="password"]/div/div' } }
    label(:password_placeholder) { { xpath: '//input[@placeholder="Password"]' } }
    button(:log_in) { { xpath: '//button[@label="Log In"]' } }
    button(:login_label) { { xpath: '//button[@label="Log In"]/span' } }
    link(:forgot_pw) { { xpath: '//a[@href="/reset-password/request"]' } }

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

  ##
  # Partner Portal Dashboard page components;
  #   welcome header
  #   charts
  #   charts title
  #   chart Y-axis
  #   chart legends
  class PPDashboardPage < SdcPage
    page_object(:dashboard_header) { { xpath: '//h1[contains(text(), "Dashboard")]' } }

    page_object(:contract_header) { { class: ['dashboard__contract-header ng-star-inserted'] } }

    page_object(:contract_last_updated_on) { { class: ['dashboard__contract-updated ng-star-inserted'] } }

    page_objects(:preferred_rates_qualified_transactions_usd_chart, index: 0) { { xpath: '//canvas[@class="chartjs-render-monitor"]' } }
    page_objects(:preferred_rates_qualified_transactions_packages_chart, index: 1) { { xpath: '//canvas[@class="chartjs-render-monitor"]' } }
    page_objects(:active_customers_customers_chart, index: 2) { { xpath: '//canvas[@class="chartjs-render-monitor"]' } }
    page_objects(:revenue_share_chart, index: 3) { { xpath: '//canvas[@class="chartjs-render-monitor"]' } }

    page_objects(:preferred_rates_qualified_transactions_usd_chart_title, index: 0) { { xpath: '//h4[@class="ppchart__title"]' } }
    page_objects(:preferred_rates_qualified_transactions_packages_chart_title, index: 1) { { xpath: '//h4[@class="ppchart__title"]' } }
    page_objects(:active_customers_customers_chart_title, index: 2) { { xpath: '//h4[@class="ppchart__title"]' } }
    page_objects(:revenue_share_chart_title, index: 3) { { xpath: '//h4[@class="ppchart__title"]' } }

    page_objects(:preferred_rates_qualified_transactions_usd_y_axis, index: 0) { { xpath: '//div[@class="ppchart__chartlabel"]' } }
    page_objects(:preferred_rates_qualified_transactions_packages_chart_y_axis, index: 1) { { xpath: '//div[@class="ppchart__chartlabel"]' } }
    page_objects(:active_customers_customers_chart_y_axis, index: 2) { { xpath: '//div[@class="ppchart__chartlabel"]' } }
    page_objects(:revenue_share_chart_y_axis, index: 3) { { xpath: '//div[@class="ppchart__chartlabel"]' } }

    page_objects(:preferred_rates_qualified_transactions_usd_chart_legends, index: 0) { { xpath:  '//ul[@class="ppchart__legend"]' } }
    page_objects(:preferred_rates_qualified_transactions_packages_chart_legends, index: 1) { { xpath:  '//ul[@class="ppchart__legend"]' } }
    page_objects(:active_customers_customers_chart_legends, index: 2) { { xpath:  '//ul[@class="ppchart__legend"]' } }
    page_objects(:revenue_share_chart_legends, index: 3) { { xpath:  '//ul[@class="ppchart__legend"]' } }

    page_object(:export_data_header) { { xpath: '//h3[contains(text(), "Export Data")]' } }
    page_object(:export_data_content) { { xpath: '//p[contains(text(), "Select a date range to export transaction level data as a CSV file.")]' } }
    page_object(:from_label) { { class: ['form-group has-error::before'] } }
    text_field(:from_date_field, tag: :text_field, required: true) { { name: 'startDate' } }
    page_object(:from_date_date_picker) { { class: ['ui-button-text ui-clickable'] } }
    page_object(:to_label) { { class: ['form-group'] } }
    text_field(:to_date_field, tag: :text_field, required: true) { { name: 'endDate' } }
    page_object(:to_date_picker) { { class: ['ui-button-text ui-clickable'] } }
    button(:download) { { class: ['ui-button ui-widget ui-state-default ui-corner-all ui-button-text-empty'] } }


    def x_axis_month_abbreviations
      return SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageAmount.labels'),
          SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageCount.labels'),
          SdcPage.browser.execute_script('return window.ChartsData.Charts.ActiveCustomers.labels'),
          SdcPage.browser.execute_script('return window.ChartsData.Charts.RevenueShare.labels')
    end

  end

  class PPResetPasswordPage < SdcPage
    #sdcEndica content
    page_object(:header) { { xpath: '//h1[contains(text(), "Reset Password")]' } }

    text_field(:email, tag: :text_field, required: true) { { name: 'email' } }

    page_object(:submit) { { class: ['ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only'] } }

    page_object(:icon) { { xpath:  '//img[@alt="Reset password request icon image"]'} }

    page_object(:email_error) { { xpath:  '//*[@name="email"]/div/div'} }


    page_url { |env| "https://partner.#{env}.stamps.com/reset-password/request" }

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

  class PPResetPasswordConfirmationPage < SdcPage
    #header
    page_object(:header) { { xpath:  '//h1[contains(text(), "Reset Email Sent")]'} }

    page_url { |env| "https://partner.#{env}.stamps.com/reset-password/request/confirmation" }

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

  class PPSetPasswordPage < SdcPage
    page_url { |env| "https://partner.#{env}.stamps.com/set-password" }

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

  class PPError404Page < SdcPage
    page_url { |env| "https://partner.#{env}.stamps.com/error-404" }

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

  class PPError500Page < SdcPage
    page_url { |env| "https://partner.#{env}.stamps.com/error-500" }

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

  class << self

    def login_page
      PPLoginPage.new
    end

    def dashboard_page
      PPDashboardPage.new
    end

    def reset_password_page
      PPResetPasswordPage.new
    end

    def reset_password_confirm_page
      PPResetPasswordConfirmationPage.new
    end

    def set_password_page
      PPSetPasswordPage.new
    end

    def error_404_page
      PPError404Page.new
    end

    def error_500_page
      PPError500Page.new
    end

    def common_page
      PartnerPortal::Common.new
    end

    def db_connection
      PartnerPortalDB.new
    end

  end

end
