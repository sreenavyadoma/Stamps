module SdcMail

  class SdcUpgradePlan < SdcPage
    page_object(:window_title) { {xpath: ''} } # @window_title = StampsField.new(driver.div(text: "Upgrade Plan"))
    page_object(:upgrade_now) { {xpath: ''} }
    page_object(:x_btn) { {xpath: ''} }
    page_object(:not_yet) { {xpath: ''} }
    page_object(:paragraph) { {xpath: ''} }
  end

  class SdcManagePrintOptionsModal < SdcPage

    page_object(:search) { {xpath: ''} }
    page_object(:save) { {xpath: ''} }
    page_object(:close) { {xpath: ''} }
    page_object(:search_field) { {xpath: ''} }
    page_object(:search_results) { {xpath: ''} }

    page_object(:chooser) { {xpath: ''} }
    page_object(:verify) { {xpath: ''} }
    chooser(:result_checkbox, :chooser, :verify,'class', 'selected' )

    page_object(:xxxx) { {xpath: ''} }
  end

end

module PrintOnTextbox
  def print_on_textbox
    if cache[:print_on_textbox].nil? || !cache[:print_on_textbox].present?
      cache[:print_on_textbox] = StampsTextbox.new(driver.text_field(css: "[name=PrintMedia]"))
    end
    cache[:print_on_textbox]
  end
end


# include PrintFormBlurOut
# #include PrintMediaHelper
# include PrintOnTextbox
class SdcPrintOn < SdcPage

  class << self; attr_accessor :media end

  page_object(:xxxxxxx) { {xpath: ''} }
  page_object(:dropdown) { {xpath: '//*[starts-with(@id, "printmediadroplist-")][contains(@id, "-trigger-picker")]'} }
  page_object(:text_field) { {xpath: '//*[@name="PrintMedia"]'} }
  page_object(:manage_print_options_selection) { {xpath: ''} }

  def selection(str)
    media = data_for(:mail_print_media, {})[str]
    xpath = "//*[starts-with(@class, '#{media.split(',').first}')][@data-recordindex='#{media.split(',').first}']"
    self.class.page_object(:selection_element) { {xpath: xpath} }
  end

  def select(str)
    dropdown.click
    dropdown.click unless selection_element.present?
    selection_element.click
    text_field.text_value
  end

  def tooltip(str)
    10.times do
      selection = StampsField.new(driver.div(text: str))
      dropdown.click unless selection.present?
      return selection.attribute_value "data-qtip" if selection.present?
    end
  end
end

