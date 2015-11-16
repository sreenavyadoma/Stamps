module Postage
  class PrintOn < PostageObject


    def drop_down
      divs = @browser.divs :css => "div[id^=combo-][id$=-trigger-picker]"
      domestic = Button.new divs.first
      international = Button.new divs.last

      if domestic.present?
        domestic
      elsif international.present?
        international
      else
        raise "Unable to located Ship-To drop-down button."
      end
    end

    def text_box
      Textbox.new (@browser.text_fields :name => "CountryCode")[1]
    end

    def select selection
      log.info "Select Country #{country}"

      selection_1 = Label.new @browser.li :text => country
      selection_2 = Label.new @browser.li :text => "#{country} "

      text_box = self.text_box
      drop_down = self.drop_down
      10.times {
        begin
          drop_down.safe_click unless selection_1.present? || selection_2.present?
          if selection_1.present?
            selection_1.scroll_into_view
            selection_1.safe_click
          elsif selection_2.present?
            selection_2.scroll_into_view
            selection_2.safe_click
          end

          log.info "Selection #{text_box.text} - #{(text_box.text.include? country)?"was selected": "not selected"}"
          break if text_box.text.include? country
        rescue
          #ignore
        end
      }
      log.info "#{country} selected."
      InternationalShipTo.new @browser unless country.include? "United States"
    end

    def tooltip selection
      drop_down = Button.new @browser.div :css => "div[id^=printmediadroplist][id$=trigger-picker]"
      text_box = Textbox.new @browser.text_field :css => "input[name^=printmediadroplist]"
      selection_field = Label.new @browser.li :text => selection

      10.times{
        drop_down.safe_click unless selection_field.present?
        selection_field.safe_click
        input_text = text_box.text
        break if input_text.include? selection
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