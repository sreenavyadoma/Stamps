# encoding: utf-8
module Postage

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

  class ShipToBase < PostageObject
    def country selection
      PostageShipToDomestic.new @browser
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

    def company

    end
  end

  class PostageShipTo < ShipToBase
    def domestic
      PostageShipToDomestic.new @browser
    end

    def international
      PostageShipToInternational.new @browser
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

  class PrintOn < PostageObject

    def drop_down
      Button.new (@browser.divs FieldLocators::PrintOn.drop_down_divs)[0]
    end

    def text_box
      Textbox.new (@browser.text_field :name => "media")
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

  class PostageBase < PostageObject

    # all common fields goes here including service drop down

    def print_on selection
      PrintOn.new(@browser).select selection
    end

  end

  class ShippingLabel < PostageBase
    def email_tracking
      EmailTracking.new @browser
    end

    def ship_to
      PostageShipTo.new @browser
    end
  end

  class NetStamps < PostageBase

  end

  class Envelope < PostageBase

  end

  class CertifiedMail < PostageBase

  end

  class Roll < PostageBase

  end

  class PrintPostage < PostageBase

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

    def roll
      Roll.new @browser
    end

  end

end