class SdcMailToCountry < SdcPage
  include PrintFormBlurOut

  def dom_dd
    (cache[:dom_dd].nil? || !cache[:dom_dd].present?) ? cache[:dom_dd] = StampsTextbox.new(
        driver.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker")) : cache[:dom_dd]
  end

  def int_dd
    (cache[:int_dd].nil? || !cache[:int_dd].present?) ? cache[:int_dd] = StampsTextbox.new(
        driver.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div[id^=combo]>div>div>div[id$=trigger-picker]")) : cache[:int_dd]
  end

  def dom_textbox
    (cache[:dom_textbox].nil? || !cache[:dom_textbox].present?) ? cache[:dom_textbox] = StampsTextbox.new(
        driver.text_field(id: "sdc-mainpanel-matltocountrydroplist-inputEl")) : cache[:dom_textbox]
  end

  def int_textbox
    (cache[:int_textbox].nil? || !cache[:int_textbox].present?) ? cache[:int_textbox] = StampsTextbox.new(
        driver.inputs(name: "ShipCountryCode")[1]) : cache[:int_textbox]
  end

  def domestic?
    dom_dd.present? && dom_textbox.present?
  end

  def dropdown
    (domestic?) ? dom_dd : int_dd
  end

  def textbox
    (domestic?) ? dom_textbox : int_textbox
  end

  def select_country(str)
    begin
      dropdown.click
      selection = StampsField.new(driver.lis(text: str)[(domestic?) ? 0 : 1])
      30.times do
        begin
          dropdown.click unless selection.present?
          sleep(0.5)
          selection.scroll_into_view
          selection.click
          blur_out
          break if textbox.text == str
        rescue
          # ignore
        end
      end
    end unless textbox.text == str
    expect(textbox.text).to eql(str)
    blur_out
  end
end

class SdcMailToInt < SdcPage
  include PrintFormBlurOut



  def name
    (cache[:name].nil? || !cache[:name].present?) ? cache[:name] = StampsTextbox.new(
        driver.text_field(name: "ShipName")) : cache[:name]
  end

  def company
    (cache[:company].nil? || !cache[:company].present?) ? cache[:company] = StampsTextbox.new(
        driver.text_field(name: "ShipCompany")) : cache[:company]
  end

  def address_1
    (cache[:address_1].nil? || !cache[:address_1].present?) ? cache[:address_1] = StampsTextbox.new(
        driver.text_field(name: "ShipStreet1")) : cache[:address_1]
  end

  def address_2
    (cache[:address_2].nil? || !cache[:address_2].present?) ? cache[:address_2] = StampsTextbox.new(
        driver.text_field(name: "ShipStreet2")) : cache[:address_2]
  end

  def city
    (cache[:city].nil? || !cache[:city].present?) ? cache[:city] = StampsTextbox.new(
        driver.text_field(name: "ShipCity")) : cache[:city]
  end

  def province
    (cache[:province].nil? || !cache[:province].present?) ? cache[:province] = StampsTextbox.new(
        driver.text_field(name: "ShipState")) : cache[:province]
  end

  def postal_code
    (cache[:postal_code].nil? || !cache[:postal_code].present?) ? cache[:postal_code] = StampsTextbox.new(
        driver.text_field(name: "ShipPostalCode")) : cache[:postal_code]
  end

  def phone
    (cache[:phone].nil? || !cache[:phone].present?) ? cache[:phone] = StampsTextbox.new(
        driver.text_field(css: "[id=shiptoview-international-targetEl] [name=ShipPhone]")) : cache[:phone]
  end
end

module MailDomTextArea
  def textarea
    (cache[:textarea].nil? || !cache[:textarea].present?) ? cache[:textarea] = StampsTextbox.new(
        driver.textarea(id: "sdc-mainpanel-shiptotextarea-inputEl")) : cache[:textarea]
  end
end

class SdcMailToDom < SdcPage
  include MailDomTextArea
  include PrintFormBlurOut


  attr_reader :country

  def set(address)
    textarea.click
    textarea.set(address)
    textarea.click
    textarea.double_click
    textarea.click
    textarea.double_click
    blur_out
    blur_out
  end
end

class SdcPrintFormEmail < SdcPage
  include PrintFormBlurOut



  def email_textbox
    (cache[:email_textbox].nil? || !cache[:email_textbox].present?) ? cache[:email_textbox] = StampsTextbox.new(
        driver.text_field(id: "sdc-mainpanel-emailtextfield-webpostage-inputEl")) : cache[:email_textbox]
  end

  def email_checkbox
    (cache[:email_checkbox].nil? || !cache[:email_checkbox].present?) ? cache[:email_checkbox] = StampsField.new(
        driver.input(css: "input[id^='checkbox-'][id$='-inputEl'")) : cache[:email_checkbox]
  end
end

class SdcPrintFormWeight < SdcPage
  include PrintFormBlurOut



  def weigh
    (cache[:weigh].nil? || !cache[:weigh].present?) ? cache[:weigh] = StampsField.new(
        driver.span(text: "Weigh")) : cache[:weigh]
  end

  def auto_weigh
    (cache[:auto_weigh].nil? || !cache[:auto_weigh].present?) ? cache[:auto_weigh] = StampsCheckbox.new(
        driver.span(id: "div[class*=autoweight-checkbox]>div>div>span"),
        driver.div(id: "div[class*=autoweight-checkbox]>div>div:nth-child(2)"),
        'class',
        'checked') : cache[:auto_weigh]
  end

  def pounds
    (cache[:pounds].nil? || !cache[:pounds].present?) ? cache[:pounds] = StampsNumberField.new(
        driver.text_field(name: "WeightLbs"),
        driver.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-up]"),
        driver.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-down]")) : cache[:pounds]
  end

  def ounces
    (cache[:ounces].nil? || !cache[:ounces].present?) ? cache[:ounces] = StampsNumberField.new(
        driver.text_field(name: "WeightOz"),
        driver.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-up]"),
        driver.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-down]")) : cache[:ounces]
  end

  def present?
    pounds.present? && ounces.present?
  end
end

