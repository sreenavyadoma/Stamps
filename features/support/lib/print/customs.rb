module Print
  module Postage

    class CustomsForm < Print::Postage::PrintObject

      def close
        browser_helper.safe_click (@browser.img :css => "img[class*='x-tool-img x-tool-close']")
      end

      def wait_until_present
        window_title.wait_until_present
      end

      def present?
        window_title.present?
      end

      def save
        button = StampsButton.new (@browser.spans :text => "Save")[0]
        button.safe_click
      end

      def window_title
        StampsLabel.new (@browser.span :text => "Customs Information")
      end

      def package_contents
        Print::Postage::PackageContents.new @browser
      end

      def non_delivery_options
        Print::Postage::NonDeliveryOptions.new @browser
      end

      def internal_transaction
        Print::Postage::InternalTransaction.new @browser
      end

      def more_info
        StampsTextbox.new @browser.text_field :name => "Comments"
      end

      def itn_number
        StampsTextbox.new @browser.text_field :name => "ITN"
      end

      def license
        StampsTextbox.new @browser.text_field :name => "LicenseNumber"
      end

      def certificate
        StampsTextbox.new @browser.text_field :name => "CertificateNumber"
      end

      def invoice
        StampsTextbox.new @browser.text_field :name => "InvoiceNumber"
      end

      def i_agree
        checkbox_fields = @browser.inputs :css => "input[id^=checkboxfield-]"
        checkbox_field = checkbox_fields.last
        verify_fields = @browser.tables :css => "table[id^=checkboxfield-]"
        verify_field = verify_fields.last

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def privacy_act_statement_link
        link = @browser.span :text => "USPS Privacy Act Statement"
        log.info "USPS Privacy Act Statement is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
        link
      end

      def usps_privacy_act_statement
        privacy_statement = Print::Postage::UspsPrivactActStatementModal.new @browser
        5.times{
          browser_helper.safe_click privacy_act_statement_link
          return privacy_statement if privacy_statement.present?
        }
      end

      def restrictions_prohibitions_link
        link = @browser.span :text => "Restrictions and Prohibitions"
        log.info "Restrictions and Prohibitions is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
        link
      end

      def restrictions_and_prohibitions
        restrictions_link = Print::Postage::RestrictionsAndProhibitionsModal.new @browser
        5.times{
          browser_helper.safe_click restrictions_prohibitions_link
          return restrictions_link if restrictions_link.present?
        }
      end

      def add_item
        add_item_modal = Print::Postage::AddItemModal.new @browser
        button = StampsButton.new @browser.span :text => "Add Item"
        5.times do
          browser_helper.safe_click button
          return add_item_modal if add_item_modal.present?
        end

        raise "Unable to open Add Item Modal, check your code." unless customs_modal.present?
      end

      def edit_item
        edit_item_modal = Print::Postage::EditItemModal.new @browser
        button = StampsButton.new @browser.span :text => "Edit Item"
        5.times do
          browser_helper.safe_click button
          return edit_item_modal if edit_item_modal.present?
        end

        raise "Unable to open Edit Item Modal, check your code." unless customs_modal.present?
      end

      def delete
        button = StampsButton.new @browser.span :text => "Delete"
        browser_helper.safe_click button
      end

      def delete_all
        rows = @browser.trs :css =>  "tr[class*=x-grid-data-row]"
        for i in 0..1000
          break if rows[i].present? == false
          sleep 1
          browser_helper.safe_click rows[i]
          delete
        end
      end

    end

    class AddItemModal < Print::Postage::PrintObject
      def close
        buttons = @browser.imgs :css => "img[class*='x-tool-img x-tool-close']"
        browser_helper.safe_click buttons.last
      end

      def wait_until_present
        window_title.wait_until_present
      end

      def present?
        window_title.present?
      end

      def save
        buttons = @browser.spans :text => "Save"
        browser_helper.safe_click buttons.last
      end

      def window_title
        labels = @browser.spans :text => "Add Item"
        labels.last
      end

      def description
        StampsTextbox.new @browser.text_field :name => "Description"
      end

      def qty
        Print::Postage::AddItemModal::Qty.new @browser
      end

      def value
        Print::Postage::AddItemModal::Value.new @browser
      end

      def lbs
        Print::Postage::AddItemModal::Lbs.new @browser
      end

      def oz
        Print::Postage::AddItemModal::Ounces.new @browser
      end

      def hs_tariff
        StampsTextbox.new @browser.text_field :name => "HSTariffNumber"
      end

      def origin
        Print::Postage::AddItemModal::Origin.new @browser
      end

      def add_another

      end

      class Qty  < Print::Postage::PrintObject
        def text_box
          StampsTextbox.new @browser.text_field :name => 'Quantity'
        end

        def set value
          self.text_box.set value
          log.info "Quantity set to #{text_box.text}"
          self.text_box.click
          sleep(2)
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[8]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[8]
          value.to_i.times do
            button.safe_click
          end
        end


      end

      class Value  < Print::Postage::PrintObject
        def text_box
          StampsTextbox.new @browser.text_field :name => 'Value'
        end

        def set value
          self.text_box.set value
          log.info "Value set to #{text_box.text}"
          self.text_box.click
          sleep(2)
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[9]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[9]
          value.to_i.times do
            button.safe_click
          end
        end

      end

      class Lbs  < Print::Postage::PrintObject
        def text_box
          StampsTextbox.new @browser.text_field :name => 'WeightLb'
        end

        def set value
          self.text_box.set value
          log.info "Pounds set to #{text_box.text}"
          self.text_box.click
          sleep(2)
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[10]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[10]
          value.to_i.times do
            button.safe_click
          end
        end

      end

      class Ounces  < Print::Postage::PrintObject
        def text_box
          StampsTextbox.new @browser.text_field :name => 'WeightOz'
        end

        def set value
          self.text_box.set value
          log.info "Ounces set to #{text_box.text}"
          self.text_box.click
          sleep(2)
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[11]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[11]
          value.to_i.times do
            button.safe_click
          end
        end

      end
      class Origin  < Print::Postage::PrintObject
        def text_box
          StampsTextbox.new @browser.text_field :name => "CountryOfOrigin"
        end

        def drop_down
          button = StampsButton.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[12]
        end

        def select selection
          log.info "Select Origin Country #{selection}"
          box = text_box
          button = drop_down
          selection_label = StampsLabel.new (@browser.divs :text => selection)[1]
          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_origin = box.text
              log.info "Selected Origin Country #{selected_origin} - #{(selected_origin.include? selection)?"done": "service not selected"}"
              break if selected_origin.include? selection
            rescue
              #ignore
            end
          }
          log.info "Origin Country selected: #{selection}"
          selection_label
        end

      end


    end

    class PackageContents < Print::Postage::PrintObject
      def text_box
        StampsTextbox.new @browser.text_field :name => "ContentType"
      end

      def drop_down
        StampsButton.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[9]
      end

      def select selection
        log.info "Select Package Contents #{selection}"
        box = text_box
        button = drop_down
        selection_label = StampsLabel.new @browser.div :text => selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            log.info "Selected Package Contents: #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "Package Contents selected: #{selection}"
        selection_label
      end

    end

    class NonDeliveryOptions < Print::Postage::PrintObject
      def text_box
        StampsTextbox.new @browser.text_field :name => "NonDeliveryOption"
      end

      def drop_down
        StampsButton.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[10]
      end

      def select selection
        log.info "Select Non Delivery Option #{selection}"
        box = text_box
        button = drop_down
        selection_label = StampsLabel.new @browser.div :text => selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            log.info "Selected Non Delivery Option: #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "Non Delivery Option selected: #{selection}"
        selection_label
      end

    end

    class InternalTransaction < Print::Postage::PrintObject
      def text_box
        StampsTextbox.new @browser.text_field :name => "isITNRequired"
      end

      def drop_down
        StampsButton.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[11]
      end

      def select selection
        log.info "Select Internal Transaction #{selection}"
        box = text_box
        button = drop_down
        selection_label = StampsLabel.new @browser.div :text => selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            log.info "Selected Internal Transaction: #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "Internal Transaction selected: #{selection}"
        selection_label
      end

    end

























    class CustomsFields < OrdersObject

      def browser_edit_form_button
        links = @browser.links :css => "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
        StampsLink.new links.first
      end

      def edit_form
        @customs_form = CustomsForm.new @browser
        edit_form_button = browser_edit_form_button
        20.times{
          edit_form_button.safe_click
          break if @customs_form.present?
        }
        raise "Customs Information Modal is not visible." unless @customs_form.present?
        @customs_form
      end

      def browser_restrictions_button
        StampsButton.new @browser.span :text => "Restrictions..."
      end

      def restrictions
        restrictions_button = browser_restrictions_button
        view_restrictions = Orders::Details::ViewRestrictions.new @browser
        5.times{
          restrictions_button.safe_click
          if view_restrictions.present?
            return view_restrictions
          end
        }
        nil
      end

    end


    class CustomsLineItem < OrdersObject

      class Qty < OrdersObject
        def initialize browser, number
          super browser
          @number = number
        end

        def text_box
          StampsTextbox.new ((@browser.text_fields :css => "div[id*=customswindow] input[name=Quantity]")[@number-1]), "data-errorqtip"
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
          log.info "Qty set to #{text_field.text}"
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class UnitPrice < OrdersObject
        def initialize browser, number
          super browser
          @number = number
        end

        def text_box
          StampsTextbox.new ((@browser.text_fields :name => "Value")[@number-1]), "data-errorqtip"
        end

        def set value
          text_box.set value
          log.info "Ounces set to #{text_box.text}"
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class UnitWeightLbs < OrdersObject
        def initialize browser, number
          super browser
          @number = number
        end

        def text_box
          StampsTextbox.new ((@browser.text_fields :name => "lbs")[@number-1]), "data-errorqtip"
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
          log.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class UnitWeightOz < OrdersObject
        def initialize browser, number
          super browser
          @number = number
        end

        def text_box
          StampsTextbox.new ((@browser.text_fields :name => "oz")[@number-1]), "data-errorqtip"
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
          log.info "Ounces set to #{text_field.text}"
        end

        def increment value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      def initialize browser, number
        super browser
        @number = number
      end

      def present?
        delete.present?
      end

      def delete
        StampsButton.new (@browser.spans :css => "div[id*=customswindow] span[class*=sdc-icon-remove]")[@number-1]
      end

      def description
        StampsTextbox.new ((@browser.text_fields :css => "div[class*=customs-description] input[name=Description]")[@number-1]), "data-errorqtip"
      end

      def qty
        Qty.new @browser, @number
      end

      def unit_price
        UnitPrice.new @browser, @number
      end

      def lbs
        UnitWeightLbs.new @browser, @number
      end

      def oz
        UnitWeightOz.new @browser, @number
      end

      def origin
        OriginCountry.new @browser, @number
      end

      def hs_tariff
        StampsTextbox.new (@browser.text_fields :name => "TariffNo")[@number-1]
      end

    end

    class UspsPrivactActStatementModal < OrdersObject
      def window_title
        StampsLabel.new @browser.div :text => "USPS Privacy Act Statement"
      end

      def present?
        window_title.present?
      end

      def okay
        @browser.span :text => "OK"
      end

    end

    class RestrictionsAndProhibitionsModal < OrdersObject

      def present?

      end

    end





  end

end