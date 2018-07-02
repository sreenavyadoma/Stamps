module PartnerPortal
  class Common < SdcPage
    #Global header
    page_object(:global_header) { { xpath: '//a[@class="header ng-star-inserted"]' } }

    #stamps endicia logo
    page_objects(:sdc_endicia_logo_mobile, index: 0)  { { xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]' } }
    page_objects(:sdc_endicia_logo_browser, index: 1)  { { xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]' } }

    #Partner Portal logo
    page_object(:partner_portal_logo)  { { xpath:  '//h3[contains(text(), "Partner Portal")]' } }

    #Panel Content
    page_object(:panel_dashboard) { { xpath: '//a[contains(text(), "Dashboard")]' } }
    page_object(:panel_logout) { { xpath: '//a[contains(text(), "Logout")]' } }
    page_object(:panel_usps_logo) { { class: ['sidebar-footer'] } }
    page_object(:panel_partner_logo) { { class: ['sidebar-logo'] } }

    #xs viewport
    #hamburger button
    page_object(:hamburger_button_xs)  { { class:  ['hamburger hamburger-slider visible-xs'] } }
    #x button
    page_object(:x_button)  { { class:  ['hamburger hamburger-slider is-active visible-xs'] } }
    #Left Panel
    page_object(:panel_collapsed_xs)  { { class:  ['sidebar'] } }
    page_object(:panel_expanded_xs)  { { class:  ['sidebar sidebar_expanded-xs'] } }

    #Normal viewport left panel
    page_object(:panel_hamburger) { { class: ['hamburger hamburger-slider hamburger-arrow hamburger-sidebar'] } }
    page_object(:panel_arrow) { { class: ['hamburger hamburger-slider is-active hamburger-arrow hamburger-sidebar'] } }
    #Left Panel
    page_object(:panel_collapsed_lg)  { { class:  ['sidebar sidebar_collapsed'] } }
    page_object(:panel_expanded_lg)  { { class:  ['sidebar'] } }

    #footer
    page_object(:footer)  { { class:  ['footer'] } }
    page_object(:copyright_date) { {class: ['footer__copyright']} }
    page_object(:stamps_copyright_link) { {xpath: '//a[@href="https://www.stamps.com/site/copyright/"]'} }
    page_object(:endicia_copyright_link) { {xpath: '//a[@href="https://www.endicia.com/LegalNotice/"]'} }
    page_object(:stamps_privacy_policy_link) { {xpath:  '//a[@href="https://www.stamps.com/privacy-policy/"]'} }
    page_object(:endicia_privacy_policy_link) { {xpath:  '//a[@href="https://www.endicia.com/policy/privacy-policy/"]'} }

    #pop ups
    page_object(:error_ok)  { { xpath:  '//button[@label="OK"]' } }

    def user_table_query(user, column)
      user = PartnerPortal.db_connection.execute("select * from [dbo].[sdct_PartnerPortal_User] where EmailAddress = '#{user}'")
      user.each do |item|
        return item["#{column}"]
      end

    end

    def log_table_query(user_id, column )
      log = PartnerPortal.db_connection.execute(
          "select *
           from [dbo].[sdct_PartnerPortal_Log]
           where DateCreated = (
           Select MAX(DateCreated) from [dbo].[sdct_PartnerPortal_Log] where PartnerUserId = #{user_id})"
      )
      log.each do |item|
        return item["#{column}"]
      end
    end

    def contract_table_query(account_id, column)
      contract = PartnerPortal.db_connection.execute(
          "select *
           from [dbo].[sdct_PartnerPortal_Contract]
           where PartnerAccountId = #{account_id}")

      contract.each do |item|
        return item["#{column}"]
      end
    end

    def chart_data_query(email, chart_title, month, column)
      data = PartnerPortal.db_connection.execute(
        "select  pp_user.PartnerUserId, pp_account.PartnerAccountId, pp_contract.ContractId,
        pp_user.EmailAddress,pp_account.AccountName, pp_contract.DisplayName as 'ContractName',
        pp_contract.DateLastUpdated as 'ContractLastUpdated', pp_chartdata.Month, pp_chartdata.Amount,
        pp_chartdata.Count, pp_chartdatatype.ChartDataType as 'ChartTitle'
        from [dbo].[sdct_PartnerPortal_User] as pp_user
        inner join [dbo].[sdct_PartnerPortal_Account] as pp_account on pp_user.PartnerAccountId = pp_account.PartnerAccountId
        inner join [dbo].[sdct_PartnerPortal_Contract] as pp_contract on pp_user.PartnerAccountId = pp_contract.PartnerAccountId
        inner join [dbo].[sdct_PartnerPortal_ChartData] as pp_chartdata on pp_contract.ContractId = pp_chartdata.ContractId
        inner join [sdct_PartnerPortal_ChartDataType]as pp_chartdatatype on pp_chartdata.ChartDataTypeId = pp_chartdatatype.ChartDataTypeId
        where pp_user.EmailAddress = '#{email}' and pp_chartdatatype.ChartDataType = '#{chart_title}' and (DatePart(yy, pp_chartdata.Month)) = #{month}")
      data_arr = []
      data.each do |item|
        data_arr << item["#{column}"].to_f
      end
      return data_arr
    end

    def chart_data_window(chart, year)
      case year
        when 'Previous'
          case chart
            when "Preferred Rates Qualified Postage Amount"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageAmount.datasets[0].data')
            when "Preferred Rates Qualified Postage Count"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageCount.datasets[0].data')
            when "Active Customers"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.ActiveCustomers.datasets[0].data')
            when "Revenue Share"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.RevenueShare.datasets[0].data')
          end
        when 'Current'
          case chart
            when "Preferred Rates Qualified Postage Amount"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageAmount.datasets[1].data')
            when "Preferred Rates Qualified Postage Count"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.PrefRatesQualifiedPostageCount.datasets[1].data')
            when "Active Customers"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.ActiveCustomers.datasets[1].data')
            when "Revenue Share"
              return SdcPage.browser.execute_script('return window.ChartsData.Charts.RevenueShare.datasets[1].data')
          end
      end
    end

    def user_session_timeout
      SdcPage.browser.execute_script(
          'var d = new Date();
          d.setHours(d.getHours() - 3);
          window.localStorage.setItem("_ate", window.btoa(d.toString()));')
    end

    def partner_logo_query(user)
      logo = PartnerPortal.db_connection.execute(
        "select pp_user.EmailAddress, pp_account.AccountName, pp_asset.AssetPath
        from [dbo].[sdct_PartnerPortal_Asset] as pp_asset
        inner join [dbo].[sdct_PartnerPortal_Account] as pp_account on  pp_account.AssetId = pp_asset.AssetId
        inner join [dbo].[sdct_PartnerPortal_User] as pp_user on pp_user.PartnerAccountId = pp_account.PartnerAccountId
        where pp_user.EmailAddress = '#{user}'")

      logo.each do |item|
        return item['AssetPath']
      end
    end

    def tansaction_data(user,start_date,end_date, column )
      data = PartnerPortal.db_connection.execute( "select pp_trans_data.AccountNumber, pp_trans_data.TransactionDateTime,  pp_trans_data.TransactionType,
        pp_trans_data.RetailRate, pp_trans_data.PayoutAmount, pp_trans_data.TrackingNumber, pp_trans_data.Weight,
        pp_trans_data.Zone, pp_trans_data.PackageLength, pp_trans_data.PackageWidth,  pp_trans_data.PackageHeight,
        pp_trans_data.PackageType, pp_trans_data.MailClass, pp_trans_data.InternationalCountryGroup, pp_trans_data.OriginationAddressZip,
        pp_trans_data.DestinationAddressZip, pp_trans_data.DestinationCountry, pp_trans_data.ExtraServiceFee, pp_trans_data.TransactionID,
        pp_trans_data.ContainerType, pp_trans_data.IsCubic, pp_trans_data.CubicValue, pp_trans_data.IsApfAfo, pp_trans_data.CreditCardFee
        from [dbo].[sdct_PartnerPortal_TransactionData]  as pp_trans_data
        inner join [dbo].[sdct_PartnerPortal_Contract] as pp_contract on pp_trans_data.ContractId = pp_contract.ContractId
        inner join [dbo].[sdct_PartnerPortal_User] as pp_user on pp_contract.PartnerAccountId = pp_user.PartnerAccountId
        where pp_user.EmailAddress = '#{user}' and pp_trans_data.TransactionDateTime >= '2017-07-10' and  pp_trans_data.TransactionDateTime < DATEADD(DAY, 1 , CONVERT(DATE, '2017-07-10'))
        ORDER BY  pp_trans_data.TransactionDateTime ASC")
      data_arr = []
      data.each(:as => :array, :cache_rows => false) do |item|
        #data_arr << item["#{column}"].to_f
        data_arr << item
      end
      return data_arr
    end

  end
end
