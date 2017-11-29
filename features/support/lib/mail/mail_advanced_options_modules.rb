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
          (cache[:mail_date].nil?||!cache[:mail_date].present?)?cache[:mail_date]=MailDate.new(param):cache[:mail_date]
        end
      end

      module AdvOptHideLabelValue
        def hide_label_value
          (cache[:hide_label_value].nil?||!cache[:hide_label_value].present?)?cache[:hide_label_value]=StampsCheckbox.new(
              browser.span(css: "[id^=printPreviewPanel-] div:nth-child(1)>div>div>span"),
              browser.div(text: "Hide Label Value"),
              "class",
              "checked"):cache[:hide_label_value]
        end
      end

      module AdvOptPrintReferenceNumber
        def print_reference_number
          (cache[:print_reference_number].nil?||!cache[:print_reference_number].present?)?cache[:print_reference_number]=StampsCheckbox.new(
              browser.span(css: "[id^=printPreviewPanel-] div:nth-child(3)>div>div>span"),
              browser.div(text: "Print Reference #"),
              "class",
              "checked"):cache[:print_reference_number]
        end
      end

      module AdvOptPrintReceipt
        def print_receipt
          (cache[:print_receipt].nil?||!cache[:print_receipt].present?)?cache[:print_receipt]=StampsCheckbox.new(
              browser.span(css: "[id^=printPreviewPanel-] div:nth-child(2)>div>div>span"),
              browser.div(text: "Print Receipt"),
              "class",
              "checked"):cache[:print_receipt]
        end
      end

      module AdvOptToggle
        def show_field
          (cache[:show_field].nil?||!cache[:show_field].present?)?cache[:show_field]=StampsField.new(browser.span(text: "Show Advanced Options")):cache[:show_field]
        end

        def hide_field
          (cache[:hide_field].nil?||!cache[:hide_field].present?)?cache[:hide_field]=StampsField.new(browser.span(text: "Hide Advanced Options")):cache[:hide_field]
        end

        def show
          15.times do
            show_field.click
            return true if hide_field.present?
          end
          false
        end

        def hide
          15.times do
            hide_field.click
            return true if show_field.present?
          end
          false
        end
      end

      module StampsAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && reference_number.present? && calculate_postage_amount.present? && specify_postage_amount.present?
        end

        def calculate_postage_amount
          (cache[:calculate_postage].nil?||!cache[:calculate_postage].present?)?cache[:calculate_postage]=StampsRadio.new(
              browser.span(id: 'sdc-mainpanel-calculatepostageradio-displayEl'),
              browser.div(id: 'sdc-mainpanel-calculatepostageradio'),
              "class",
              "checked"):cache[:calculate_postage]
        end

        def specify_postage_amount
          (cache[:specify_postage].nil?||!cache[:specify_postage].present?)?cache[:specify_postage]=StampsRadio.new(
              browser.span(id: 'sdc-mainpanel-specifypostageradio-displayEl'),
              browser.div(id: 'sdc-mainpanel-specifypostageradio'),
              "class",
              "checked"):cache[:specify_postage]
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
          cost_code.present? && reference_number.present? && mail_date.present?
        end
      end

      module EnvelopesAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && reference_number.present? && mail_date.present? && return_address.present? && delivery_address.present? && postage.present?
        end

        def return_address
          (cache[:return_address].nil?||!cache[:return_address].present?)?cache[:return_address]=StampsCheckbox.new(
              browser.span(css: "[id^=printPreviewPanel-][id$=-innerCt] div:nth-child(5)>div>div>div:nth-child(2)>div>div>span"),
              browser.div(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(2)"),
              "class",
              "checked"):cache[:return_address]
        end

        def delivery_address
          (cache[:delivery_address].nil?||!cache[:delivery_address].present?)?cache[:delivery_address]=StampsCheckbox.new(
              browser.span(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(3)>div>div>span"),
              browser.div(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(3)"),
              "class",
              "checked"):cache[:delivery_address]
        end

        def postage
          (cache[:postage].nil?||!cache[:postage].present?)?cache[:postage]=StampsCheckbox.new(
              browser.span(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(4)>div>div>span"),
              browser.div(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(4)"),
              "class",
              "checked"):cache[:postage]
        end
      end

      module CertifiedMailsAdvancedOptions
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && restricted_delivery.present?
        end

        def restricted_delivery
          (cache[:restricted_delivery].nil?||!cache[:restricted_delivery].present?)?cache[:restricted_delivery]=StampsCheckbox.new(
              browser.input(css: "input[class*=sdc-mainpanel-rdcheckbox]"),
              browser.div(css: "[id^=certifiedmailview-][id$=certifiedmailview-1148-outerCt] [id^=fieldcontainer-][id$=-innerCt] div:nth-child(4) [class*=x-form-type-checkbox]"),
              "class",
              "checked"):cache[:restricted_delivery]
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
          cost_code.present? && reference_number.present? && mail_date.present?
        end
      end

    end
  end
end