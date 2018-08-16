module SWWR

  class CreateYourAccount < SdcPage
    page_object(:create_your_account_header) { {xpath: '//div[@class="webreg-form-case-1"]/h1'} }
    page_Object(:create_your_account_header_p) { {xpath: '//div[@class="webreg-form-case-1"]/p'} }
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    page_object(:email_help_block,  index: 0) { {xpath: '//li[@class="module webreg_email"]/div/div/div/span/span[2]'} }
    text_field(:password, tag: :text_field, required: true) { { id: 'passwordEle' }}
    page_object(:password_help_block,  index: 0) { {xpath: '//li[@class="module webreg_password"]/div/div/div/span/span[2]'} }
    text_field(:first_name, tag: :text_field, required: true) { { id: 'firstName' } }
    page_object(:first_name_help_block) { {xpath: '//div[@class="col-xs-12 col-sm-6 gut-sm-form-r-half"]/div/div/span'} }
    text_field(:last_name, tag: :text_field, required: true) { { id: 'lastName' } }
    page_object(:last_name_help_block) { {xpath: '//li[@class="module webreg_personalinfo"]/div/div[@class="col-xs-12 col-md-6 gut-md-l-half"]/div/span/span[2]'} }
    text_field(:company, tag: :text_field) { { id: 'companyName' } }
    text_field(:phone, tag: :text_field, required: true) { { id: 'phone' } }
    page_object(:phone_help_block) { {xpath: '//li[@class="module webreg_personalinfo"]/div/div[@class="col-xs-12"]/div/span/span[2]'} }
    page_object(:promo_code_label) {{xpath: 'radio-group-label hidden-xs pull-left'}}
    page_object(:promo_code_yes, index: 0) {{xpath: '//label[@class="md-radio"]/input'}}
    page_object(:promo_code_checked) {{class: ['form-group show'] }}
    page_object(:promo_code_no, index: 1) {{xpath: '//label[@class="md-radio"]/input'}}
    page_object(:promo_code_checked) {{class: ['form-group hide'] }}



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