class SdcPrintFormDimensions < SdcPage


  def length
    (cache[:length].nil? || !cache[:length].present?) ? cache[:length] = StampsNumberField.new(
        driver.text_field(css: "[class*=sdc-mainpanel-lengthnumberfield]"),
        driver.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(1) [id$=-trigger-spinner] [class*=up]"),
        driver.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(1) [id$=-trigger-spinner] [class*=down]")) : cache[:length]
  end

  def width
    (cache[:width].nil? || !cache[:width].present?) ? cache[:width] = StampsNumberField.new(
        driver.text_field(css: "[class*=sdc-mainpanel-widthnumberfield]"),
        driver.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(3) [id$=-trigger-spinner] [class*=up]"),
        driver.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(3) [id$=-trigger-spinner] [class*=down]")) : cache[:width]
  end

  def height
    (cache[:height].nil? || !cache[:height].present?) ? cache[:height] = StampsNumberField.new(
        driver.text_field(css: "[class*=sdc-mainpanel-heightnumberfield]"),
        driver.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(5) [id$=-trigger-spinner] [class*=up]"),
        driver.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(5) [id$=-trigger-spinner] [class*=down]")) : cache[:height]
  end
end

class SdcPrintFormMailFrom < SdcPage
  include PrintFormBlurOut

  def textbox
    (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
        driver.text_field(id: "sdc-mainpanel-shipfromdroplist-inputEl")) : cache[:textbox]
  end

  def dropdown
    (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
        driver.div(id: "sdc-mainpanel-shipfromdroplist-trigger-picker")) : cache[:dropdown]
  end

  def manage_shipping_address
    (cache[:manage_shipping_address].nil? || !cache[:manage_shipping_address].present?) ? cache[:manage_shipping_address] = MailManageShippingAddresses.new(param) : cache[:manage_shipping_address]
  end

  def present?
    textbox.present?
  end

  def selection_field(str)
    if str.downcase.to_sym == :default
      (cache[:default].nil? || !cache[:default].present?) ? cache[:default] = StampsField.new(driver.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0]) : cache[:default]
    else
      (cache[str.to_sym].nil? || !cache[str.to_sym].present?) ? cache[str.to_sym] = StampsField.new(driver.li(visible_text: /#{str}/)) : cache[str.to_sym]
    end
  end

  def select(str)
    dropdown.click
    if str.downcase.include?('manage shipping')
      10.times do
        begin
          selection_field(str).click
          return manage_shipping_address if manage_shipping_address.present?
          dropdown.click unless selection_field(str).present?
        rescue
          # ignore
        end
      end
    else
      10.times do
        selection_field(str).click
        return textbox.text if textbox.text.length > 0
        dropdown.click unless selection_field(str).present?
      end
    end
    nil
  end
end

class SdcMailServiceSelection < SdcPage
  #include ParameterHelper

  def cost_field(str)
    (cache[:cost_field].nil? || !cache[:cost_field].present?) ? cache[:cost_field] = StampsField.new(
        driver.td(css: "li[id='#{data_for(:mail_services, {})[str]}']>table>tbody>tr>td[class*=amount]")) : cache[:cost_field] #sdc-servicedroplist-fcletter
  end

  def service_field(str)
    (cache[:service_field].nil? || !cache[:service_field].present?) ? cache[:service_field] = StampsField.new(
        driver.td(css: "li[id='#{data_for(:mail_services, {})[str]}']>table>tbody>tr>td[class*=text]")) : cache[:service_field]
  end

  def cost_str(str)
    dollar_amount_str(cost_field(str).text)
  end

  def selection_is_numeric?(str)
    TestHelper.is_numeric?(cost_str(str))
  end

  def service_cost(str)
    (selection_is_numeric?) ? cost_field(str).text.to_f : 0
  end

  def has_rates?(str)
    !cost_field(str).text.include?('N/A')
  end
end

class SdcPrintFormService < SdcPage
  include PrintFormBlurOut
  attr_accessor :print_media
  def initialize(param, print_media)
    super(param)
    @print_media = print_media
  end

  def service_selection
    (cache[:service_selection].nil? || !cache[:service_selection].present?) ? cache[:service_selection] = MailServiceSelection.new(
        param) : cache[:service_selection]
  end

  def textbox
    (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
        driver.text_field(id: "sdc-mainpanel-servicedroplist-inputEl")) : cache[:textbox]
  end

  def dropdown
    (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
        driver.div(id: "sdc-mainpanel-servicedroplist-trigger-picker")) : cache[:dropdown]
  end

  def has_rates?
    case(print_media)
    when :certified_mail
      default_service = 'FCMI Package/Thick Envelope'
    when :label
      default_service = 'PM Flat Rate Envelope'
      default_int_service = 'PMI Flat Rate Envelope'
    when :envelope
      default_service = 'FCM Letter'
    when :roll
      default_service = 'PME Flat Rate Envelope'
      default_int_service = 'PMI Flat Rate Envelope'
    when :stamps
      default_service = 'FCM Letter'
    else
      #do nothing
    end
    15.times do
      if service_selection.service_field(default_service).present?
        return service_selection.has_rates?(default_service)
      elsif service_selection.service_field(default_int_service).present?
        return service_selection.has_rates?(default_int_service)
      else
        dropdown.click
      end
    end
    false
  end

  def service_cost(str)
    dropdown.wait_until_present(4)
    blur_out
    20.times do
      if service_selection.cost_field(str).present?
        service_selection.cost_field(str).scroll_into_view
        return service_selection.cost_field(str).text
      end
      dropdown.click
    end
    nil
  end

  def select_service(str)
    15.times do
      break if textbox.text.include?(str)
      dropdown.click unless service_selection.service_field(str).present?
      dropdown.wait_until_present(4)
      dropdown.click unless service_selection.service_field(str).present?
      service_selection.service_field(str).scroll_into_view
      service_selection.service_field(str).click
      blur_out
    end
    textbox.text
  end

  def cost(selection)
    cost_label = StampsField.new(driver.td(css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"))
    20.times do
      begin
        dropdown.click unless cost_label.present?
        if cost_label.present?
          service_cost = cost_label.text.dollar_amount_str.to_f.round(2)
          return service_cost
        end
      rescue
        # ignore
      end
    end
    blur_out
  end

  #todo-Rob rework tooltips
  def tooltip(selection)
    button = dropdown
    selection_label = StampsField.new driver.tr css: "tr[data-qtip*='#{selection}']"
    10.times {
      begin
        button.click unless selection_label.present?
        if selection_label.present?
          tooltip = selection_label.attribute_value "data-qtip"
          log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
          return tooltip
        end
      rescue
        # ignore
      end
    }
    blur_out
  end

  def price
    (cache[:price].nil? || !cache[:price].present?) ? cache[:price] = StampsField.new(
        driver.label(id: "sdc-mainpanel-servicepricelabel")) : cache[:price]
  end

end

class SdcPrintFormInsureFor < SdcPage
  include PrintFormBlurOut



  def price
    (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsField.new(
        driver.label(id: "sdc-mainpanel-insurancepricelabel")) : cache[:textbox]
  end

  def insure_for_amt
    (cache[:pounds].nil? || !cache[:pounds].present?) ? cache[:pounds] = StampsNumberField.new(
        driver.input(id: "sdc-mainpanel-insureamtnumberfield-inputEl"),
        driver.div(css: "div[id='sdc-mainpanel-insureamtnumberfield-trigger-spinner']>div[class*=spinner-up]"),
        driver.div(css: "div[id='sdc-mainpanel-insureamtnumberfield-trigger-spinner']>div[class*=spinner-down]")) : cache[:pounds]
  end

  def present?
    insure_for_amt.present? && insure_for_amt.present?
  end
end

class SdcPrintFormTracking < SdcPage
  include PrintFormBlurOut

  def textbox
    (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
        driver.text_field(id: "sdc-mainpanel-trackingdroplist-inputEl")) : cache[:textbox]
  end

  def dropdown
    (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
        driver.div(id: "sdc-mainpanel-trackingdroplist-trigger-picker")) : cache[:dropdown]
  end

  def selection_field(str)
    (cache[str.to_sym].nil? || !cache[str.to_sym].present?) ? cache[str.to_sym] = StampsField.new(
        driver.div(text: selection)) : cache[str.to_sym]
  end

  def select(str)
    10.times do
      begin
        dropdown.click unless selection_field(str).present?
        selection_field(str).scroll_into_view
        selection_field(str).click
        return selection_field(str) if textbox.text.include?(str)
      rescue
        # ignore
      end
    end
    nil
  end

  def price
    (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
        driver.label(id: "sdc-mainpanel-trackingpricelabel")) : cache[:dropdown]
  end
end

class SdcPrintFormCostCode < SdcPage


  def textbox
    (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(driver.text_field(name: "costCodeId")) : cache[:textbox]
  end

  def dropdown
    (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(driver.div(css: "[id^=costcodesdroplist-][id$=-trigger-picker]")) : cache[:dropdown]
  end

  def select(selection)
    field = StampsField.new(driver.div(text: selection))
    10.times do
      begin
        dropdown.click unless field.present?
        field.scroll_into_view
        field.click
        return textbox.text if textbox.text.include?(selection)
      rescue
        # ignore
      end
    end
    textbox.text
  end
end

#todo-Rob reference http://jira.psisystems.local/browse/ORDERSAUTO-3460
class SdcPrintFormMailToLink < SdcPage


  def link
    (cache[:link].nil? || !cache[:link].present?) ? cache[:link] = StampsField.new(driver.span(css: "[class*=sdc-mainpanel-shiptolinkbtn] [id$=btnInnerEl]")) : cache[:link]
  end

  def contacts_modal
    (cache[:contacts_modal].nil? || !cache[:contacts_modal].present?) ? cache[:contacts_modal] = MailSearchContactsModal.new(param) : cache[:contacts_modal]
  end

  def click
    30.times do
      return contacts_modal if contacts_modal.present?
      link.click
    end
    nil
  end
end

class SdcPrintFormMailTo < SdcPage
  include PrintFormBlurOut

  def mail_to_country
    (cache[:mail_to_country].nil? || !cache[:mail_to_country].present?) ? cache[:mail_to_country] = MailToCountry.new(param) : cache[:mail_to_country]
  end

  def mail_to_link
    (cache[:mail_to_link].nil? || !cache[:mail_to_link].present?) ? cache[:mail_to_link] = PrintFormMailToLink.new(param) : cache[:mail_to_link]
  end

  def dom_mail_address
    (cache[:dom_mail_address].nil? || !cache[:dom_mail_address].present?) ? cache[:dom_mail_address] = MailToDom.new(param) : cache[:dom_mail_address]
  end

  def int_mail_address
    (cache[:int_mail_address].nil? || !cache[:int_mail_address].present?) ? cache[:int_mail_address] = MailToInt.new(param) : cache[:int_mail_address]
  end

  def mail_address
    return dom_mail_address if mail_to_country.domestic?
    int_mail_address
  end

  def country(str)
    mail_to_country.select(str)
    mail_to_country.textbox.text
  end
end

class SdcPrintFormCustoms < SdcPage
  attr_reader :button, :customs_form

  def initialize(param)
    super
    @button = StampsField.new(driver.span(id: "sdc-mainpanel-editcustombtn-btnInnerEl"))
    @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
  end

  def edit_customs_form
    30.times do
      return customs_form if customs_form.present?
      button.scroll_into_view
      button.click
      sleep(0.2)
    end
    expect(customs_form).to be_present
  end

  def restrictions

  end

  def i_agree_to_insurance_terms
  end
end




module SdcPrintFormLocators

  def mail_from
    cache[:mail_from].nil? || !cache[:mail_from].present? ? cache[:mail_from] = PrintFormMailFrom.new(param) : cache[:mail_from]
  end

  def mail_to
    cache[:mail_to].nil? || !cache[:mail_to].present? ? cache[:mail_to] = PrintFormMailTo.new(param) : cache[:mail_to]
  end

  def email_tracking
    cache[:email_tracking].nil? || !cache[:email_tracking].present? ? cache[:email_tracking] = PrintFormEmail.new(param) : cache[:email_tracking]
  end

  def weight
    cache[:weight].nil? || !cache[:weight].present? ? cache[:weight] = PrintFormWeight.new(param) : cache[:weight]
  end

  def dimensions
    cache[:dimensions].nil? || !cache[:dimensions].present? ? cache[:dimensions] = PrintFormDimensions.new(param) : cache[:dimensions]
  end

  def service
    cache[:service].nil? || !cache[:service].present? ? cache[:service] = PrintFormService.new(param, print_media) : cache[:service]
  end

  def insure_for
    cache[:insure_for].nil? || !cache[:insure_for].present? ? cache[:insure_for] = PrintFormInsureFor.new(param) : cache[:insure_for]
  end

  def tracking
    cache[:tracking].nil? || !cache[:tracking].present? ? cache[:tracking] = PrintFormTracking.new(param) : cache[:tracking]
  end

  def mail_customs
    cache[:mail_customs].nil? || !cache[:mail_customs].present? ? cache[:mail_customs] = PrintFormCustoms.new(param) : cache[:mail_customs]
  end
end















module MailFrom
end

module MailTo
end

module EmailTracking
end

module Weight
end

module Dimensions
end

module Service
end

module InsureFor
end

module Tracking
end

module MailCustoms
end

##
# Mail Advanced Options
module SdcAdvancedOptions
  # @return [Mail Advanced Options]

  def advanced_options
    case print_media
    when :stamps
      if cache[:stamps_options].nil? || !cache[:stamps_options].present?
        cache[:stamps_options] = Object.const_get('SdcPage').new(param).extend(Stamps::Mail::AdvancedOptions::Stamps)
      end
      return cache[:stamps_options]
    when :label
      if cache[:label_options].nil? || !cache[:label_options].present?
        cache[:label_options] = Object.const_get('SdcPage').new(param).extend(Stamps::Mail::AdvancedOptions::Labels)
      end
      return cache[:label_options]
    when :envelope
      if cache[:envelope_options].nil? || !cache[:envelope_options].present?
        cache[:envelope_options] = Object.const_get('SdcPage').new(param).extend(Stamps::Mail::AdvancedOptions::Envelopes)
      end
      return cache[:envelope_options]
      # when :certified_mail, :certified_mail_3910_3930, :certified_mail_3810, :certified_mail_3830
    when :cm3610, :cm3710, :cm3910, :cm3930, :cm3810, :cm3830
      if cache[:cm_options].nil? || !cache[:cm_options].present?
        cache[:cm_options] = Object.const_get('SdcPage').new(param).extend(Stamps::Mail::AdvancedOptions::CertifiedMails)
      end
      return cache[:cm_options]
    when :roll
      if cache[:roll_options].nil? || !cache[:roll_options].present?
        cache[:roll_options] = Object.const_get('SdcPage').new(param).extend(Stamps::Mail::AdvancedOptions::Rolls)
      end
      return cache[:roll_options]
    end

    raise ArgumentError, "Unable to create Advanced Options object for print media #{print_media}"
  end
end

module StampsPrintPreview
  def buy_more_labels
    @buy_more_labels = StampsField.new(driver.span(text: 'Buy More Labels')) if @buy_more_labels.nil? || !@buy_more_labels.present?
    expect(@buy_more_labels).to be_present
    @buy_more_labels
  end
end

module ExtServCertMail
  def certified_mail
    if cache[:certified_mail].nil? || !cache[:certified_mail].present? then
      cache[:certified_mail] = Stamps::WebApps::StampsCheckbox.new(
          driver.input(id: 'sdc-mainpanel-cmcheckbox-inputEl'),
          driver.div(id: 'sdc-mainpanel-cmcheckbox'),
          'class',
          'checked')
    end
    cache[:certified_mail]
  end
end

module ExtServElecRetReceipt
  def electronic_return_receipt
    if cache[:ereturn_receipt].nil? || !cache[:ereturn_receipt].present? then
      cache[:ereturn_receipt] = Stamps::WebApps::StampsCheckbox.new(
          driver.span(id: 'sdc-mainpanel-rrecheckbox-displayEl'),
          driver.div(id: 'sdc-mainpanel-rrecheckbox'),
          'class',
          'checked')
    end
    cache[:ereturn_receipt]
  end
end

# module ExtServRestDelivery
#   # def restricted_delivery
#   #   if cache[:restricted_delivery].nil? || !cache[:restricted_delivery].present?
#   #     cache[:restricted_delivery] = Stamps::Browser::StampsCheckbox.new(
#   #         driver.span(css: 'span[class*=sdc-mainpanel-rdcheckbox]'),
#   #         driver.div(css: 'div[id^=certifiedmailview]>div:nth-child(4)>div>div>div[class*=x-form-item]'),
#   #         'class',
#   #         'checked')
#   #   end
#   #   cache[:restricted_delivery]
#   # end
# end

module ExtServRetReceipt
  def return_receipt
    if cache[:return_receipt].nil? || !cache[:return_receipt].present?
      cache[:return_receipt] = Stamps::WebApps::StampsCheckbox.new(
          driver.span(id: 'sdc-mainpanel-rrcheckbox-displayEl'),        #can't check/uncheck
          #driver.span(css: 'span[id=sdc-mainpanel-rrcheckbox-displayEl]'),     #can't evaluate enabled/disabled
          driver.div(id: 'sdc-mainpanel-rrcheckbox'),
          'class',
          'checked')
    end
    cache[:return_receipt]
  end
end
