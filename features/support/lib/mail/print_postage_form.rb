# encoding: utf-8
module Stamps
  module Mail
    class PostageCountry < Browser::StampsHtmlField
      attr_reader :text_box, :drop_down

      def initialize(param)
        super(param)
        @text_box = StampsTextbox.new(browser.text_field(name: "mailToCountry"))
        @drop_down = StampsElement.new(browser.divs(css: "div[class*=x-form-trigger]")[2])
      end

      def select(selection)
        selection_label = StampsElement.new browser.div(text: selection)
        5.times {
          begin
            break if text_box.text.include? selection
            break if text_box.text.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if text_box.text.include? selection
          rescue
            #ignore
          end
        }
      end
    end

    class Pounds < Browser::StampsHtmlField
      attr_reader :text_box, :increment_button, :decrement_button

      def initialize(param)
        super(param)
        @text_box = StampsTextbox.new(browser.text_field id: 'sdc-mainpanel-poundsnumberfield-inputEl')
        @increment_button = StampsElement.new browser.div css: "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
        @decrement_button = StampsElement.new browser.div css: "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
      end

      def set(value)
        value = value.to_i
        max = value + text_box.text.to_i
        max.times do
          current_value = text_box.text.to_i
          break if value == current_value
          if value > current_value
            increment 1
          else
            decrement 1
          end
          break if value == current_value
        end
        sleep(0.35)
        logger.info "Pounds set to #{text_box.text}"
      end

      def increment value
        value.to_i.times do
          increment_button.safe_click
        end
      end

      def decrement value
        value.to_i.times do
          decrement_button.safe_click
        end
      end
    end

    class Ounces < Browser::StampsHtmlField
      attr_reader :decrement_button, :text_box, :increment_button

      def initialize(param)
        super(param)
        @decrement_button = StampsElement.new browser.div css: "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
        @text_box = StampsTextbox.new(browser.text_field id: 'sdc-mainpanel-ouncesnumberfield-inputEl')
        @increment_button = StampsElement.new browser.div css: "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
      end

      def set(value)
        text_field = text_box
        value = value.to_i
        max = value + text_field.text.to_i
        max.times do
          current_value = text_field.text.to_i
          break if value == current_value
          if value > current_value
            increment 1
          else
            decrement 1
          end
          break if value == current_value
        end
        sleep(0.35)
        logger.info "Pounds set to #{text_field.text}"
      end

      def increment value
        value.to_i.times do
          increment_button.safe_click
        end
      end

      def decrement value
        value.to_i.times do
          decrement_button.safe_click
        end
      end
    end

    class StampAmount < Browser::StampsHtmlField
      def text_box
        StampsTextbox.new(browser.text_field name: "stampAmount")
      end

      def set(value)
        text_field = text_box
        text_field.set(value)
        logger.info "Pounds set to #{text_field.text}"
      end

      def increment value
        button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class ShipDate < Browser::StampsHtmlField

      def text_box
        StampsTextbox.new(browser.text_field id: "sdc-mainpanel-shipdatedatefield-inputEl")
      end

      def date_picker

      end

    end

    class CostCode  < Browser::StampsHtmlField
      def text_box
        StampsTextbox.new browser.text_field name: "costCodeId"
      end

      def drop_down
        buttons = browser.divs css: "div[class*=x-form-arrow-trigger]"
        button = StampsElement.new(buttons.last)
      end

      def select(selection)
        logger.info "Select Cost Code #{selection}"

        box = text_box
        button = drop_down
        selection_label = StampsElement.new browser.div text: selection
        sleep(0.35)
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_cost_code = box.text
            logger.info "Selected Cost Code #{selected_cost_code} - #{(selected_cost_code.include? selection)?"done": "cost code not selected"}"
            break if selected_cost_code.include? selection
          rescue
            #ignore
          end
        }
        logger.info "Origin Country selected: #{selection}"
        selection_label
      end

    end

    class Quantity < Browser::StampsHtmlField
      def text_box
        StampsTextbox.new(browser.text_field css: "input[class*='sdc-previewpanel-quantitynumberfield']")
      end

      def set(value)
        text_field = text_box
        text_field.set(value)
        logger.info "Quantity set to #{text_field.text}"
      end

      def increment value
        button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[7])
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[7])
        value.to_i.times do
          button.safe_click
        end
      end
    end
  end
end
