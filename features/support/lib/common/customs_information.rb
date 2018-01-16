module Stamps
  module Common
    module Customs

      module MoreInfo
        def present?
          more_info.present?
        end

        def more_info
          @more_info=StampsTextbox.new(browser.text_field(name: "CustomsComments")) if @more_info.nil?||!@more_info.present?
          expect(@more_info).to be_present
          expect(@more_info).to be_present
          @more_info
        end
      end

      module LicenseCertificateInvoice
        def present?
          (license.present? && certificate.present? && invoice.present?)
        end

        def license
          @license=StampsTextbox.new(browser.text_field(name: "CustomsLicenseNumber")) if @license.nil?||!@license.present?
          expect(@license).to be_present
          @license
        end

        def certificate
          @certificate=StampsTextbox.new(browser.text_field(name: "CustomsCertificateNumber")) if @certificate.nil?||!@certificate.present?
          expect(@license).to be_present
          @certificate
        end

        def invoice
          @invoice=StampsTextbox.new(browser.text_field(name: "CustomsInvoiceNumber")) if @invoice.nil?||!@invoice.present?
          expect(@invoice).to be_present
          @invoice
        end
      end

      class PackageContentsDetails < Browser::Base
      end

      class CustomsMadeIn < Browser::Base
        attr_reader :textbox, :dropdown, :index

        def initialize(param, textbox, dropdown, index)
          super(param)
          @textbox=StampsTextbox.new(textbox)
          @dropdown=StampsField.new(dropdown)
          @index=index
        end

        def text
          textbox.text
        end

        def select(selection)
          logger.info "Made In #{selection}"
          dropdown.click
          selection_field=StampsField.new(browser.lis(text: selection)[index])
          10.times do
            dropdown.click unless selection_field.present?
            selection_field.click
            break if text.include?(selection)
          end
          expect(text).to include(selection)
          logger.info "Made In #{selection} selected."
        end
      end

      class AssociatedCustomsLineItem < Browser::Base
        attr_reader :delete, :customs_item_description, :customs_item_qty, :customs_item_unit_price, :made_in, :customs_item_hs_tariff, :index

        def initialize(param, index)
          super(param)
          @index=index - 1
          @delete=StampsField.new(browser.spans(css: "div[id*=customswindow] span[class*=sdc-icon-remove]")[@index])
          @customs_item_description=StampsTextbox.new(browser.text_fields(css: "div[class*=customs-description]>div>div>div>input[name=Description]")[@index])

          textbox=browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>div>input[name=Quantity]")[@index]
          inc_btn=browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[class*=up]")[@index]
          dec_btn=browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[class*=down]")[@index]
          @customs_item_qty=StampsNumberField.new(textbox, inc_btn, dec_btn)

          textbox=browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>input[name=Value]")[@index]
          inc_btn=browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>div[class*=up]")[@index]
          dec_btn=browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>div[class*=down]")[@index]
          @customs_item_unit_price=StampsNumberField.new(textbox, inc_btn, dec_btn)

          textbox=browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>input[name=OriginCountryCode]")[@index]
          dropdown=browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[id$=picker]")[@index]
          @made_in=CustomsMadeIn.new(param, textbox, dropdown, @index+1)

          @customs_item_hs_tariff=StampsTextbox.new(browser.text_fields(name: "TariffNo")[@index])
        end

        def present?
          customs_item_description.present?
        end
      end

      class AssociatedCustomsItems < Browser::Base
        attr_reader :add_btn

        def initialize(param)
          super
          @add_btn=StampsField.new(browser.span(css: "div[id^=associatedcustomsitems]>div[id^=toolbar]>div>div>a>span>span>span[class*=sdc-icon-add]"))
        end

        def present?
          add_btn.present?
        end

        def size
          browser.tables(css: "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
        end

        def item_number(number)
          customs_item=AssociatedCustomsLineItem.new(param, number)
          5.times do
            return customs_item if customs_item.present?
            sleep(0.10)
            add_btn.click if number > size
          end
          customs_item
        end
      end

      class UspsPrivactActStatementModal < Browser::Base
        attr_reader :window_title, :okay

        def initialize(param)
          super
          @window_title=StampsField.new browser.div(text: "USPS Privacy Act Statement")
          @okay=browser.span(text: "OK")
        end

        def present?
          window_title.present?
        end
      end

      class CustInfoPackageContents < Browser::Base
        attr_accessor :combobox, :contents

        def initialize(param)
          super
          textboxes=browser.text_fields(name: "CustomsContents")
          dropdowns=browser.divs(id: "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker")
          @combobox=StampsCombobox.new(textboxes, dropdowns, :li, 0)
          @contents=PackageContentsDetails.new(param).extend(MoreInfo)
        end

        def select(str)
          combobox.textbox.wait_until_present(3)
          combobox.select(str)
          @contents=(str=='Commercial Sample')?PackageContentsDetails.new(param).extend(LicenseCertificateInvoice):PackageContentsDetails.new(param).extend(MoreInfo)
        end
      end

      class CustInfoInternalTransaction < Browser::Base
        attr_accessor :combobox, :itn_number

        def initialize(param)
          super
          textboxes=browser.text_fields(name: "IsITNRequired")
          dropdowns =  browser.divs(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
          @combobox=StampsCombobox.new(textboxes, dropdowns, :li, 0)
          @itn_number=StampsTextbox.new(browser.text_field(name: "AES"))
        end

        def select(str)
          combobox.select(str)
        end
      end

      class CustomsInformation < Browser::Base

        attr_reader :window_title, :associated_items, :usps_privacy_act_warning, :close_button, :package_contents, :non_delivery_options, :internal_transaction,
                    :more_info, :itn_number, :license, :invoice, :total_value_field, :privacy_statement, :privacy_link,
                    :restrictions_link, :restrictions_prohibitions_link, :x_button, :total_label, :certificate

        def initialize(param)
          super
          @window_title=StampsField.new browser.div(text: "Customs Information")

          @associated_items=AssociatedCustomsItems.new(param)
          @package_contents=CustInfoPackageContents.new(param)

          textboxes=browser.text_fields(name: "NonDelivery")
          dropdowns=browser.divs(id: "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker")
          @non_delivery_options=StampsCombobox.new(textboxes, dropdowns, :li, 0)

          textboxes=browser.text_fields(id: "sdc-customsFormWindow-internaltransactiondroplist-inputEl")
          dropdowns=browser.divs(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
          @internal_transaction=StampsCombobox.new(textboxes, dropdowns, :li, 0)

          @more_info=StampsTextbox.new browser.text_field name: "CustomsComments"
          @usps_privacy_act_warning=StampsField.new(browser.label text: "You must agree to the USPS Privacy Act Statement")
          @itn_number=StampsTextbox.new browser.text_field(name: "AES")
          @license=StampsTextbox.new browser.text_field(name: "CustomsLicenseNumber")
          @certificate=StampsTextbox.new browser.text_field(name: "CustomsCertificateNumber")
          @invoice=StampsTextbox.new browser.text_field(name: "CustomsInvoiceNumber")
          @total_value_field=StampsField.new browser.div(css: "div[id^=customswindow-][id$=-body]>div>div[id^=panel]>div>div>div>div[id^=displayfield]>div>div")

          @privacy_statement=UspsPrivactActStatementModal.new(param)
          @privacy_link=StampsField.new browser.span(text: "USPS Privacy Act Statement")
          @restrictions_prohibitions_link=StampsField.new browser.span(text: "Restrictions and Prohibitions")

          @close_button=StampsField.new browser.span(text: "Close")
          @x_button=StampsField.new browser.image(css: "img[class*='x-tool-close']")
          @total_label=StampsField.new browser.span(text: 'Total:')
        end

        def blur_out
          total_label.click
          total_label.double_click
        end

        def present?
          package_contents.combobox.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def agree_to_terms
          field=browser.input(css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div>div>div>input")
          verify_field=browser.div(css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div[id^=checkbox]")
          StampsCheckbox.new(field, verify_field, "class", "checked")
        end

        def total_value
          total_value_field.text.dollar_amount_str.to_f.round(2)
        end

        def usps_privacy_act_statement
          5.times{
            privacy_link.click
            return privacy_statement if privacy_statement.present?
          }
        end

        def restrictions_and_prohibitions
          5.times{
            restrictions_prohibitions_link.click
            return restrictions_link if restrictions_link.present?
          }
        end

        def close
          close_button.click_while_present
          close_button.click_while_present
          present?
        end

        def cancel
          x_button.click_while_present
          present?
        end
      end

    end
  end
end