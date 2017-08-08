module Stamps
  module Mail
    module AdvancedOptions

      module AdvOptExtraServices
        def extra_services_btn
          @extra_services_btn = StampsElement.new(browser.span(id: "sdc-mainpanel-extraservicesbtn-btnInnerEl")) if @extra_services_btn.nil?
          @extra_services_btn
        end

        def extra_services
          return @extra_services if !@extra_services.nil? && @extra_services.present?
          expect(extra_services_btn.present?).to be(true), "Extra Services button is not present."
          @extra_services = PrintFormPanel::MailExtraServices.new(param) if @extra_services.nil? || !@extra_services.present?
          20.times do extra_services_btn.click unless @extra_services.present? end
          expect(@extra_services.present?).to be(true), "Extra Services modal did not open."
          @extra_services
        end
      end

      module AdvOptReferenceNumber
        def reference_number
          @reference_number = StampsTextBox.new(browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(6)>div>div>div>div>div>div>input")) if @reference_number.nil? || !@reference_number.present?
          @reference_number
        end
      end

      module AdvOptCostCode
        def cost_code
          if @cost_code.nil?
            input = browser.text_fields(css: "input[id^=costcodesdroplist-][id$=-inputEl]")
            drop_down = browser.divs(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]")
            @cost_code = StampsComboBox.new(input, drop_down, :li, 0)
          end
          @cost_code
        end
      end

      module AdvOptMailDate
        def mail_date
          @mail_date = MailDate.new(param) if @mail_date.nil?
          @mail_date
        end
      end

      module AdvOptHideLabelValue
        def hide_label_value
          if @hide_label_value.nil?
            input = browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(1)>div>div>span")
            verify = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(1)")
            @hide_label_value = Stamps::Browser::StampsCheckBox.new(input, verify, "class", "checked")
          end
          @hide_label_value
        end
      end

      module AdvOptPrintReferenceNumber
        def print_reference_number
          if @print_reference_number.nil?
            input = browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(3)>div>div>span")
            verify = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(3)")
            @print_reference_number = Stamps::Browser::StampsCheckBox.new(input, verify, "class", "checked")
          end
          @print_reference_number
        end
      end

      module AdvOptPrintReceipt
        def print_receipt
          if @print_receipt.nil?
            input = browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(2)>div>div>span")
            verify = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(2)")
            @print_receipt = Stamps::Browser::StampsCheckBox.new(input, verify, "class", "checked")
          end
          @print_receipt
        end
      end

      module AdvOptToggle
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
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptReferenceNumber
        include AdvOptCostCode

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

      module LabelsAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode
        include AdvOptHideLabelValue
        include AdvOptPrintReferenceNumber
        include AdvOptPrintReceipt

        def present?
          cost_code.present?
        end
      end

      module EnvelopesAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present?
        end

        def return_address
          if @return_address.nil?
            input = browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(2)>div>div>span")
            verify = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(2)")
            @return_address = Stamps::Browser::StampsCheckBox.new(input, verify, "class", "checked")
          end
          @return_address
        end

        def delivery_address
          if @delivery_address.nil?
            input = browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(3)>div>div>span")
            verify = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(3)")
            @delivery_address = Stamps::Browser::StampsCheckBox.new(input, verify, "class", "checked")
          end
          @delivery_address
        end

        def postage
          if @postage.nil?
            input = browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(4)>div>div>span")
            verify = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(4)")
            @postage = Stamps::Browser::StampsCheckBox.new(input, verify, "class", "checked")
          end
          @postage
        end
      end

      module CertifiedMailsAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present?
        end

        def restricted_delivery
          if @restricted_delivery.nil?
            clickable_element = browser.span(css: "span[class*=sdc-mainpanel-rdcheckbox]")
            verify = clickable_element.parent.parent.parent
            @restricted_delivery = Stamps::Browser::StampsCheckBox.new(clickable_element, verify, "class", "checked")
          end
          @restricted_delivery
        end

      end

      module RollsAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode
        include AdvOptHideLabelValue
        include AdvOptPrintReferenceNumber
        include AdvOptPrintReceipt

        def present?
          cost_code.present?
        end
      end

    end
  end
end