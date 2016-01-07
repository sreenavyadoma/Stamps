# encoding: utf-8
module Postage


  ######Class for Print Postage page, Incl. toolbars and navigation. Instantiates postage form objects for Print On selections

  class PrintPostage < Postage::PostageObject

    def sign_in_page
      @sign_in ||= Postage::SignInPage.new @browser
    end

    def navbar
     Postage::NavBar.new @browser
    end

    def toolbar
      #we'll get to this when it comes time to buy stamps and prefs
    end

    def postage_base
      PostageBase.new @browser
    end

  end


  ######Parent Class for Postage Form Types

  class PostageBase < PrintPostage
    # all common fields goes here including service drop down

    def country
      Country.new @browser
    end

    def service
      ServiceDropDown.new @browser
    end

    def ship_from
      ShipFromAddress.new @browser
    end

    def weight
      Weight.new @browser
    end

    def print_on
      PrintOn.new @browser
    end

    def total
      @browser.label :css => "label[id*=sdc-printpanel-totalcostlabel]"
    end

    def print_sample_button
      Button.new (@browser.a :css => "a[class*=sdc-printpanel-printsamplebtn]")
    end

    def print_button
      Button.new (@browser.a :css => "a[class*=sdc-printpanel-printpostagebtn]")
    end

    def shipping_label
      ShippingLabel.new @browser
    end

    def stamps
      NetStamps.new @browser
    end

    def envelope
      Envelope.new @browser
    end

    def certified_mail
      CertifiedMail.new @browser
    end

    def print
      @print_window ||= Postage::PrintPostageModal.new @browser
      open_window @print_window
    end

    def print_invalid_address
      open_window InvalidAddressError.new(@browser)
    end

    def print_expecting_error *args
      error_window = OrderErrors.new(@browser)
      open_window error_window
      case args.length
        when 0
          error_window
        when 1
          error_window.error_message.include? error_message
        else
          raise "Illegal number of arguments."
      end
    end

    def open_window window
      return window if window.present?

      browser_helper.click print_button, "print"



      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      install_plugin_error = ErrorInstallPlugin.new @browser

      20.times do
        if install_plugin_error.present?
          install_plugin_error.close
          return nil
        end

        begin
          if error_connecting_to_plugin.present?
            5.times{
              error_connecting_to_plugin.ok
              break unless error_connecting_to_plugin.present?
            }
          end

          if naws_plugin_error.present?
            5.times{
              naws_plugin_error.ok
              break unless naws_plugin_error.present?
            }
          end

          return window if window.present?
          browser_helper.click browser_print_button, "print"
        rescue
          #ignore
        end
      end

      return window if window.present?
      raise "Unable to open Print Window.  There might be errors in printing of order is not ready for printing.  Check your test."
    end

    def browser_settings_button
      Button.new (@browser.span :css => "span[class*=sdc-icon-settings]")
    end

    def click_print_button
      browser_helper.click print_button
    end

    #def wait_until_present
    #  browser_helper.wait_until_present @browser.span Locators::ToolBar::add
    #end

    #def present?
    #  browser_helper.present? @browser.span Locators::ToolBar::add
    #end


  end



  ######Classes for each Postage Form type, containing the form elements specific to that Print On selection


  class ShippingLabel < PostageBase

    def email_tracking
      EmailTracking.new @browser
    end

    def ship_to
      PostageShipTo.new @browser
    end

    def insure_for
      InsureFor.new @browser
    end

    def extra_services
      ExtraServices.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end

  end

  class NetStamps < PostageBase

    def serial
      Textbox.new @browser.text_field :id => "sdc-mainpanel-nsserialtextfield-inputEl"
    end

    def extra_services
      ExtraServices.new @browser
    end

    def calculate_postage_button
      @browser.input :id => "sdc-mainpanel-calculatepostageradio-inputEl"
    end

    def specify_postage_button
      @browser.input :id => "sdc-mainpanel-specifypostageradio-inputEl"
    end

    def stamp_amount
      StampAmount.new @browser
    end

  end

  class Envelope < PostageBase

    def ship_to
      PostageShipTo.new @browser
    end

    def insure_for
      InsureFor.new @browser
    end

    def extra_services
      ExtraServices.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end
  end

  class CertifiedMail < PostageBase

    def ship_to
      PostageShipTo.new @browser
    end

    def insure_for
      InsureFor.new @browser
    end

    def cm_extra_services
      CMExtraServices.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end
  end

  ######  CLASSES FOR ELEMENTS CONTAINED IN PRINT POSTAGE FORM   ######


  ###### Classes common to every Print On type


  class PrintOn < PostageObject

    def drop_down
      Button.new (@browser.divs Locators::FormBody.print_on_drop_down_divs)[0]
    end

    def text_box
      Textbox.new (@browser.text_field Locators::FormBody.print_on_text_field)
    end

    def select selection
      box = text_box
      button = drop_down
      selection_label = Label.new @browser.div :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          break if box.text.include? selection
        rescue
          #ignore
        end
      }
    end

    def tooltip selection
      drop_down = Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[0]
      text_box = Textbox.new (@browser.text_field :name => "media")
      selection_field = Label.new @browser.div :text => selection

      10.times {
        drop_down.safe_click unless selection_field.present?
        return selection_field.attribute_value "data-qtip" if selection_field.present?
      }
    end

    def enabled? selection

    end

    def disabled? selection

    end
  end

  class ShipFromAddress < PostageObject

    def drop_down
      Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[1]
    end

    def manage_ship_from_address_field
      @browser.div :text => 'Manage Shipping Addresses...'
    end

    def ship_from_selection selection
      @browser.div :text => selection
    end

    def manage_shipping_address
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
    end

    def manage_shipping_addresses
      self.ship_from "Manage Shipping Addresses..."
    end

    def text_box
      Textbox.new @browser.text_field :name => "shipFrom"
    end

    def select selection
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)

      return @manage_shipping_adddress if @manage_shipping_adddress.present?

      ship_from_default_selection_field = (@browser.divs :css => "div[class*=x-boundlist-item]")[0] #"div[id^=shipfromdroplist][id$=trigger-picker]"
      ship_from_dropdown = self.drop_down
      ship_from_textbox = self.text_box

      if selection.downcase == "default"
        ship_from_selection_field = ship_from_default_selection_field
      elsif selection.downcase.include? "manage shipping"
        ship_from_selection_field = @browser.div :text => "Manage Shipping Addresses..."
      else
        ship_from_selection_field = @browser.div :text => "#{selection}"
      end

      selection_label = Label.new ship_from_selection_field

      if selection.downcase.include? "manage shipping"
        10.times{
          begin
            ship_from_dropdown.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            return @manage_shipping_adddress if @manage_shipping_adddress.present?
          rescue
            #ignore
          end
          click_form
        }
      else
        ship_from_dropdown.safe_click unless selection_label.present?
        if selection_label.present?
          selection_label.scroll_into_view
          selection_text = selection_label.text
        end
        10.times{
          ship_from_dropdown.safe_click unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          break if ship_from_textbox.text.include? selection_label.text
        }
      end
    end

  end


  class Country < PostageObject
    def drop_down
      Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[2]
    end

    def text_box
      Textbox.new (@browser.text_field :name => "mailToCountry")
    end

    def select selection
      box = text_box
      button = drop_down
      selection_label = Label.new @browser.div :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          break if box.text.include? selection
        rescue
          #ignore
        end
      }
    end
  end

  class Weight < PostageObject
    def ounces
      Textbox.new @browser.text_field :id => "sdc-mainpanel-ouncesnumberfield-inputEl"
    end

    def increment_ounces
      Button.new (@browser.divs :css => "div[class*=x-form-spinner_up]")[0]
    end

    def decrement_ounces
      Button.new (@browser.divs :css => "div[class*=x-form-spinner_down]")[0]
    end

    def pounds
      Textbox.new @browser.text_field :id => "sdc-mainpanel-poundsnumberfield-inputEl"
    end

    def increment_pounds
      Button.new (@browser.divs :css => "div[class*=x-form-spinner_up]")[1]
    end

    def decrement_pounds
      Button.new (@browser.divs :css => "div[class*=x-form-spinner_down]")[1]
    end

  end

  class ServiceDropDown < PostageObject
    def text_box
      Textbox.new @browser.text_field :name => "nsService"
    end

    def drop_down
      Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[6]
    end

    def select selection
      log.info "Select Service #{selection}"
      box = text_box
      button = drop_down
      selection_label = Label.new @browser.div :css => "div[data-qtip*='#{selection}']"
      10.times {
        begin
          button.safe_click #unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          selected_service = box.text
          if selected_service == "First Class (1 - 3 Days)"
            selected_service = "First Class Mail (1 - 3 Days)"
          end
          log.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
          break if selected_service.include? selection
        rescue
          #ignore
        end
      }
      log.info "#{selection} service selected."
      selection_label
    end

    def cost selection
      button = drop_down
      cost_label = Label.new @browser.td :css => "tr[data-qtip*='#{selection}']>td:nth-child(3)"
      10.times {
        begin
          button.safe_click unless cost_label.present?
          if cost_label.present?
            service_cost = test_helper.remove_dollar_sign cost_label.text
            log.info "Service Cost for \"#{selection}\" is #{service_cost}"
            return service_cost
          end
        rescue
          #ignore
        end
      }
      click_form
    end

    def tooltip selection
      button = drop_down
      selection_label = Label.new @browser.tr :css => "tr[data-qtip*='#{selection}']"
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            tooltip = selection_label.attribute_value "data-qtip"
            log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
            return tooltip
          end
        rescue
          #ignore
        end
      }
      click_form
    end

  end


  ###### Classes unique to specific Print On types

 ## class PostageShipTo < ShipToBase
 #   def domestic
 #     PostageShipToDomestic.new @browser
  #  end

 #   def international
 #     PostageShipToInternational.new @browser
  #  end
 # end

  class ShipToBase < PostageObject
    def email
      EmailTracking.new @browser
    end
  end

  class PostageShipToDomestic < ShipToBase
    def delivery_address
      Textbox.new @browser.text_field :name => "sdc-mainpanel-shiptotextarea-inputEl"
    end

    def data_error_tooltip
      tooltip = browser.div :id => "sdc-mainpanel-shiptotextarea-errorEl"
    end
  end

  class PostageShipToInternational < ShipToBase
    def name
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptonamefield-inputEl"
    end

    def name_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptonamefield-errorEl"
    end

    def company
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptocompanyfield-inputEl"
    end

    def address_1
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptoaddress1field-inputEl"
    end

    def address_1_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptoaddress1field-errorEl"
    end

    def address_2
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptoaddress2field-inputEl"
    end

    def city
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptocityfield-inputEl"
    end

    def city_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptocityfield-errorEl"
    end

    def province
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptoprovincefield-inputEl"
    end

    def province_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptoprovincefield-errorEl"
    end

    def postal_code
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptopostcodefield-inputEl"
    end

    def postal_code_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptopostcodefield-errorEl"
    end

    def phone
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptophonefield-inputEl"
    end

    def phone_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptophonefield-errorEl"
    end

  end


  class EmailTracking < PostageObject
    def checkbox
      checkbox_field = @browser.input :id => "sdc-mainpanel-emailcheckbox-inputEl"
      verify_field = checkbox_field.parent.parent.parent.parent
      attribute = "class"
      verify_field_attrib = "checked"
      Stamps::Browser::Checkbox.new checkbox_field, verify_field, attribute, verify_field_attrib
    end

    def text_box
      Textbox.new @browser.text_field :name => "recipientEmail"
    end

    def tooltip
      Label.new(@browser.label :id => "sdc-mainpanel-emailcheckbox-boxLabelEl").attribute_value "data-qtip"
    end

    def data_error_tooltip
      tooltip = browser.div :css => "div[id=sdc-mainpanel-emailtextfield-errorEl]"
    end
  end



  class InsureFor < PostageObject
    def textbox
      Textbox.new @browser.text_field :name => "insureAmt"
    end

    def more_button
      Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[3]
    end

    def less_button
      Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[3]
    end

  end

  class ExtraServices < PostageObject
    def button
      Button.new (@browser.span :id => "sdc-mainpanel-extraservicesbtn-btnIconEl")
    end

  end

  class ShipDate < PostageObject
    #Textbox.new @browser.text_field :id => "sdc-mainpanel-shipdatedatefield-inputEl"
  end

  class StampAmount < PostageObject
    def textbox
      Textbox.new @browser.text_field :name => "stampAmount"
    end

    def more_button
      Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[3]
    end

    def less_button
      Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[3]
    end
  end

  class CMExtraServices < PostageObject
    def cm_checkbox
      @browser.input :id => "sdc-mainpanel-cmcheckbox-inputEl"
    end

    def rre_checkbox
      @browser.input :id => "sdc-mainpanel-rrecheckbox-inputEl"
    end

    def rd_checkbox
      @browser.input :css => "input[class*=sdc-mainpanel-rdcheckbox]"
    end
  end

end