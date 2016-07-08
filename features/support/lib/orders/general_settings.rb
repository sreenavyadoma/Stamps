module Stamps
  module Orders
    class GeneralSettings < Browser::Modal
      class ResetFields < Browser::Modal
        class Weight < Browser::Modal
          class Pounds <  Browser::Modal
            def text_box
              BrowserTextBox.new (browser.text_field name: 'sdc-resetfieldswin-poundsnumberfield-inputEl')
            end

            def set value
              text_field = text_box
              text_field.set value
              logger.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Ounces <  Browser::Modal
            def text_box
              BrowserTextBox.new (browser.text_field name: 'sdc-resetfieldswin-ouncesnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
              sleep 1
=end
              text_field.set value
              logger.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          def enabled?
            browser_helper.enabled? (browser.text_field name: 'sdc-resetfieldswin-poundsnumberfield-inputEl')
          end

          def checkbox
            checkbox_field = browser.text_field id: "sdc-resetfieldswin-weightcheckbox-inputEl"
            verify_field = checkbox_field.parent.parent.parent
            attribute_name = "class"
            attribute_value = "checked"
            BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
          end

          def lbs
            Pounds.new param
          end

          def oz
            Ounces.new param
          end
        end

        class Dimensions < Browser::Modal
          class Length <  Browser::Modal
            def text_box
              BrowserTextBox.new (browser.text_field name: 'sdc-resetfieldswin-lengthnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
              sleep 1
=end
              text_field.set value
              logger.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Width <  Browser::Modal
            def text_box
              BrowserTextBox.new (browser.text_field name: 'sdc-resetfieldswin-widthnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
              sleep 1
=end
              text_field.set value
              logger.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Height <  Browser::Modal
            def text_box
              BrowserTextBox.new (browser.text_field name: 'sdc-resetfieldswin-heightnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
              sleep 1
=end
              text_field.set value
              logger.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = BrowserElement.new (browser.div css: "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          def enabled?
            browser_helper.enabled? (browser.text_field name: 'sdc-resetfieldswin-lengthnumberfield-inputEl')
          end

          def checkbox
            checkbox_field = browser.text_field id: "sdc-resetfieldswin-dimensionscheckbox-inputEl"
            verify_field = checkbox_field.parent.parent.parent
            attribute_name = "class"
            attribute_value = "checked"
            BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
          end

          def length
            Length.new param
          end

          def width
            Width.new param
          end

          def height
            Height.new param
          end

        end

        def present?
          (browser.div text: "Reset Fields").present?
        end

        def service
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-servicecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def weight
          Weight.new param
        end

        def dimensions
          Dimensions.new param
        end

        def ship_to_address
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-shiptoaddresscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def tracking
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-trackingcheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def extra_services
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-extraservicescheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def insurance
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-insurancecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reference_numbers
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-referencenumberscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def cost_code
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-costcodecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def customs
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-customscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def quantity
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-quantitycheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def stamps_amount
          checkbox_field = browser.text_field id: "sdc-resetfieldswin-stampsamountcheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def auto_advance_label_position
          parent = (browser.label :text=> "Auto-Advance Label Position (NetStamps and Label Sheets)").parent
          checkbox_field = parent.text_box
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def close
          button = BrowserElement.new (browser.span text: "Close")
          5.times do
            return unless button.present?
            button.safe_click
            sleep 1
            return unless present?
          end
        end
      end

      class LogoffDropDown < Browser::Modal
        def text_box
          BrowserTextBox.new (browser.text_fields css: "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[0]
        end

        def select selection
          drop_down = BrowserElement.new browser.div css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = BrowserElement.new browser.li text: selection
          10.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_field.text.include? selection
          end
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

      class PostDateDropDown < Browser::Modal
        def text_box
          BrowserTextBox.new (browser.text_fields css: "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[1]
        end

        def select selection
          drop_down = BrowserElement.new browser.div css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = BrowserElement.new browser.li text: selection
          10.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_field.text.include? selection
          end
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

      class PostageBalanceDropDown < Browser::Modal
        def text_box
          BrowserTextBox.new (browser.text_fields css: "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[2]
        end

        def select selection
          drop_down = BrowserElement.new browser.div css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = BrowserElement.new browser.li text: selection
          10.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_field.text.include? selection
          end
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

      def title
        BrowserElement.new browser.div text: "Settings"
      end

      def present?
        title.present?
      end

      def services
        checkbox_field = browser.text_field css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(2)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def log_off
        LogoffDropDown.new param
      end

      def post_date
        PostDateDropDown.new param
      end

      def postage_balance
        PostageBalanceDropDown.new param
      end

      def print_confirm
        checkbox_field = browser.text_field css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(6)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def reset_fields
        modal = ResetFields.new param
        button = BrowserElement.new browser.span text: "Select..."
        10.times do
          button.safe_click unless modal.present?
          return modal if modal.present?
        end
      end

      def usps_terms
        checkbox_field = browser.text_field css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(8)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def contacts
        checkbox_field = browser.text_field css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(10)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def shipments
        checkbox_field = browser.text_field css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(15)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def save
        button = BrowserElement.new (browser.span text: "Save")
        10.times do
          button.safe_click
          return unless button.present?
        end
      end

      def close
        button = BrowserElement.new (browser.img css: "img[class$=close]")
        10.times do
          button.safe_click
          return unless button.present?
        end
      end
    end
  end
end