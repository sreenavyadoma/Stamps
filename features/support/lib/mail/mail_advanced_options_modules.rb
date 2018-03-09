module Stamps
  module Mail
    module AdvancedOptions

      module AdvOptExtraServices
        def extra_services_btn
          if cache[:extra_services_btn].nil? || !cache[:extra_services_btn].present?
            # cache[:extra_services_btn] = StampsField.new(driver.span(id: "sdc-mainpanel-extraservicesbtn-btnInnerEl"))
            cache[:extra_services_btn] = StampsField.new(driver.span(id: "sdc-mainpanel-extraservicesbtn-btnWrap"))
            cache[:extra_services_btn].verify_field = driver.a(id: 'sdc-mainpanel-extraservicesbtn')
            cache[:extra_services_btn].ver_field_attr = 'class'
            cache[:extra_services_btn].ver_field_attr_value = 'disabled'
          end
          cache[:extra_services_btn]
        end

        def xtra_serv_panel
          if cache[:xtra_serv_panel].nil? || !cache[:xtra_serv_panel].present?
            cache[:xtra_serv_panel] = PrintFormPanel::MailExtraServices.new(param)
          end
          cache[:xtra_serv_panel]
        end

        def value_must_be_shown
          if cache[:value_must_be_shown_popup].nil? || !cache[:value_must_be_shown_popup].present?
            cache[:value_must_be_shown_popup] = PrintFormPanel::ValueMustBeShown.new(param)
          end
          cache[:value_must_be_shown_popup]
        end

        def special_contents_warning
          cache[:special_contents_warning_popup].nil? || !cache[:special_contents_warning_popup].present? ? cache[:special_contents_warning_popup] = PrintFormPanel::SpecialContentsWarning.new(param) : cache[:special_contents_warning_popup]
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
          if cache[:ref_num].nil? || !cache[:ref_num].present?
            cache[:ref_num] = StampsTextbox.new(driver.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(6)>div>div>div>div>div>div>input"))
          end
          cache[:ref_num]
        end
      end

      module AdvOptCostCode
        def cost_code
          if cache[:cost_code].nil? || !cache[:cost_code].present?
            cache[:cost_code] = StampsCombobox.new(driver.text_fields(css: "input[id^=costcodesdroplist-][id$=-inputEl]"),
                                                   driver.divs(css: "div[id^=costcodesdroplist-][id$=trigger-picker]"),
                                                   :li,0)
          end
          cache[:cost_code]
        end
      end

      module AdvOptMailDate
        def mail_date
          if cache[:mail_date].nil? || !cache[:mail_date].present?
            cache[:mail_date] = MailDate.new(param)
          end
          cache[:mail_date]
        end
      end

      module AdvOptHideLabelValue
        def hide_label_value
          if cache[:hide_label_value].nil? || !cache[:hide_label_value].present?
            cache[:hide_label_value] = StampsCheckbox.new(driver.span(css: "[id^=printPreviewPanel-] div:nth-child(1)>div>div>span"),
                                                          driver.div(text: "Hide Label Value"),
                                                          "class", "checked")
          end
          cache[:hide_label_value]
        end
      end

      module AdvOptPrintReferenceNumber
        def print_reference_number
          if cache[:print_reference_number].nil? || !cache[:print_reference_number].present?
            cache[:print_reference_number] = StampsCheckbox.new(driver.span(css: "[id^=printPreviewPanel-] div:nth-child(3)>div>div>span"),
                                                                driver.div(text: "Print Reference #"),
                                                                "class", "checked")
          end
          cache[:print_reference_number]
        end
      end

      module AdvOptPrintReceipt
        def print_receipt
          if cache[:print_receipt].nil? || !cache[:print_receipt].present?
            cache[:print_receipt] = StampsCheckbox.new(driver.span(css: "[id^=printPreviewPanel-] div:nth-child(2)>div>div>span"),
                                                       driver.div(text: "Print Receipt"),
                                                       "class", "checked")
          end
          cache[:print_receipt]
        end
      end

      module AdvOptToggle
        def show_field
          if cache[:show_field].nil? || !cache[:show_field].present?
            cache[:show_field] = StampsField.new(driver.span(text: "Show Advanced Options"))
          end
          cache[:show_field]
        end

        def hide_field
          if cache[:hide_field].nil? || !cache[:hide_field].present?
            cache[:hide_field] = StampsField.new(driver.span(text: "Hide Advanced Options"))
          end
          cache[:hide_field]
        end

        def show
          15.times do
            show_field.click
            break if hide_field.present?
          end
          hide_field.present?
        end

        def hide
          15.times do
            hide_field.click
            break if show_field.present?
          end
          show_field.present?
        end
      end

      module Stamps
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && reference_number.present? && calculate_postage_amount.present? && specify_postage_amount.present?
        end

        def calculate_postage_amount
          if cache[:calculate_postage].nil? || !cache[:calculate_postage].present?
            cache[:calculate_postage] = StampsRadio.new(driver.span(id: 'sdc-mainpanel-calculatepostageradio-displayEl'),
                                                        driver.div(id: 'sdc-mainpanel-calculatepostageradio'),
                                                        "class", "checked")
          end
          cache[:calculate_postage]
        end

        def specify_postage_amount
          if cache[:specify_postage].nil? || !cache[:specify_postage].present?
            cache[:specify_postage] = StampsRadio.new(driver.span(id: 'sdc-mainpanel-specifypostageradio-displayEl'),
                                                      driver.div(id: 'sdc-mainpanel-specifypostageradio'),
                                                      "class", "checked")
          end
          cache[:specify_postage]
        end

      end

      module Labels
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

      module Envelopes
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && reference_number.present? && mail_date.present? && return_address.present? && delivery_address.present? && postage.present?
        end

        def return_address
          if cache[:return_address].nil? || !cache[:return_address].present?
            cache[:return_address] = StampsCheckbox.new(driver.span(css: "[id^=printPreviewPanel-][id$=-innerCt] div:nth-child(5)>div>div>div:nth-child(2)>div>div>span"),
                                                        driver.div(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(2)"),
                                                        "class", "checked")
          end
          cache[:return_address]
        end

        def delivery_address
          if cache[:delivery_address].nil? || !cache[:delivery_address].present?
            cache[:delivery_address] = StampsCheckbox.new(driver.span(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(3)>div>div>span"),
                                                          driver.div(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(3)"),
                                                          "class", "checked")
          end
          cache[:delivery_address]
        end

        def postage
          if cache[:postage].nil? || !cache[:postage].present?
            cache[:postage] = StampsCheckbox.new(driver.span(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(4)>div>div>span"),
                                                 driver.div(css: "[id^=printPreviewPanel-] div:nth-child(5)>div>div>div:nth-child(4)"),
                                                 "class", "checked")
          end
          cache[:postage]
        end
      end

      module CertifiedMails
        include AdvOptToggle
        include AdvOptExtraServices
        include AdvOptMailDate
        include AdvOptReferenceNumber
        include AdvOptCostCode

        def present?
          cost_code.present? && restricted_delivery.present?
        end

        def restricted_delivery
          if cache[:restricted_delivery].nil? || !cache[:restricted_delivery].present?
            cache[:restricted_delivery] = StampsCheckbox.new(driver.span(css: "span[class*=sdc-mainpanel-rdcheckbox]"),
                                                             driver.div(css: "[id^=certifiedmailview-] div:nth-child(4) [class*=x-form-type-checkbox]"),
                                                             "class","checked")
          end
          cache[:restricted_delivery]
        end
      end

      module Rolls
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
