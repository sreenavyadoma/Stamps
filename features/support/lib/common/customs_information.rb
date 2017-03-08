module Stamps
  module Common
    module Customs

      module MoreInfo
        def present?
          more_info.present?
        end

        def more_info
          @more_info = StampsTextbox.new(browser.text_field(name: "CustomsComments")) if @more_info.nil? || !@more_info.present?
          expect(@more_info.present?).to be(true)
          @more_info
        end
      end

      module LicenseCertificateInvoice
        def present?
          (license.present? && certificate.present? && invoice.present?)
        end

        def license
          @license = StampsTextbox.new(browser.text_field(name: "CustomsLicenseNumber")) if @license.nil? || !@license.present?
          expect(@license.present?).to be(true)
          @license
        end

        def certificate
          @certificate = StampsTextbox.new(browser.text_field(name: "CustomsCertificateNumber")) if @certificate.nil? || !@certificate.present?
          expect(@license.present?).to be(true)
          @certificate
        end

        def invoice
          @invoice = StampsTextbox.new(browser.text_field(name: "CustomsInvoiceNumber")) if @invoice.nil? || !@invoice.present?
          expect(@invoice.present?).to be(true)
          @invoice
        end
      end

      class PackageContentsDetails < Browser::StampsBrowserElement
      end

      class CustomsMadeIn < Browser::StampsBrowserElement
        attr_reader :text_box, :drop_down, :index

        def initialize(param, text_box, drop_down, index)
          super(param)
          @text_box = StampsTextbox.new(text_box)
          @drop_down = StampsElement.new(drop_down)
          @index = index
        end

        def text
          text_box.text
        end

        def select(selection)
          logger.info "Made In #{selection}"
          drop_down.safe_click
          selection_element = StampsElement.new(browser.lis(text: selection)[((param.web_app == :mail)?index+1:index)])
          10.times do
            drop_down.safe_click unless selection_element.present?
            selection_element.safe_click
            break if text.include?(selection)
          end
          expect(text).to include(selection)
          logger.info "Made In #{selection} selected."
        end
      end

      class AssociatedCustomsLineItem < Browser::StampsBrowserElement
        attr_reader :delete, :customs_item_description, :customs_item_qty, :customs_item_unit_price, :made_in, :customs_item_hs_tariff, :index

        def initialize(param, index)
          super(param)
          @index = index - 1
          @delete = StampsElement.new(browser.spans(css: "div[id*=customswindow] span[class*=sdc-icon-remove]")[@index])
          @customs_item_description = StampsTextbox.new(browser.text_fields(css: "div[class*=customs-description]>div>div>div>input[name=Description]")[@index])

          text_box = browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>div>input[name=Quantity]")[@index]
          inc_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[class*=up]")[@index]
          dec_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[class*=down]")[@index]
          @customs_item_qty = StampsNumberField.new(param, text_box, inc_btn, dec_btn, 'Single Customs Item Quantity')

          text_box = browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>input[name=Value]")[@index]
          inc_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>div[class*=up]")[@index]
          dec_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>div[class*=down]")[@index]
          @customs_item_unit_price = StampsNumberField.new(param, text_box, inc_btn, dec_btn, 'Single Customs Item Quantity')

          text_box = browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>input[name=OriginCountryCode]")[@index]
          drop_down = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[id$=picker]")[@index]
          @made_in = CustomsMadeIn.new(param, text_box, drop_down, @index+1)

          @customs_item_hs_tariff = StampsTextbox.new(browser.text_fields(name: "TariffNo")[@index])
        end

        def present?
          customs_item_description.present?
        end
      end

      class AssociatedCustomsItems < Browser::StampsBrowserElement
        attr_reader :add_btn

        def initialize(param)
          super(param)
          @add_btn = StampsElement.new(browser.span(css: "div[id^=associatedcustomsitems]>div[id^=toolbar]>div>div>a>span>span>span[class*=sdc-icon-add]"))
        end

        def present?
          add_btn.present?
        end

        def size
          browser.tables(css: "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
        end

        def item_number(number)
          customs_item = AssociatedCustomsLineItem.new(param, number)
          5.times do
            return customs_item if customs_item.present?
            sleep(0.10)
            add_btn.safe_click if number > size
          end
          customs_item
        end
      end

      class UspsPrivactActStatementModal < Browser::StampsBrowserElement
        attr_reader :window_title, :okay

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.div(text: "USPS Privacy Act Statement")
          @okay = browser.span(text: "OK")
        end

        def present?
          window_title.present?
        end
      end

      class CustInfoPackageContents < Browser::StampsBrowserElement
        attr_accessor :combo_box, :contents

        def initialize(param)
          super(param)
          text_boxes = browser.text_fields(name: "CustomsContents")
          drop_downs = browser.divs(id: "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker")
          @combo_box = StampsComboBox.new(param, text_boxes, drop_downs, :li, 0)
          @contents = PackageContentsDetails.new(param).extend(MoreInfo)
        end

        def select(str)
          combo_box.select(str)
          @contents = (str == 'Commercial Sample')?PackageContentsDetails.new(param).extend(LicenseCertificateInvoice):PackageContentsDetails.new(param).extend(MoreInfo)
        end
      end

      class CustInfoInternalTransaction < Browser::StampsBrowserElement
        attr_accessor :combo_box, :itn_number

        def initialize(param)
          super(param)
          text_boxes = browser.text_fields(name: "IsITNRequired")
          drop_downs =  browser.divs(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
          @combo_box = StampsComboBox.new(param, text_boxes, drop_downs, :li, 0)
          @itn_number = StampsTextbox.new(browser.text_field(name: "AES"))
        end

        def select(str)
          combo_box.select(str)
        end
      end

      class CustomsInformation < Browser::StampsBrowserElement

        attr_reader :window_title, :associated_items, :usps_privacy_act_warning, :close_button, :package_contents, :non_delivery_options, :internal_transaction,
                    :more_info, :itn_number, :license, :invoice, :total_value_element, :i_agree, :privacy_statement, :privacy_link,
                    :restrictions_link, :restrictions_prohibitions_link, :x_button, :total_label, :certificate

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.div(text: "Customs Information")

          @associated_items = AssociatedCustomsItems.new(param)
          @package_contents = CustInfoPackageContents.new(param)

          text_boxes = browser.text_fields(name: "NonDelivery")
          drop_downs = browser.divs(id: "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker")
          @non_delivery_options = StampsComboBox.new(param, text_boxes, drop_downs, :li, 0)

          text_boxes = browser.text_fields(id: "sdc-customsFormWindow-internaltransactiondroplist-inputEl")
          drop_downs = browser.divs(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
          @internal_transaction = StampsComboBox.new(param, text_boxes, drop_downs, :li, 0)

          @more_info = StampsTextbox.new browser.text_field name: "CustomsComments"
          @usps_privacy_act_warning = StampsElement.new(browser.label text: "You must agree to the USPS Privacy Act Statement")
          @itn_number = StampsTextbox.new browser.text_field(name: "AES")
          @license = StampsTextbox.new browser.text_field(name: "CustomsLicenseNumber")
          @certificate = StampsTextbox.new browser.text_field(name: "CustomsCertificateNumber")
          @invoice = StampsTextbox.new browser.text_field(name: "CustomsInvoiceNumber")
          @total_value_element = StampsElement.new browser.div(css: "div[id^=customswindow-][id$=-body]>div>div[id^=panel]>div>div>div>div[id^=displayfield]>div>div")

          field = browser.input(css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div>div>div>input")
          verify_field = browser.div(css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div[id^=checkbox]")
          @i_agree = StampsCheckbox.new field, verify_field, "class", "checked"

          @privacy_statement = UspsPrivactActStatementModal.new(param)
          @privacy_link = StampsElement.new browser.span(text: "USPS Privacy Act Statement")
          @restrictions_prohibitions_link = StampsElement.new browser.span(text: "Restrictions and Prohibitions")

          @close_button = StampsElement.new browser.span(text: "Close")
          @x_button = StampsElement.new browser.image(css: "img[class*='x-tool-close']")
          @total_label = StampsElement.new browser.span(text: 'Total:')
        end

        def blur_out
          total_label.safe_click
          total_label.safe_double_click
        end

        def present?
          package_contents.present?
        end

        def wait_until_present(*args)
          window_title.safely_wait_until_present(*args)
        end

        def total_value
          ParameterHelper.remove_dollar_sign(total_value_element.text).to_f.round(2)
        end

        def usps_privacy_act_statement
          5.times{
            privacy_link.safe_click
            return privacy_statement if privacy_statement.present?
          }
        end

        def restrictions_and_prohibitions
          5.times{
            restrictions_prohibitions_link.safe_click
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