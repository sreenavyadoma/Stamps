module Stamps
  module Mail
    module AdvancedOptions

      module AdvancedOptionsExtraServices
        def extra_services_select_button
          @extra_services_select_button = StampsElement.new(browser.span(id: "sdc-mainpanel-extraservicesbtn-btnInnerEl")) if @extra_services_select_button.nil? || !@extra_services_select_button.present?
        end

        def extra_services
          return @extra_services if !@extra_services.nil? && @extra_services.present?
          expect(extra_services_select_button.present?).to be(true)
          @extra_services = MailExtraServices.new(param) if @extra_services.nil? || !@extra_services.present?
          20.times do extra_services_select_button.click unless @extra_services.present? end
          expect(@extra_services.present?).to be(true)
          @extra_services
        end
      end

      module AdvancedOptionsReferenceNumber
        def reference_number
          @reference_number = StampsTextbox.new(browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(6)>div>div>div>div>div>div>input")) if @reference_number.nil? || !@reference_number.present?
          @reference_number
        end
      end

      module AdvancedOptionsCostCode
        def cost_code
          @cost_code = StampsComboBox.new(browser.text_fields(css: "input[id^=costcodesdroplist-][id$=-inputEl]"), browser.divs(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]"), :li, 0) if @cost_code.nil?
          @cost_code
        end
      end

      module AdvancedOptionsMailDate
        def mail_date
          @mail_date = MailDate.new(param) if @mail_date.nil?
          @mail_date
        end
      end

      module AdvancedOptionsToggle
        def show
          @show_element = StampsElement.new(browser.span(text: "Show Advanced Options")) if @show_element.nil?
          @hide_element = StampsElement.new(browser.span(text: "Hide Advanced Options")) if @hide_element.nil?
          15.times do
            @show_element.click
            break if @hide_element.present?
          end
          expect(@hide_element.present?).to be(true)
        end

        def hide
          @show_element = StampsElement.new(browser.span(text: "Show Advanced Options")) if @show_element.nil?
          @hide_element = StampsElement.new(browser.span(text: "Hide Advanced Options")) if @hide_element.nil?
          15.times do
            @hide_element.click
            break if @show_element.present?
          end
          expect(@show_element.present?).to be(true)
          self
        end
      end

      module StampsAdvancedOptions
        include AdvancedOptionsToggle
        include AdvancedOptionsExtraServices
        include AdvancedOptionsReferenceNumber
        include AdvancedOptionsCostCode

        def present?
          show
          cost_code.present?
        end

        def calculate_postage_amount
          if @calculate_postage_amount.nil?
            element = browser.span(id: 'sdc-mainpanel-calculatepostageradio-displayEl')
            verify_element = browser.div(id: 'sdc-mainpanel-calculatepostageradio')
            @calculate_postage_amount = StampsRadio.new(element, verify_element, "class", "checked")
          end
          show
          @calculate_postage_amount
        end

        def specify_postage_amount
          if @specify_postage_amount.nil?
            element = browser.span(id: 'sdc-mainpanel-specifypostageradio-displayEl')
            verify_element = browser.div(id: 'sdc-mainpanel-specifypostageradio')
            @specify_postage_amount = StampsRadio.new(element, verify_element, "class", "checked")
          end
          show
          @specify_postage_amount
        end

      end

      module LabelsAdvancedOptions
        include AdvancedOptionsToggle
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

      module EnvelopesAdvancedOptions
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

      module CertifiedMailsAdvancedOptions
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

      module RollsAdvancedOptions
        include AdvancedOptionsCostCode

        def present?
          cost_code.present?
        end

      end

    end
  end
end