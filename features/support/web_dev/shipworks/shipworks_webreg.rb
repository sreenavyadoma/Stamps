module SWWR

  class CreateYourAccount < SdcPage

    def survey_selection(str, name = :survey_element)
      page_object(name) { {xpath: "//span[contains(text(), \" #{str} \")]" } }
    end

    def referrer_name_selection(str, name = :referrer_name_element)
      page_object(name) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

  end

  class MembershipPage < SdcPage



    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { {xpath: "//span[text()='#{str}']"} }
    end

    def billing_dropdown_selection(str, name = :dropdown_element)
      page_object(name) { {xpath: "//li[@id='creditcard']/div/div[contains(@class, 'col-sm-6')]/div/div[contains(@class, 'dropup open')]/div/ul/li/a/span[text()='#{str}']"} }
    end

  end

  class SetupCarrierAccounts < SdcPage


    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { {xpath: "//span[text()='#{str}']"} }
    end

    def billing_dropdown_selection(str, name = :dropdown_element)
      page_object(name) { {xpath: "//li[@id='creditcard']/div/div[contains(@class, 'col-sm-6')]/div/div[contains(@class, 'dropup open')]/div/ul/li/a/span[text()='#{str}']"} }
    end

  end

  class << self

    def create_your_account
      CreateYourAccount.new
    end

    def membership_page
      MembershipPage.new
    end

    def setup_carrier_accounts
      SetupCarrierAccounts.new
    end

    def common_page
      Common.new
    end

    def sww_db_connection
      SdcWebsiteDB.new
    end

    def bridge_db_connection
      VBridgeDB.new
    end

    def stamp_mart_db_connection
      StampMartDB.new
    end


  end

end