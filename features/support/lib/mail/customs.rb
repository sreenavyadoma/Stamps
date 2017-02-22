module Stamps
  module Mail
    module CustomsForm

      class MailCustomsForm < Browser::StampsHtmlField
        attr_accessor :close_btn, :window_title, :package_contents, :non_delivery_options, :internal_transaction, :more_info,
                      :itn_number, :license, :certificate, :invoice, :i_agree

        def initialize(param)
          @close_btn = StampsElement.new(browser.img css: "img[class*='x-tool-img x-tool-close']")
          @window_title = StampsElement.newbrowser.div(text: 'Customs Information')
          @package_contents = MailCustomsPackageContents.new(param)
          @non_delivery_options = MailCustomsNonDeliveryOptions.new(param)
          @internal_transaction = InternalTransaction.new(param)
          @more_info = StampsTextbox.new(browser.text_field(name: "Comments"))
          @itn_number = StampsTextbox.new(browser.text_field(name: "ITN"))
          @license = StampsTextbox.new(browser.text_field(name: "LicenseNumber"))
          @certificate = StampsTextbox.new(browser.text_field(name: "CertificateNumber"))
          @invoice = StampsTextbox.new(browser.text_field(name: "InvoiceNumber"))

          text_field = browser.text_field(css: "div[id^=customswindow-][id$=-body][class*=x-window-body-default-closable]>div>div[class*=bottom]>div>div>div>div[class*=layout]>div>div>div:nth-child(1)>div>div>div>div>div>input")
          checked = browser.div(css: "div[id^=customswindow-][id$=-body][class*=x-window-body-default-closable]>div>div[class*=bottom]>div>div>div>div[class*=layout]>div>div>div:nth-child(1)>div>div>div")
          @i_agree = Stamps::Browser::StampsCheckbox.new text_field, checked, "class", "checked"
        end

        def close
          close_btn.click_while_present
        end

        def wait_until_present(*args)
          window_title.wait_until_present(args)
        end

        def present?
          window_title.present?
        end
        def save
          element_helper.click_while_present (browser.spans text: "Save").last.parent.spans[1]
        end




        #start here tomorrow

        def add_item
          add_item_modal = AddItemModal.new(param)
          button = StampsElement.new browser.span text: "Add Item"
          5.times do
            element_helper.safe_click button
            return add_item_modal if add_item_modal.present?
          end
          expect("Unable to open Add Item Modal, check your code.").to eql "" unless customs_modal.present?
        end

        def edit_item
          edit_item_modal = EditItemModal.new(param)
          button = StampsElement.new browser.span text: "Edit Item"
          5.times do
            element_helper.safe_click button
            return edit_item_modal if edit_item_modal.present?
          end
          expect("Unable to open Edit Item Modal, check your code.").to eql "" unless customs_modal.present?
        end

        def delete
          button = StampsElement.new browser.span text: "Delete"
          element_helper.safe_click button
        end

        def delete_all
          rows = browser.trs css:  "tr[class*=x-grid-data-row]"
          for i in 0..1000
            break if rows[i].present? == false
            sleep(0.35)
            element_helper.safe_click rows[i]
            delete
          end
        end

      end

      class AddItemModal < Browser::StampsHtmlField
        def close
          buttons = browser.imgs css: "img[class*='x-tool-img x-tool-close']"
          element_helper.safe_click buttons.last
        end

        def wait_until_present
          window_title.wait_until_present
        end

        def present?
          window_title.present?
        end

        def save
          button = (browser.spans text: "Save").last
          element_helper.safe_click button.parent.spans[1]
        end

        def window_title
          labels = browser.spans text: "Add Item"
          labels.last
        end

        def description
          StampsTextbox.new browser.text_field name: "Description"
        end

        def qty
          AddItemModal::Qty.new(param)
        end

        def value
          AddItemModal::Value.new(param)
        end

        def lb
          AddItemModal::Lbs.new(param)
        end

        def oz
          AddItemModal::Ounces.new(param)
        end

        def hs_tariff
          StampsTextbox.new browser.text_field name: "HSTariffNumber"
        end

        def origin
          AddItemModal::Origin.new(param)
        end

        def add_another

        end

        class Qty  < Browser::StampsHtmlField
          def text_box
            StampsTextbox.new browser.text_field name: 'Quantity'
          end

          def set(value)
            self.text_box.set(value)
            logger.info "Quantity set to #{text_box.text}"
            self.text_box.click
            sleep(2)
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[8])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[8])
            value.to_i.times do
              button.safe_click
            end
          end


        end

        class Value  < Browser::StampsHtmlField
          def text_box
            StampsTextbox.new browser.text_field name: 'Value'
          end

          def set(value)
            self.text_box.set(value)
            logger.info "Value set to #{text_box.text}"
            self.text_box.click
            sleep(2)
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[9])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[9])
            value.to_i.times do
              button.safe_click
            end
          end

        end

        class Lbs  < Browser::StampsHtmlField
          def text_box
            StampsTextbox.new(browser.text_field(name: 'WeightLb'))
          end

          def set(value)
            self.text_box.set(value)
            logger.info "Pounds set to #{text_box.text}"
            self.text_box.click
            sleep(2)
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[10])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[10])
            value.to_i.times do
              button.safe_click
            end
          end

        end

        class Ounces  < Browser::StampsHtmlField
          def text_box
            StampsTextbox.new browser.text_field name: 'WeightOz'
          end

          def set(value)
            self.text_box.set(value)
            logger.info "Ounces set to #{text_box.text}"
            self.text_box.click
            sleep(2)
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[11])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[11])
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class Origin  < Browser::StampsHtmlField
          attr_reader :text_box

          def initialize(param)
            super(param)
            @text_box = StampsTextbox.new browser.text_field name: "CountryOfOrigin"
          end

          def drop_down
            StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[12])
          end

          def select(selection)
            logger.info "Select Origin Country #{selection}"
            selection_label = StampsElement.new(browser.divs text: selection)[1]
            10.times {
              begin
                break if text_box.text.include? selection
                drop_down.safe_click #unless selection_label.present?
                selection_label.scroll_into_view
                selection_label.safe_click
              rescue
                #ignore
              end
            }
            logger.info "Origin Country selected: #{selection}"
            expect(text_box.text).to include(selection)
            selection_label
          end
        end
      end

      class MailCustomsPackageContents < Browser::StampsHtmlField
        def text_box
          StampsTextbox.new browser.text_field name: "ContentType"
        end

        def drop_down
          StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[9])
        end

        def select(selection)
          logger.info "Select Package Contents #{selection}"
          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_service = box.text
              logger.info "Selected Package Contents: #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
              break if selected_service.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Package Contents selected: #{selection}"
          selection_label
        end

      end

      class MailCustomsNonDeliveryOptions < Browser::StampsHtmlField
        def text_box
          StampsTextbox.new browser.text_field name: "NonDeliveryOption"
        end

        def drop_down
          StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[10])
        end

        def select(selection)
          logger.info "Select Non Delivery Option #{selection}"
          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_service = box.text
              logger.info "Selected Non Delivery Option: #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
              break if selected_service.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Non Delivery Option selected: #{selection}"
          selection_label
        end

      end

      class InternalTransaction < Browser::StampsHtmlField
        def text_box
          StampsTextbox.new browser.text_field name: "isITNRequired"
        end

        def drop_down
          StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[11])
        end

        def select(selection)
          logger.info "Select Internal Transaction #{selection}"
          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_service = box.text
              logger.info "Selected Internal Transaction: #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
              break if selected_service.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Internal Transaction selected: #{selection}"
          selection_label
        end

      end

      class CustomsFields < Browser::StampsHtmlField

        def browser_edit_form_button
          links = browser.links css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
          StampsElement.new links.first
        end

        def edit_form
          @customs_form = MailCustomsForm.new(param)
          edit_form_button = browser_edit_form_button
          20.times{
            edit_form_button.safe_click
            break if @customs_form.present?
          }
          expect("Customs Information Modal is not visible.").to eql "" unless @customs_form.present?
          @customs_form
        end

        def browser_restrictions_button
          StampsElement.new browser.span text: "Restrictions..."
        end

        def restrictions
          restrictions_button = browser_restrictions_button
          view_restrictions = Orders::Details::ViewRestrictions.new(param)
          5.times{
            restrictions_button.safe_click
            if view_restrictions.present?
              return view_restrictions
            end
          }
          nil
        end

      end


      class MailCustomsLineItem < Browser::StampsHtmlField

        class Qty < Browser::StampsHtmlField
          def initialize(param, number)
            super(param)
            @index = number
          end

          def text_box
            StampsTextbox.new(browser.text_fields(css: "div[id*=customswindow] input[name=Quantity]")[@index-1])
          end

          def set(value)
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
            sleep(0.35)
            logger.info "Qty set to #{text_field.text}"
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=up]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=down]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class UnitPrice < Browser::StampsHtmlField
          def initialize(param, number)
            super(param)
            @index = number
          end

          def text_box
            StampsTextbox.new(browser.text_fields(name: "Value")[@index-1])
          end

          def set(value)
            text_box.set(value)
            logger.info "Ounces set to #{text_box.text}"
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class UnitWeightLbs < Browser::StampsHtmlField
          def initialize(param, number)
            super(param)
            @index = number
          end

          def text_box
            StampsTextbox.new(browser.text_fields(name: "lb")[@index-1])
          end

          def set(value)
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
            sleep(0.35)
            logger.info "Pounds set to #{text_field.text}"
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=up]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=down]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class UnitWeightOz < Browser::StampsHtmlField
          def initialize(param, number)
            super(param)
            @index = number
          end

          def text_box
            StampsTextbox.new(browser.text_fields(name: "oz")[@index-1])
          end

          def set(value)
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
            sleep(0.35)
            logger.info "Ounces set to #{text_field.text}"
          end

          def increment value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=up]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = StampsElement.new(browser.divs(css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=down]")[@index-1])
            value.to_i.times do
              button.safe_click
            end
          end
        end

        def initialize(param, number)
          super(param)
          @index = number
        end

        def present?
          delete.present?
        end

        def delete
          StampsElement.new(browser.spans(css: "div[id*=customswindow] span[class*=sdc-icon-remove]")[@index-1])
        end

        def description
          StampsTextbox.new((browser.text_fields(css: "div[class*=customs-description] input[name=Description]")[@index-1]))
        end

        def qty
          Qty.new(param, @index)
        end

        def unit_price
          UnitPrice.new(param, @index)
        end

        def lb
          UnitWeightLbs.new(param, @index)
        end

        def oz
          UnitWeightOz.new(param, @index)
        end

        def origin
          OriginCountry.new(param, @index)
        end

        def hs_tariff
          StampsTextbox.new(browser.text_fields(name: "TariffNo")[@index-1])
        end

      end

      class MailUspsPrivactActStatementModal < Browser::StampsHtmlField
        def window_title
          StampsElement.new browser.div text: "USPS Privacy Act Statement"
        end

        def present?
          window_title.present?
        end

        def okay
          browser.span text: "OK"
        end

      end

      class RestrictionsAndProhibitionsModal < Browser::StampsHtmlField

        def present?

        end

      end


    end
  end
end