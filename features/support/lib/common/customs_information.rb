module Stamps
  module Common
    module Modals
      def customs_form
        cache[:customs_form] = Stamps::Common::Customs::CustomsInformation.new(param) if cache[:customs_form].nil?
        cache[:customs_form]
      end
    end

    module Customs

      module MoreInfo
        def present?
          more_info.present?
        end

        def more_info
          @more_info = StampsTextbox.new(browser.text_field(name: "CustomsComments")) if @more_info.nil? || !@more_info.present?
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
          @license = StampsTextbox.new(browser.text_field(name: "CustomsLicenseNumber")) if @license.nil? || !@license.present?
          expect(@license).to be_present
          @license
        end

        def certificate
          @certificate = StampsTextbox.new(browser.text_field(name: "CustomsCertificateNumber")) if @certificate.nil? || !@certificate.present?
          expect(@license).to be_present
          @certificate
        end

        def invoice
          @invoice = StampsTextbox.new(browser.text_field(name: "CustomsInvoiceNumber")) if @invoice.nil? || !@invoice.present?
          expect(@invoice).to be_present
          @invoice
        end
      end

      class PackageContentsDetails < Browser::Base
      end

      ##
      #
      class MadeIn < Browser::Base
        attr_reader :index

        def initialize(param, index)
          super(param)
          @index = index
        end

        def textbox
          if cache["textbox#{index}".to_sym].nil? || !cache["textbox#{index}".to_sym].present?
            cache["textbox#{index}".to_sym] = StampsTextbox.new(browser.text_fields(css: "[id^=singlecustomsitem] [name*=Country]")[index])
          end
          cache["textbox#{index}".to_sym]
        end

        def dropdown
          if cache["dropdown#{index}".to_sym].nil? || !cache["dropdown#{index}".to_sym].present?
            cache["dropdown#{index}".to_sym] = StampsField.new(browser.divs(css: "[id^=singlecustomsitem] [id$=picker]")[index])
          end
          cache["dropdown#{index}".to_sym]
        end

        def select(str)
          dropdown.scroll_into_view
          dropdown.click
          selection = StampsField.new(browser.lis(text: str)[@lov_index.nil? ? @lov_index = browser.lis(text: "United States").size - 1 : @lov_index])
          dropdown.click
          10.times do
            break if textbox.text.include?(str)
            dropdown.click unless selection.present?
            selection.scroll_into_view.click
          end
          textbox.text
        end
      end

      ##
      # first index is 1 from feature file.
      class AssociatedLineItem < Browser::BaseCache
        assign({})
        attr_reader :index
        def initialize(param, index)
          super(param)
          @index = index - 1
        end

        def delete
          if cache["delete#{index}".to_sym].nil? || !cache["delete#{index}".to_sym].present?
            cache["delete#{index}".to_sym] = StampsField.new(browser.spans(css: "[id*=customswindow] [class*=sdc-icon-remove]")[index])
          end
          cache["delete#{index}".to_sym].scroll_into_view
          cache["delete#{index}".to_sym]
        end

        def item_description
          if cache["item_description#{index}".to_sym].nil? || !cache["item_description#{index}".to_sym].present?
            cache["item_description#{index}".to_sym] = StampsTextbox.new(browser.text_fields(css: "[class*=customs-description] [name=Description]")[index])
          end
          cache["item_description#{index}".to_sym].scroll_into_view
          cache["item_description#{index}".to_sym]
        end

        def hs_tariff
          if cache["tariff#{index}".to_sym].nil? || !cache["tariff#{index}".to_sym].present?
            cache["tariff#{index}".to_sym] = StampsTextbox.new(browser.text_fields(css: "[name=TariffNo]")[index])
          end
          cache["tariff#{index}".to_sym].scroll_into_view
          cache["tariff#{index}".to_sym]
        end

        def made_in
          if cache["made_in#{index}".to_sym].nil?
            cache["made_in#{index}".to_sym] = MadeIn.new(param, index)
          end
          cache["made_in#{index}".to_sym].textbox.scroll_into_view
          cache["made_in#{index}".to_sym]
        end

        def item_qty
          if cache["item_qty#{index}".to_sym].nil? || !cache["item_qty#{index}".to_sym].present?
            cache["item_qty#{index}".to_sym] = StampsNumberField.new(
                browser.text_fields(css: "[id^=singlecustomsitem] [name=Quantity]")[index],
                browser.divs(css: "[id^=singlecustomsitem]>[id^=numberfield] [class*=up]")[index],
                browser.divs(css: "[id^=singlecustomsitem]>[id^=numberfield] [class*=down]")[index])
          end
          cache["item_qty#{index}".to_sym].scroll_into_view
          cache["item_qty#{index}".to_sym]
        end

        def unit_price
          if cache["unit_price#{index}".to_sym].nil? || !cache["unit_price#{index}".to_sym].present?
            cache["unit_price#{index}".to_sym] = StampsNumberField.new(
                browser.text_fields(css: "[id^=singlecustomsitem] [name=Value]")[index],
                browser.divs(css: "[id^=singlecustomsitem]>[id^=container] [class*=up]")[index],
                browser.divs(css: "[id^=singlecustomsitem]>[id^=container] [class*=down]")[index])
          end
          cache["unit_price#{index}".to_sym].scroll_into_view
          cache["unit_price#{index}".to_sym]
        end

        def present?
          item_description.present?
        end
      end

      class AssociatedItems < Browser::BaseCache
        assign({})
        def add_item
          if cache[:add_item].nil? || !cache[:add_item].present?
            cache[:add_item] = StampsField.new(browser.span(css: "[id^=associatedcustomsitems] [class*=toolbar] [class*=sdc-icon-add]"))
          end
          cache[:add_item]
        end

        def present?
          add_item.present?
        end

        def size
          browser.tables(css: "[id^=singlecustomsitem][id$=innerCt]").size
        end

        def item_number(number)
          cache["item_number#{number}".to_sym] = AssociatedLineItem.new(param, number) if cache["item_number#{number}".to_sym].nil?
          5.times do
            if cache["item_number#{number}".to_sym].present?
              cache["item_number#{number}".to_sym].item_description.scroll_into_view
              return cache["item_number#{number}".to_sym]
            end

            if number > size
              add_item.click
              sleep(0.2)
              # expose Made In country list of values on item add
              cache["item_number#{number}".to_sym].made_in.dropdown.click
              sleep(0.05)
              cache["item_number#{number}".to_sym].made_in.dropdown.click
            end
          end
          nil
        end
      end

      class UspsPrivactActStatementModal < Browser::Base
        attr_reader :window_title, :okay

        def initialize(param)
          super
          @window_title = StampsField.new(browser.div(text: "USPS Privacy Act Statement"))
          @okay = browser.span(text: "OK")
        end

        def present?
          window_title.present?
        end
      end

      class PackageContents < Browser::Base
        attr_accessor :combobox, :contents

        def initialize(param)
          super
          textboxes = browser.text_fields(name: "CustomsContents")
          dropdowns = browser.divs(id: "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker")
          @combobox = StampsCombobox.new(textboxes, dropdowns, :li, 0)
          @contents = PackageContentsDetails.new(param).extend(MoreInfo)
        end

        def select(str)
          combobox.textbox.wait_until_present(3)
          combobox.select(str)
          @contents = (str == 'Commercial Sample') ? PackageContentsDetails.new(param).extend(LicenseCertificateInvoice) : PackageContentsDetails.new(param).extend(MoreInfo)
        end
      end

      class CustInfoInternalTransaction < Browser::Base #todo-Rob-Customs no usage for this class
        attr_accessor :combobox, :itn_number

        def initialize(param)
          super
          @combobox = StampsCombobox.new(browser.text_fields(name: "IsITNRequired"), browser.divs(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker"), :li, 0)
          @itn_number = StampsTextbox.new(browser.text_field(name: "AES"))
        end

        def select(str)
          combobox.select(str)
        end
      end

      class CustomsInformation < Browser::BaseCache
        assign({})

        attr_reader :window_title, :usps_privacy_act_warning, :close_button, :internal_transaction,
                    :more_info, :itn_number, :license, :invoice, :privacy_statement, :privacy_link,
                    :restrictions_link, :restrictions_prohibitions_link, :x_button, :total_label, :certificate

        def initialize(param)
          super
          @window_title = StampsField.new browser.div(text: "Customs Information")



          textboxes = browser.text_fields(id: "sdc-customsFormWindow-internaltransactiondroplist-inputEl")
          dropdowns = browser.divs(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
          @internal_transaction = StampsCombobox.new(textboxes, dropdowns, :li, 0)

          @more_info = StampsTextbox.new browser.text_field name: "CustomsComments"
          @usps_privacy_act_warning = StampsField.new(browser.label text: "You must agree to the USPS Privacy Act Statement")
          @itn_number = StampsTextbox.new browser.text_field(name: "AES")
          @license = StampsTextbox.new browser.text_field(name: "CustomsLicenseNumber")
          @certificate = StampsTextbox.new browser.text_field(name: "CustomsCertificateNumber")
          @invoice = StampsTextbox.new browser.text_field(name: "CustomsInvoiceNumber")

          @privacy_statement = UspsPrivactActStatementModal.new(param)
          @privacy_link = StampsField.new(browser.span(text: "USPS Privacy Act Statement"))
          @restrictions_prohibitions_link = StampsField.new(browser.span(text: "Restrictions and Prohibitions"))

          @close_button = StampsField.new(browser.span(text: "Close"))
          @x_button = StampsField.new(browser.image(css: "img[class*='x-tool-close']"))
          @total_label = StampsField.new(browser.span(text: 'Total:'))
        end

        def non_delivery_options
          cache[:add_btn] = StampsField.new(browser.span(css: "[id^=associatedcustomsitems] [class*=toolbar] a")) if cache[:add_btn].nil? || !cache[:add_btn].present?
          cache[:add_btn]

          @non_delivery_options = StampsCombobox.new(browser.text_field(css: "[name=NonDelivery]"), browser.div(css: "[id*=nondeliveryoptionsdroplist]"), :li, 0)

        end

        def package_contents
          cache[:package_contents] = PackageContents.new(param) if cache[:package_contents].nil?
          cache[:package_contents]
        end

        def associated_items
          cache[:associated_items] = AssociatedItems.new(param) if cache[:associated_items].nil?
          cache[:associated_items]
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
          StampsCheckbox.new(
              browser.input(css: "[id^=customswindow] [class*=bottom] input"),
              browser.div(css: "[id^=customswindow][class*=resizable] [class*=bottom] [id^=checkbox][class*=x-form-item-no-label]"),
              "class", "checked")
        end

        def total_cost
          StampsField.new(browser.div(css: '[id^=customswindow][componentid^=customswindow] [class*=x-panel-default-docked-bottom] [class*=sdc-displayfield-overflow]'))
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