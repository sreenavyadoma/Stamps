module Postage

  class EmailTracking < PostageObject
    def email_tracking

    end
  end

  class ShipToBase < PostageObject
    def country selection

    end
  end

  class PostageShipToDomestic < ShipToBase
    def delivery_address address
      textbox = Textbox.new "textbox object goes here"
      textbox.set address
    end

    def data_error_tooltip

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

  class PostageShipTo < PostageObject
    def domestic
      PostageShipToDomestic.new @browser
    end

    def international
      PostageShipToInternational.new @browser
    end
  end

  class ShippingLabel < PostageObject
    def email_tracking
      EmailTracking.new @browser
    end

    def ship_to
      PostageShipTo.new @browser
    end
  end

  class PrintOn < PostageObject

    def drop_down
      Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[0]
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


      if selection.downcase.includes? "shipping label"
        return ShippingLabel.new @browser
      else
        raise "Print On #{selection} not yet supported."

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

    class PrintPostage < PostageObject

      def sign_in_page
        @sign_in ||= Postage::SignInPage.new @browser
      end

      def navigation
        @navigation ||= Postage::Navigation.new @browser
      end

      def print_on
        PrintOn.new @browser
      end

    end
  end
end