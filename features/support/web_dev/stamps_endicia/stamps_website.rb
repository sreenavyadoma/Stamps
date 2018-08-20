module WhiteLabel
  class ProfilePage < SdcPage

  end

  class MembershipPage < SdcPage


    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { {xpath: "//span[text()='#{str}']"} }
    end

    def billing_dropdown_selection(str, name = :dropdown_element)
      page_object(name) { {xpath: "//li[@id='creditcard']/div/div[contains(@class, 'col-sm-6')]/div/div[contains(@class, 'dropup open')]/div/ul/li/a/span[text()='#{str}']"} }
    end

  end

  class ChooseSupplies < SdcPage

  end

  class << self

    def profile_page
      ProfilePage.new
    end

    def membership_page
      MembershipPage.new
    end

    def choose_supplies
      ChooseSupplies.new
    end

    def common_page
      Common.new
    end

    def sdcw_website
      SDCWWebsite.new
    end

    def ew_website
      EWWebsite.new
    end

    def sdc_db_connection
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