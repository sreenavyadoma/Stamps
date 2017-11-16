module Stamps
  module Mail
    module AdvancedOptions

      module AdvOptExtraServices
        def extra_services_btn
          (cache[:extra_services_btn].nil?||!cache[:extra_services_btn].present?)?cache[:extra_services_btn]=StampsField.new(
              browser.span(id: "sdc-mainpanel-extraservicesbtn-btnInnerEl")):cache[:extra_services_btn]
        end

        def xtra_serv_panel
          (cache[:xtra_serv_panel].nil?||!cache[:xtra_serv_panel].present?)?cache[:xtra_serv_panel]=PrintFormPanel::MailExtraServices.new(param):cache[:xtra_serv_panel]
        end

        def extra_services
          20.times do
            return xtra_serv_panel if xtra_serv_panel.present?
            extra_services_btn.click
          end
        end
      end

      module AdvOptReferenceNumber
        def reference_number
          (cache[:reference_number].nil?||!cache[:reference_number].present?)?cache[:reference_number]=StampsTextbox.new(
              browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(6)>div>div>div>div>div>div>input")):cache[:reference_number]
        end
      end

      module AdvOptCostCode
        def cost_code
          (cache[:cost_code].nil?||!cache[:cost_code].present?)?cache[:cost_code]=StampsCombobox.new(
              browser.text_fields(css: "input[id^=costcodesdroplist-][id$=-inputEl]"),
              browser.divs(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]"),
              :li,
              0):cache[:cost_code]
        end
      end

      module AdvOptMailDate
        def mail_date
          @mail_date=MailDate.new(param) if @mail_date.nil?
          @mail_date
        end
      end

      module AdvOptHideLabelValue
        def hide_label_value
          if @hide_label_value.nil?
            input=browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(1)>div>div>span")
            verify=browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(1)")
            @hide_label_value=Stamps::Browser::StampsCheckbox.new(input, verify, "class", "checked")
          end
          @hide_label_value
        end
      end

      module AdvOptPrintReferenceNumber
        def print_reference_number
          if @print_reference_number.nil?
            input=browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(3)>div>div>span")
            verify=browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(3)")
            @print_reference_number=Stamps::Browser::StampsCheckbox.new(input, verify, "class", "checked")
          end
          @print_reference_number
        end
      end

      module AdvOptPrintReceipt
        def print_receipt
          if @print_receipt.nil?
            input=browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(2)>div>div>span")
            verify=browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div[class*=fieldcontainer]>div>div>div>div>div:nth-child(2)")
            @print_receipt=Stamps::Browser::StampsCheckbox.new(input, verify, "class", "checked")
          end
          @print_receipt
        end
      end

      module AdvOptToggle
        def show
          @show_field=StampsField.new(browser.span(text: "Show Advanced Options")) if @show_field.nil?
          @hide_field=StampsField.new(browser.span(text: "Hide Advanced Options")) if @hide_field.nil?
          15.times do
            @show_field.click
            break if @hide_field.present?
          end
          expect(@hide_field).to be_present
        end

        def hide
          @show_field=StampsField.new(browser.span(text: "Show Advanced Options")) if @show_field.nil?
          @hide_field=StampsField.new(browser.span(text: "Hide Advanced Options")) if @hide_field.nil?
          15.times do
            @hide_field.click
            break if @show_field.present?
          end
          expect(@show_field).to be_present
          self
        end
      end

      module StampsAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && reference_number.present?
        end

        def calculate_postage_amount
          if @calculate_postage_amount.nil?
            radio=browser.span(id: 'sdc-mainpanel-calculatepostageradio-displayEl')
            verify_field=browser.div(id: 'sdc-mainpanel-calculatepostageradio')
            #radio, check_verify, attribute, attribute_value
            @calculate_postage_amount=StampsRadio.new(radio, verify_field, "class", "checked")
          end
          @calculate_postage_amount
        end

        def specify_postage_amount
          if @specify_postage_amount.nil?
            field=browser.span(id: 'sdc-mainpanel-specifypostageradio-displayEl')
            verify_field=browser.div(id: 'sdc-mainpanel-specifypostageradio')
            @specify_postage_amount=StampsRadio.new(field, verify_field, "class", "checked")
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
            input=browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(2)>div>div>span")
            verify=browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(2)")
            @return_address=Stamps::Browser::StampsCheckbox.new(input, verify, "class", "checked")
          end
          @return_address
        end

        def delivery_address
          if @delivery_address.nil?
            input=browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(3)>div>div>span")
            verify=browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(3)")
            @delivery_address=Stamps::Browser::StampsCheckbox.new(input, verify, "class", "checked")
          end
          @delivery_address
        end

        def postage
          if @postage.nil?
            input=browser.span(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(4)>div>div>span")
            verify=browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(5)>div>div>div:nth-child(4)")
            @postage=Stamps::Browser::StampsCheckbox.new(input, verify, "class", "checked")
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
            clickable_field=browser.span(css: "span[class*=sdc-mainpanel-rdcheckbox]")
            verify=clickable_field.parent.parent.parent
            @restricted_delivery=Stamps::Browser::StampsCheckbox.new(clickable_field, verify, "class", "checked")
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