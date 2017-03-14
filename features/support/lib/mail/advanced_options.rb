module Stamps
  module Mail
    module PrintFormPanel

      module AdvancedOptionsExtraServices
        def extra_services
          return @extra_services if (!@extra_services.nil?)
          @select_button = StampsElement.new(browser.span(id: "sdc-mainpanel-extraservicesbtn-btnInnerEl")) if @select_button.nil? || !@select_button.present?
          expect(@select_button.present?).to be(true)
          @extra_services = MailExtraServices.new(param) if @extra_services.nil? || !@extra_services.present?
          20.times do @select_button.safe_click unless @extra_services.present? end
          expect(@extra_services.present?).to be(true)
          @extra_services
        end
      end

      module AdvancedOptionsReferenceNumber
        def reference_number
          if @reference_number.nil?
            @reference_number = StampsTextbox.new(browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(6)>div>div>div>div>div>div>input")) if @reference_number.nil? || !@reference_number.present?
          end
          @reference_number
        end
      end

      class CostCodeComboBox < Browser::StampsBrowserElement
        attr_accessor :param, :text_box, :drop_down

        def initialize(param)
          super(param)
          @index = index

          @text_box = browser.text_field(css: "input[id^=costcodesdroplist-][id$=-inputEl]")
          @drop_down = browser.div(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]")

          @param = text_box.param
          @browser = param.browser
        end

        def selection(str)
          expect([:li, :div]).to include(@selection_type)
          case selection_type
            when :li
              browser.lis(text: str)[@index]
            when :div
              browser.divs(text: str)[@index]
            else
              # do nothing
          end
        end

        def select(str)
          logger.info "Select #{str}"
          drop_down.safe_click
          drop_down.safe_click
          10.times do
            begin
              break if (text_box.text).include?(str)
              drop_down.safe_click unless selection(browser.lis(text: str)).present?
              element_helper.safe_click(selection(str))
              logger.info "Selected: #{text_box.text} - #{((text_box.text).include? str)?"done": "not selected"}"
            rescue
              #ignore
            end
          end
          expect(text_box.text).to eql(str)
          text_box.text
        end
      end

      module AdvancedOptionsCostCode
        def cost_code
          if @cost_code.nil?
            text_boxes = browser.text_fields(css: "input[id^=costcodesdroplist-][id$=-inputEl]")
            drop_downs = browser.divs(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]")
            @cost_code = StampsComboBox.new(param, text_boxes, drop_downs, :li, 0)
          end
          @cost_code
        end
      end

      module AdvancedOptionsMailDate
        def mail_date

        end
      end

      class AdvancedOptionsBase < Browser::StampsBrowserElement
        attr_accessor :show_element, :hide_element

        def initialize(param)
          super(param)
          @show_element = StampsElement.new(browser.span(text: "Show Advanced Options"))
          @hide_element = StampsElement.new(browser.span(text: "Hide Advanced Options"))
        end

        def show
          15.times do
            show_element.safe_click
            break if hide_element.present?
          end
          expect(hide_element.present?).to be(true)
        end

        def hide
          15.times do
            hide_element.safe_click
            break if show_element.present?
          end
          expect(show_element.present?).to be(true)
          self
        end
      end

      class AdvancedOptionsStamps < AdvancedOptionsBase
        include AdvancedOptionsExtraServices
        include AdvancedOptionsReferenceNumber
        include AdvancedOptionsCostCode

        def present?
          cost_code.present?
        end

        def calculate_postage_amount
          if @calculate_postage_amount.nil?
            element = browser.span(id: 'sdc-mainpanel-calculatepostageradio-displayEl')
            verify_element = browser.div(id: 'sdc-mainpanel-calculatepostageradio')
            @calculate_postage_amount = StampsRadio.new(element, verify_element, "class", "checked")
          end
          @calculate_postage_amount
        end

        def specify_postage_amount
          if @specify_postage_amount.nil?
            element = browser.span(id: 'sdc-mainpanel-specifypostageradio-displayEl')
            verify_element = browser.div(id: 'sdc-mainpanel-specifypostageradio')
            @specify_postage_amount = StampsRadio.new(element, verify_element, "class", "checked")
          end
          @specify_postage_amount
        end
      end

      class AdvancedOptionsShippingLabel < AdvancedOptionsBase
        include AdvancedOptionsExtraServices
        include AdvancedOptionsMailDate
        include AdvancedOptionsReferenceNumber
        include AdvancedOptionsCostCode

        def present?
          cost_code.present?
        end

        def hide_label_value

        end

        def print_receipt

        end

        def print_reference_number

        end
      end

      class AdvancedOptionsEnvelope < AdvancedOptionsBase
        include AdvancedOptionsExtraServices
        include AdvancedOptionsMailDate
        include AdvancedOptionsReferenceNumber
        include AdvancedOptionsCostCode

        def present?
          cost_code.present?
        end

        def include_return_address
          #checkbox
        end

        def include_delivery_address
          #checkbox
        end

        def include_postage
          #checkbox
        end
      end

      class AdvancedOptionsCertMail < AdvancedOptionsBase
        include AdvancedOptionsExtraServices
        include AdvancedOptionsMailDate
        include AdvancedOptionsReferenceNumber
        include AdvancedOptionsCostCode

        def present?
          cost_code.present?
        end

        def hide_label_value
          #checkbox
        end

        def print_reference_number
          #checkbox
        end
      end

      class AdvancedOptionsRolls < AdvancedOptionsBase
        include AdvancedOptionsCostCode

        def present?
          cost_code.present?
        end

      end
    end
  end
end