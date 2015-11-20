# encoding: utf-8
module Postage


  ######Class for Print Postage page, Incl. toolbars and navigation. Instantiates postage form objects for Print On selections

  class PrintPostage

    def initialize browser
      @browser = browser
    end

    def sign_in_page
      @sign_in ||= PostageBase::SignInPage.new @browser
    end

    def navigation
      @navigation ||= PostageBase::Navigation.new @browser
    end

    def toolbar
      #we'll get to this when it comes time to buy stamps and prefs
    end

    def print_on selection
      PrintOn.new(@browser).select selection

      if selection.downcase.include? "shipping label"
        shipping_label
      elsif selection.downcase.include? "stamps"
        stamps
      elsif selection.downcase.include? "envelope"
        envelope
      elsif selection.downcase.include? "certified"
        certified_mail
      elsif selection.downcase.include? "roll"
        shipping_label
      else
        raise "Print On #{selection} not yet supported."
      end
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

  end


  ######Parent Class for Postage Form Types

  class PostageBase < Postage::PostageObject
    # all common fields goes here including service drop down

    def country
      Country.new @browser
    end

    def service
      Service.new @browser
    end

    def ship_from
      ShipFrom.new @browser
    end

    def weight
      Weight.new @browser
    end

    def print_on
      PrintOn.new @browser
    end
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
      Serial.new @browser
    end

    def extra_services
      ExtraServices.new @browser
    end

    def calculate_postage

    end

    def specify_postage

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
  end

  class ShipFrom < PostageObject

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

  end

  class Service < PostageObject

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
      tooltip = browser.div :css => "div[id=sdc-mainpanel-shiptotextarea-errorEl]"
    end
  end

  class PostageShipToInternational < ShipToBase
    def name
      name_input = Textbox.new @browser.text_field :text => ""
      name_input.data_qtip_field "the browser field containing the data error", "data-errorqtip"
      name_input
    end

    def name_data_error_tooltip

    end

    def company

    end

    def address_1

    end

    def address_1_data_error_tooltip

    end

    def address_2

    end

    def city

    end

    def city_data_error_tooltip

    end

    def province

    end

    def province_data_error_tooltip

    end

    def postal_code

    end

    def postal_code_data_error_tooltip

    end

    def phone

    end

    def phone_data_error_tooltip

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

  end

  class ExtraServices < PostageObject

  end

  class ShipDate < PostageObject

  end

  class Serial < PostageObject

  end

  class ExtraServices < PostageObject

  end

  class StampAmount < PostageObject

  end

  class CMExtraServices < PostageObject

  end

end