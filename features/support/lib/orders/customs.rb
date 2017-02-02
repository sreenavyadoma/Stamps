module Stamps
  module Orders
    module Customs
      class OrdersCustomsFields < Browser::Modal
        attr_reader :customs_form, :view_restrictions, :browser_restrictions_button, :edit_form_btn, :restrictions_btn

        def initialize(param)
          super(param)
          @customs_form = OrdersCustomsForm.new(param)
          @view_restrictions = Orders::Details::ViewRestrictions.new(param)
          @edit_form_btn = StampsElement.new browser.span text: 'Edit Form...'
          @restrictions_btn = StampsElement.new browser.span text: 'Restrictions...'
        end

        def edit_form
          10.times do
            return customs_form if customs_form.present?
            edit_form_btn.safe_click
            customs_form.wait_until_present 2
          end
          customs_form.present?.should be true
        end

        def restrictions
          5.times{
            return view_restrictions if view_restrictions.present?
            restrictions_btn.safe_click
          }
          view_restrictions.present?.should be true
        end
      end

      class StampsDropDownIndexed < Browser::Modal
        attr_reader :text_box, :drop_down, :name, :index

        def initialize(param, text_box, drop_down, index, name)
          super(param)
          @text_box = StampsTextbox.new(text_box)
          @drop_down = StampsElement.new(drop_down)
          @index = index
          @name = name
        end

        def text
          text_box.text
        end

        def select(selection)
          select_lis(selection)
        end

        def select_lis(selection)
          logger.info "#{name} #{selection}"
          drop_down.safe_click
          unless text.include?(selection)
            selection_element = StampsElement.new(browser.lis(text: selection)[index])
            10.times do
              drop_down.safe_click unless selection_element.present?
              selection_element.safe_click
              break if text.include?(selection)
            end
            text.should include selection
            logger.info "#{text} selected."
          end
        end
      end

      class SingleCustomsItem < Browser::Modal
        attr_reader :delete, :customs_item_description, :customs_item_qty, :customs_item_unit_price, :customs_item_origin, :customs_item_hs_tariff

        def initialize(param, index)
          super(param)
          @delete = StampsElement.new(browser.spans(css: "div[id*=customswindow] span[class*=sdc-icon-remove]")[index-1])
          @customs_item_description = StampsTextbox.new(browser.text_fields(css: "div[class*=customs-description]>div>div>div>input[name=Description]")[index-1])

          text_box = browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>div>input[name=Quantity]")[index-1]
          inc_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[class*=up]")[index-1]
          dec_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[class*=down]")[index-1]
          @customs_item_qty = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn, 'Single Customs Item Quantity')

          text_box = browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>input[name=Value]")[index-1]
          inc_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>div[class*=up]")[index-1]
          dec_btn = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div>div>div>div[class*=down]")[index-1]
          @customs_item_unit_price = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn, 'Single Customs Item Quantity')

          text_box = browser.text_fields(css: "div[id^=singlecustomsitem]>div>div>div>div>input[name=OriginCountryCode]")[index-1]
          drop_down = browser.divs(css: "div[id^=singlecustomsitem]>div>div>div>div>div[id$=picker]")[index-1]
          @customs_item_origin = StampsDropDownIndexed.new(param, text_box, drop_down, index-1, "Made In")

          @customs_item_hs_tariff = StampsTextbox.new(browser.text_fields(name: "TariffNo")[index-1])
        end

        def present?
          delete.present?
        end
      end

      class AssociatedCustomsItems < Browser::Modal
        attr_reader :items_cache, :add_btn

        def initialize(param)
          super(param)
          @items_cache = Hash.new
          @add_btn = StampsElement.new(browser.span(css: "div[id^=associatedcustomsitems]>div[id^=toolbar]>div>div>a>span>span>span[class*=sdc-icon-add]"))
        end

        def present?
          add_btn.present?
        end

        def size
          browser.tables(css: "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
        end

        def item(number)
          5.times do
            sleep(0.5)
            add_btn.safe_click if number > size
            sleep(0.5)
            items_cache[number] = SingleCustomsItem.new(param, number) unless items_cache.has_key?(number)
            return items_cache[number] if items_cache[number].present?
          end
          customs_item
        end
      end

      class UspsPrivactActStatementModal < Browser::Modal
        attr_reader :window_title, :okay

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.div text: "USPS Privacy Act Statement"
          @okay = browser.span(text: "OK")
        end

        def present?
          window_title.present?
        end
      end

      class RestrictionsAndProhibitionsModal < Browser::Modal

        def present?

        end

      end

      class InternalTransaction < Browser::Modal
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field name: "IsITNRequired"
          @drop_down = StampsElement.new browser.div(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
        end

        def select(selection)
          logger.info "Select Internal Transaction Number: #{selection}"
          selection_label = StampsElement.new browser.li(text: selection)
          10.times {
            begin
              break if text_box.text.include? selection
              drop_down.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
            rescue
              #ignore
            end
          }
          text_box.text.should include selection
          logger.info "#{selection} selected."
          selection_label
        end
      end

      class PackageContents < Browser::Modal
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field name: "CustomsContents"
          @drop_down = StampsElement.new browser.div id: "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
        end

        def select(selection)
          logger.info "Select Internal Transaction Number: #{selection}"
          selection_label = StampsElement.new browser.li(text: selection)
          10.times {
            begin
              break if text_box.text.include? selection
              drop_down.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
            rescue
              #ignore
            end
          }
          text_box.text.should include selection
          logger.info "#{selection} selected."
          selection_label
        end
      end

      class NonDeliveryOptions < Browser::Modal
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field name: "NonDelivery"
          @drop_down = StampsElement.new browser.div id: "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
        end

        def select(selection)
          logger.info "Select Internal Transaction Number: #{selection}"
          selection_label = StampsElement.new browser.li(text: selection)
          10.times {
            begin
              break if text_box.text.include? selection
              drop_down.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
            rescue
              #ignore
            end
          }
          text_box.text.should include selection
          logger.info "#{selection} selected."
          selection_label
        end
      end

      class OrdersCustomsForm < Browser::Modal

        attr_reader :window_title, :item_grid, :usps_privacy_act_warning, :close_button, :package_contents, :non_delivery_options, :internal_transaction,
                    :more_info, :itn_number, :license, :invoice, :total_value_element, :i_agree, :privacy_statement, :privacy_link,
                    :restrictions_link, :restrictions_prohibitions_link, :x_button, :total_label, :certificate

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.div(text: "Customs Information")
          @item_grid = AssociatedCustomsItems.new(param)
          @package_contents = PackageContents.new(param)
          @non_delivery_options = NonDeliveryOptions.new(param)
          @internal_transaction = InternalTransaction.new(param)

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
          @restrictions_link = RestrictionsAndProhibitionsModal.new(param)
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
          window_title.present?
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def total_value
          ParameterHelper.remove_dollar_sign total_value_element.text
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