module Stamps
  module Orders
    module Settings
      class Pounds < Browser::StampsHtmlField
        attr_reader :text_box, :inc_bthn, :dec_btn

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(name: 'sdc-resetfieldswin-poundsnumberfield-inputEl'))
          @inc_bthn = StampsElement.new(browser.div(css: "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=up]"))
          @dec_btn = StampsElement.new(browser.div(css: "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=down]"))
        end

        def text
          text_box.text
        end

        def set(value)
          text_box.set(value)
          logger.info "Pounds set to #{text_box.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_bthn.safe_click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.safe_click
          end
        end
      end

      class Ounces < Browser::StampsHtmlField
        attr_reader :text_box, :inc_btn, :dec_btn

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(name: 'sdc-resetfieldswin-ouncesnumberfield-inputEl'))
          @inc_btn = StampsElement.new(browser.div(css: "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=up]"))
          @dec_btn = StampsElement.new(browser.div(css: "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=down]"))
        end

        def text
          text_box.text
        end

        def set(value)
          text_box.set(value)
          logger.info "Pounds set to #{text_box.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_btn.safe_click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.safe_click
          end
        end
      end

      class Weight < Browser::StampsHtmlField
        attr_reader :lb, :oz

        def initialize(param)
          super(param)
          @lb = Pounds.new(param)
          @oz = Ounces.new(param)
        end

        def enabled?
          element_helper.enabled?(browser.text_field(name: 'sdc-resetfieldswin-poundsnumberfield-inputEl'))
        end

        def checkbox
          checkbox_field = browser.span(id: "sdc-resetfieldswin-weightcheckbox-displayEl")
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end
      end

      class Length < Browser::StampsHtmlField
        attr_reader :text_box, :inc_btn, :dec_btn

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(name: 'sdc-resetfieldswin-lengthnumberfield-inputEl'))
          @inc_btn = StampsElement.new(browser.div css: "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=up]")
          @dec_btn = StampsElement.new(browser.div css: "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=down]")
        end

        def text
          text_box.text
        end

        def set(value)
          text_box.set(value)
          logger.info "Pounds set to #{text_box.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_btn.safe_click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.safe_click
          end
        end
      end

      class Width < Browser::StampsHtmlField
        attr_reader :text_box, :inc_btn, :dec_btn

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field name: 'sdc-resetfieldswin-widthnumberfield-inputEl')
          @inc_btn = StampsElement.new(browser.div css: "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=up]")
          @dec_btn = StampsElement.new(browser.div css: "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=down]")
        end

        def text
          text_box.text
        end

        def set(value)
          text_box.set(value)
          logger.info "Pounds set to #{text_box.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_btn.safe_click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.safe_click
          end
        end
      end

      class Height < Browser::StampsHtmlField
        attr_reader :text_box

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field name: 'sdc-resetfieldswin-heightnumberfield-inputEl')
        end

        def text
          text_box.text
        end

        def set(value)
          text_box.set(value)
          logger.info "Pounds set to #{text_box.text}"
          expect(text).to eql value
        end

        def increment value
          button = StampsElement.new(browser.div css: "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=up]")
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsElement.new(browser.div css: "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=down]")
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class SettingsLogoffDropDown < Browser::StampsHtmlField
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div>input")
          @drop_down = StampsElement.new browser.div(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div[id$=picker]")
        end

        def text
          text_box.text
        end

        def select(selection)
          selection_label = StampsElement.new browser.li(text: selection)
          10.times do
            break if text_box.text.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
          end
          expect(text_box.text).to include(selection)
        end

        def five_min
          select "5 min."
        end

        def ten_min
          select "10 min."
        end

        def fifteen_min
          select "15 min."
        end

        def thirty_min
          select "30 min."
        end

        def one_hour
          select "1 hour"
        end

        def two_hours
          select "2 hours"
        end
      end

      class PostDateDropDown < Browser::StampsHtmlField
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div>input")
          @drop_down = StampsElement.new browser.div css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div[id$=picker]"
        end

        def text
          text_box.text
        end

        def select(selection)
          selection_label = StampsElement.new browser.li text: selection
          10.times do
            break if text_box.text.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
          end
          expect(text_box.text).to include(selection)
        end

        def twelve_am
          select "12:00 a.m."
        end

        def one_am
          select "1:00 a.m."
        end

        def two_am
          select "2:00 a.m."
        end

        def three_am
          select "3:00 a.m."
        end

        def four_am
          select "4:00 a.m."
        end

        def five_am
          select "5:00 a.m."
        end

        def six_am
          select "6:00 a.m."
        end

        def seven_am
          select "7:00 a.m."
        end

        def eight_am
          select "8:00 a.m."
        end

        def nine_am
          select "9:00 a.m."
        end

        def ten_am
          select "10:00 a.m."
        end

        def eleven_am
          select "11:00 a.m."
        end

        def twelve_pm
          select "12:00 p.m."
        end

        def one_pm
          select "1:00 p.m."
        end

        def two_pm
          select "2:00 p.m."
        end

        def three_pm
          select "3:00 p.m."
        end

        def four_pm
          select "4:00 p.m."
        end

        def five_pm
          select "5:00 p.m."
        end

        def six_pm
          select "6:00 p.m."
        end

        def seven_pm
          select "7:00 p.m."
        end

        def eight_pm
          select "8:00 p.m."
        end

        def nine_pm
          select "9:00 p.m."
        end

        def ten_pm
          select "10:00 p.m."
        end

        def eleven_pm
          select "11:00 p.m."
        end
      end

      class PostageBalanceDropDown < Browser::StampsHtmlField
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div>input")
          @drop_down = StampsElement.new browser.div(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div[id$=picker]")
        end

        def select(selection)
          selection_label = StampsElement.new browser.li text: selection
          10.times do
            break if text_box.text.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
          end
          expect(text_box.text).to include(selection)
        end

        def zero
          select "$0"
        end

        def ten
          select "$10"
        end

        def twenty_five
          select "$25"
        end

        def fifty
          select "$50"
        end

        def one_hundred
          select "$100"
        end

        def two_hundred_fifty
          select "$250"
        end

        def five_hundred
          select "$500"
        end
      end

      class Dimensions < Browser::StampsHtmlField
        def enabled?
          element_helper.enabled? (browser.text_field name: 'sdc-resetfieldswin-lengthnumberfield-inputEl')
        end

        def checkbox
          checkbox_field = browser.span id: "sdc-resetfieldswin-dimensionscheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def length
          Length.new(param)
        end

        def width
          Width.new(param)
        end

        def height
          Height.new(param)
        end
      end

      class ResetFields < Browser::StampsHtmlField
        def present?
          (browser.div text: "Reset Fields").present?
        end

        def service
          checkbox_field = browser.span id: "sdc-resetfieldswin-servicecheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def weight
          Weight.new(param)
        end

        def dimensions
          Dimensions.new(param)
        end

        def test_parameter[:ship_to_address]
          checkbox_field = browser.span id: "sdc-resetfieldswin-shiptoaddresscheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def tracking
          checkbox_field = browser.span id: "sdc-resetfieldswin-trackingcheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def extra_services
          checkbox_field = browser.span id: "sdc-resetfieldswin-extraservicescheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def insurance
          checkbox_field = browser.span id: "sdc-resetfieldswin-insurancecheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reference_numbers
          checkbox_field = browser.span id: "sdc-resetfieldswin-referencenumberscheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def cost_code
          checkbox_field = browser.span id: "sdc-resetfieldswin-costcodecheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def customs
          checkbox_field = browser.span id: "sdc-resetfieldswin-customscheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def quantity
          checkbox_field = browser.span id: "sdc-resetfieldswin-quantitycheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def stamps_amount
          checkbox_field = browser.span id: "sdc-resetfieldswin-stampsamountcheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def auto_advance_label_position
          parent = (browser.label :text=> "Auto-Advance Label Position (NetStamps and Label Sheets)").parent
          checkbox_field = parent.span(:class=> 'x-form-checkbox')
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def close
          button = StampsElement.new(browser.span text: "Close")
          5.times do
            return unless button.present?
            button.safe_click
            sleep(0.35)
            return unless present?
          end
        end
      end

      class GeneralSettings < Browser::StampsHtmlField

        def title
          StampsElement.new browser.div text: "Settings"
        end

        def present?
          title.present?
        end

        def services
          checkbox_field = browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(2)>div>div>div>div>div>div>div>span"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def log_off
          SettingsLogoffDropDown.new(param)
        end

        def post_date
          PostDateDropDown.new(param)
        end

        def postage_balance
          PostageBalanceDropDown.new(param)
        end

        def print_confirm
          checkbox_field = browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(6)>div>div>div>div>div>div>div>span"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reset_fields
          modal = ResetFields.new(param)
          button = StampsElement.new browser.span text: "Select..."
          10.times do
            button.safe_click unless modal.present?
            return modal if modal.present?
          end
        end

        def usps_terms
          checkbox_field = browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(8)>div>div>div>div>div>div>div>span"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def contacts
          checkbox_field = browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(10)>div>div>div>div>div>div>div>span"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def shipments
          checkbox_field = browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(15)>div>div>div>div>div>div>div>span"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def save
          button = StampsElement.new(browser.span text: "Save")
          10.times do
            button.safe_click
            return unless button.present?
          end
        end

        def close
          button = StampsElement.new(browser.img css: "img[class$=close]")
          10.times do
            button.safe_click
            return unless button.present?
          end
        end
      end
    end
  end
end