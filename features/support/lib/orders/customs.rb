module Stamps
  module Orders
    module Customs
      class OrdersMadeInCountry < Browser::Modal
        attr_reader :text_box

        def initialize(param, index)
          super(param)
          @index = index
          @text_box = TextboxElement.new ((browser.text_fields name: "OriginCountryCode")[@index-1])
        end

        def select(country)
          logger.info "Select Country #{country}"
          drop_down = BrowserElement.new text_box.element.parent.parent.divs[1]
          drop_down.safe_click
          sleep 1
          drop_down.safe_click
          begin
            found = false
            li = nil
            20.times do
              drop_down.safe_click
              sleep 1
              countries = browser.lis(text: country)
              countries.each do |element|
                if element_helper.text(element) == country
                  found = true
                  li = element
                end
              end
              break if found
            end

            selection = BrowserElement.new(li)

            10.times {
              begin
                break if text_box.text.include?(country)
                drop_down.safe_click unless selection.present?
                selection.scroll_into_view
                selection.safe_click
              rescue
                #ignore
              end
            }
            text_box.text.should include(country)
            logger.info "#{country} selected."
          end unless text_box.text.include?(country)
        end
      end

      class OrdersCustomsFields < Browser::Modal
        attr_reader :customs_form, :view_restrictions, :browser_restrictions_button, :edit_form_btn, :restrictions_btn

        def initialize(param)
          super(param)
          @customs_form ||= OrdersCustomsForm.new(param)
          @view_restrictions ||= Orders::Details::ViewRestrictions.new(param)
          @edit_form_btn = BrowserElement.new browser.span text: 'Edit Form...'
          @restrictions_btn = BrowserElement.new browser.span text: 'Restrictions...'
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

      class CustomsItemGrid < Browser::Modal

        def add_button
          @add_button ||= BrowserElement.new (browser.spans text: "Add Item").last
        end

        def present?
          add_button.present?
        end

        def size
          browser.tables(css: "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
        end

        def item number
          logger.info "Grid Item Count: #{size}"

          20.times{
            break if size >= number
            sleep 1
            break if size >= number
            add_button.safe_click if number > size
            logger.info "Item Count: #{size}"
            break if size >= number
          }

          logger.info "User Entered Number: #{number}. Actual Item Count: #{size}"

          CustomsLineItem.new(param, number)
        end
      end

      class CustomsLineItem < Browser::Modal

        class Qty < Browser::Modal
          def initialize(param, number)
            super(param)
            @index = number
          end

          def text_box
            TextboxElement.new (browser.text_fields(css: "div[id*=customswindow] input[name=Quantity]")[@index-1]), "data-errorqtip"
          end

          def set value
            text_field = text_box
            value = value.to_i
            max = value + text_field.text.to_i
            max.times do
              current_value = text_field.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Qty set to #{text_field.text}"
          end

          def increment value
            button = BrowserElement.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class UnitPrice < Browser::Modal
          def initialize(param, number)
            super(param)
            @index = number
          end

          def text_box
            TextboxElement.new ((browser.text_fields name: "Value")[@index-1]), "data-errorqtip"
          end

          def set value
            text_box.set value
            logger.info "Ounces set to #{text_box.text}"
          end

          def increment value
            button = BrowserElement.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
            value.to_i.times do
              button.safe_click
            end
          end
        end

        attr_reader :delete, :description, :qty, :unit_price, :made_in, :hs_tariff

        def initialize(param, number)
          super(param)
          @delete = BrowserElement.new (browser.spans css: "div[id*=customswindow] span[class*=sdc-icon-remove]")[number-1]
          @description = TextboxElement.new ((browser.text_fields css: "div[class*=customs-description] input[name=Description]")[number-1]), "data-errorqtip"
          @qty = Qty.new(param, number)
          @unit_price = UnitPrice.new(param, number)
          @made_in = Customs::OrdersMadeInCountry.new(param, number)
          @hs_tariff = TextboxElement.new (browser.text_fields name: "TariffNo")[number-1]
        end

        def present?
          delete.present?
        end
      end

      class UspsPrivactActStatementModal < Browser::Modal
        attr_reader :window_title, :okay

        def initialize(param)
          super(param)
          @window_title = BrowserElement.new browser.div text: "USPS Privacy Act Statement"
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
          @text_box = TextboxElement.new browser.text_field name: "IsITNRequired"
          @drop_down = BrowserElement.new browser.div(id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker")
        end

        def select selection
          logger.info "Select Internal Transaction Number: #{selection}"
          selection_label = BrowserElement.new browser.li(text: selection)
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
          @text_box = TextboxElement.new browser.text_field name: "CustomsContents"
          @drop_down = BrowserElement.new browser.div id: "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
        end

        def select selection
          logger.info "Select Internal Transaction Number: #{selection}"
          selection_label = BrowserElement.new browser.li(text: selection)
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
          @text_box = TextboxElement.new browser.text_field name: "NonDelivery"
          @drop_down = BrowserElement.new browser.div id: "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
        end

        def select selection
          logger.info "Select Internal Transaction Number: #{selection}"
          selection_label = BrowserElement.new browser.li(text: selection)
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
          @window_title = BrowserElement.new browser.div(text: "Customs Information")
          @item_grid ||= CustomsItemGrid.new(param)
          @package_contents ||= PackageContents.new(param)
          @non_delivery_options ||= NonDeliveryOptions.new(param)
          @internal_transaction ||= InternalTransaction.new(param)

          @more_info = TextboxElement.new browser.text_field name: "CustomsComments"
          @usps_privacy_act_warning = BrowserElement.new (browser.label text: "You must agree to the USPS Privacy Act Statement")
          @itn_number = TextboxElement.new browser.text_field(name: "AES")
          @license = TextboxElement.new browser.text_field(name: "CustomsLicenseNumber")
          @certificate = TextboxElement.new browser.text_field(name: "CustomsCertificateNumber")
          @invoice = TextboxElement.new browser.text_field(name: "CustomsInvoiceNumber")
          @total_value_element = BrowserElement.new browser.div(css: "div[id^=customswindow-][id$=-body]>div>div[id^=panel]>div>div>div>div[id^=displayfield]>div>div")

          field = browser.input(css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div>div>div>input")
          verify_field = browser.div(css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div[id^=checkbox]")
          @i_agree ||= CheckboxElement.new field, verify_field, "class", "checked"

          @privacy_statement ||= UspsPrivactActStatementModal.new(param)
          @privacy_link = BrowserElement.new browser.span(text: "USPS Privacy Act Statement")
          @restrictions_link ||= RestrictionsAndProhibitionsModal.new(param)
          @restrictions_prohibitions_link = BrowserElement.new browser.span(text: "Restrictions and Prohibitions")

          @close_button = BrowserElement.new browser.span(text: "Close")
          @x_button = BrowserElement.new browser.image(css: "img[class*='x-tool-close']")
          @total_label = BrowserElement.new browser.span(text: 'Total:')
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