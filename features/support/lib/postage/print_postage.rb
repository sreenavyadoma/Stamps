module Postage
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
    end

    def tooltip selection
      drop_down = Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[0]
      text_box = Textbox.new (@browser.text_field :name => "media")
      selection_field = Label.new @browser.div :text => selection

      10.times{
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