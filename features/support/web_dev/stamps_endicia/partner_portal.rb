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
    link(:forgot_pw) { { xpath: '//a[contains(text(),"Forgot Password?")]' } }


    def self.visit
      if [:iigwe, :jjones, :cjanczak, :cesar, :wlanni].include?(TestSession.env.url)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/partner/" }
      else
        page_url { |env| "https://partner.#{env}stamps.com/" }
      end

      super(case TestSession.env.url
              when :qacc
                'qacc.'
              when :stg
                'staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
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

    #Export Data
    page_object(:export_data_header) { { xpath: '//h3[contains(text(), "Export Data")]' } }
    page_object(:export_data_content) { { xpath: '//p[contains(text(), "Select a date range to export transaction level data as a CSV file.")]' } }
    text_field(:from_date_field, tag: :text_field, required: true) { { xpath: '//input[@name="startDate"]' } }
    page_object(:from_date_date_picker) { { class: ['ui-datepicker-trigger ui-calendar-button ng-tns-c11-1 ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ng-star-inserted'] } }
    page_object(:from_date_error_message) { { xpath: '//div[@class="export-data__start-date"]/div/div' } }
    text_field(:to_date_field, tag: :text_field, required: true) { { xpath: '//input[@name="endDate"]' } }
    page_object(:to_date_picker) { { class: ['ui-datepicker-trigger ui-calendar-button ng-tns-c11-2 ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ng-star-inserted'] } }
    page_object(:to_date_error_message) { { xpath: '//div[@class="export-data__end-date"]/div/div' } }
    button(:download) { { class: ['ui-button ui-widget ui-state-default ui-corner-all ui-button-text-empty'] } }
    def from_label
      SdcPage.browser.execute_script('return window.getComputedStyle( document.getElementsByClassName("form-group")[0] , ":before").getPropertyValue("content")')
    end
    def to_label
      SdcPage.browser.execute_script('return window.getComputedStyle( document.getElementsByClassName("form-group")[1] , ":before").getPropertyValue("content")')
    end
    page_object(:download_modal) { { class: ['ng-tns-c5-0 ui-dialog ui-widget ui-widget-content ui-corner-all ui-shadow ui-dialog-draggable ng-trigger ng-trigger-dialogState'] } }
    page_object(:download_modal_header) { { xpath: '//h3[contains(text(), "Downloading Report")]' } }
    page_objects(:download_modal_p) { { xpath: '//ng-component[@class="ng-star-inserted"]/p' } }
    page_object(:download_modal_ok) { { class: ['ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only'] } }

    def x_axis_month_abbreviations
      return SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageAmount.labels'),
          SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageCount.labels'),
          SdcPage.browser.execute_script('return window.ChartsData.Charts.ActiveCustomers.labels'),
          SdcPage.browser.execute_script('return window.ChartsData.Charts.RevenueShare.labels')
    end

    def pp_rand_date from = 0.0, to = Time.now
      Time.at(from + rand * (to.to_f - from.to_f))
    end

  end

  class PPResetPasswordPage < SdcPage
    #sdcEndica content
    page_object(:header) { { xpath: '//h1[contains(text(), "Reset Password")]' } }

    text_field(:email, tag: :text_field, required: true) { { name: 'email' } }

    page_object(:submit) { { class: ['ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only'] } }

    page_object(:icon) { { xpath:  '//img[@alt="Reset password request icon image"]'} }

    page_object(:email_error) { { xpath:  '//*[@name="email"]/div/div'} }

    def self.visit
      if [:iigwe, :jjones, :cjanczak, :cesar, :wlanni].include?(TestSession.env.url)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/reset-password/request" }
      else
        page_url { |env| "https://partner.#{env}stamps.com/reset-password/request" }
      end

      super(case TestSession.env.url
              when :qacc
                'qacc.'
              when :stg
                'staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
              else
                # ignore
            end)
    end

  end

  class PPResetPasswordConfirmationPage < SdcPage
    #header
    page_object(:header) { { xpath:  '//h1[contains(text(), "Reset Email Sent")]'} }

    def self.visit
      if [:iigwe, :jjones, :cjanczak, :cesar, :wlanni].include?(TestSession.env.url)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/reset-password/request/confirmation" }
      else
        page_url { |env| "https://partner.#{env}stamps.com/reset-password/request/confirmation" }
      end

      super(case TestSession.env.url
              when :qacc
                'qacc.'
              when :stg
                'staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
              else
                # ignore
            end)
    end
  end

  class PPSetPasswordPage < SdcPage

    def self.visit
      if [:iigwe, :jjones, :cjanczak, :cesar, :wlanni].include?(TestSession.env.url)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/set-password" }
      else
        page_url { |env| "https://partner.#{env}stamps.com/set-password" }
      end

      super(case TestSession.env.url
              when :qacc
                'qacc.'
              when :stg
                'staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
              else
                # ignore
            end)
    end
  end

  class PPError404Page < SdcPage

    def self.visit
      if [:iigwe, :jjones, :cjanczak, :cesar, :wlanni].include?(TestSession.env.url)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/error-404" }
      else
        page_url { |env| "https://partner.#{env}stamps.com/error-404" }
      end
      super(case TestSession.env.url
              when :qacc
                'qacc.'
              when :stg
                'staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
              else
                # ignore
            end)
    end

  end

  class PPError500Page < SdcPage

    def self.visit
      if [:iigwe, :jjones, :cjanczak, :cesar, :wlanni].include?(TestSession.env.url)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/error-500" }
      else
        page_url { |env| "https://partner.#{env}stamps.com/error-500" }
      end

      super(case TestSession.env.url
              when :qacc
                'qacc.'
              when :stg
                'staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
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
