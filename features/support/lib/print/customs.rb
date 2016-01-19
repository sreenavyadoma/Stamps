module Print
  module Customs
    class CustomsInformation < Print::Postage::PrintObject

      class AddItem < Print::Postage::PrintObject

        def customs_item=(table)
          self.origin_zip = table["ship_from_zip"]
          self.name = table["name"]
          self.company = table["company"]
          self.street_address1 = table["street_address"]
          self.street_address2 = table["street_address2"]
          self.city = table["city"]
          self.state = table["state"]
          self.zip = table["zip"]
          self.phone = table["phone"]
          self.save
        end

        class Qty < Print::Postage::PrintObject
          def text_box
            Textbox.new @browser.text_field :name => "Quantity"
          end

          def increment
            Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[8]
          end

          def decrement
            Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[8]
          end

        end

        class Value < Print::Postage::PrintObject
          def text_box
            Textbox.new @browser.text_field :name => "Value"
          end

          def increment
            Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[9]
          end

          def decrement
            Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[9]
          end

        end

        class Weight < Print::Postage::PrintObject

          def pounds
            Pounds.new @browser
          end

          def ounces
            Ounces.new @browser
          end

          class Pounds < Print::Postage::PrintObject
            def text_box
              Textbox.new @browser.text_field :name => "WeightLb"
            end

            def increment
              Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[10]
            end

            def decrement
              Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[10]
            end

          end

          class Ounces < Print::Postage::PrintObject
            def text_box
              Textbox.new @browser.text_field :name => "WeightOz"
            end

            def increment
              Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[11]
            end

            def decrement
              Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[11]
            end

          end

        end

        class Origin < Print::Postage::PrintObject
          def text_box
            Textbox.new @browser.text_field :name => "CountryOfOrigin"
          end

          def drop_down
            Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]").last
          end

          def select selection
            log.info "Select Package Contents: #{selection}"
            box = text_box
            button = drop_down
            selection_label = Label.new @browser.div :text => selection

            10.times {
              begin
                button.safe_click #unless selection_label.present?
                selection_label.scroll_into_view
                selection_label.safe_click
                selected_contents = box.text
                log.info "Selected ITN #{selected_contents} - #{(selected_contents.include? selection)?"done": "contents not selected"}"
                break if selected_contents.include? selection
              rescue
                #ignore
              end
            }
            log.info "Package Contents: #{selection} selected."
            selection_label
          end

        end

        def qty
          Qty.new @browser
        end

        def value
          Value.new @browser
        end

        def weight
          Weight.new @browser
        end

        def origin
          Origin.new @browser
        end

        def description
          Textbox.new @browser.text_field :name => "Description"
        end

        def hs_tariff
          Textbox.new @browser.text_field :name => "HSTariffNumber"
        end

        def save
          Button.new (@browser.as :css => "a[class*=app-modal-button-primary]")[2]
        end

        def add_another
          Button.new @browser.a :css => "a[class*=app-modal-button-secondary]"
        end

      end

      class PackageContents < Print::Postage::PrintObject
        def text_box
          Textbox.new @browser.text_field :name => "ContentType"
        end

        def drop_down
          Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[9]
        end

        def select selection
          log.info "Select Package Contents: #{selection}"
          box = text_box
          button = drop_down
          selection_label = Label.new @browser.div :text => selection

          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_contents = box.text
              log.info "Selected ITN #{selected_contents} - #{(selected_contents.include? selection)?"done": "contents not selected"}"
              break if selected_contents.include? selection
            rescue
              #ignore
            end
          }
          log.info "Package Contents: #{selection} selected."
          selection_label
        end
      end

      class NonDeliveryOptions < Print::Postage::PrintObject
        def text_box
          Textbox.new @browser.text_field :name => "NonDeliveryOption"
        end

        def drop_down
          Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[10]
        end

        def select selection
          log.info "Non-Delivery Option: #{selection}"
          box = text_box
          button = drop_down
          selection_label = Label.new @browser.div :text => selection

          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_option = box.text
              log.info "Selected Option #{selected_option} - #{(selected_option.include? selection)?"done": "option not selected"}"
              break if selected_option.include? selection
            rescue
              #ignore
            end
          }
          log.info "Non-Delivery Options: #{selection} selected."
          selection_label
        end
      end

      class ITNRequirement< Print::Postage::PrintObject
        def text_box
          Textbox.new @browser.text_field :name => "isITNRequired"
        end

        def drop_down
          Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[11]
        end

        def select selection
          log.info "Select ITN: #{selection}"
          box = text_box
          button = drop_down
          selection_label = Label.new @browser.div :text => selection

          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_itn = box.text
              log.info "Selected ITN #{selected_itn} - #{(selected_itn.include? selection)?"done": "ITN not selected"}"
              break if selected_itn.include? selection
            rescue
              #ignore
            end
          }
          log.info "ITN #{selection} option selected."
          selection_label
        end
      end



      class ItemGrid < Print::Postage::PrintObject



        public

        def description row
          sleep(1)
          grid_cell_text row, 1
        end

        def qty row
          sleep(1)
          grid_cell_text row, 2
        end

        def origin row
          sleep 1
          grid_cell_text row, 3
        end

        def hs row
          sleep 1
          grid_cell_text row, 4
        end

        def weight row
          sleep 1
          grid_cell_text row, 5
        end

        def value row
          sleep 1
          grid_cell_text row, 6
        end

        def present?
          browser_helper.present?  add_button
        end

        def click_delete_button
          begin
            browser_helper.click(delete_button, "Delete") if browser_helper.present?  delete_button
            browser_helper.click window_title, 'window_title'
          rescue
            #ignore
          end
        end

        def delete_row(number)
            select_row number
            click_delete_button
          self
        end

        def add *args
          @add_item_form = AddItem.new(@browser)
          add_item_window
          case args.length
            when 0
              @add_item_form
            when 1
              address = args[0]
              case address
                when Hash
                  @add_item_form.shipping_address = address
                else
                  raise "Illegal Ship-to argument"
              end
            else
              raise "add_address:  Illegal number of arguments #{args.length}"
          end
        end

        def add_item_window
          @add_item_form = AddItem.new @browser
          5.times {
            begin
              break if @add_item_form.present?
              browser_helper.click add_button, "add_button"
              add_button.wait_until
            rescue
              #ignore
            end
          }
        end

        def edit_address(name, company, city, new_address_details)
          row_num = locate_ship_from(name, company, city)
          if row_num > 0
            select_row row_num
            self.edit new_address_details
          end
          #@test_status = locate_address(new_address_details[:name], new_address_details[:company], new_address_details[:city])
          close_window
          self
        end

        def address_located? * args #name, company, city
          case args.length
            when 1
              if args[0].is_a? Hash
                address_hash = args[0]
                name = address_hash["name"]
                company = address_hash["company"]
                city = address_hash["city"]
              else
                raise "Wrong number of arguments for locate_address" unless args.length == 3
              end
            when 3
              name = args[0]
              company = args[1]
              city = args[2]
            else
              raise "Wrong number of arguments for locate_address" unless args.length == 3
          end
          locate_ship_from(name, company, city) > 0
        end

        def edit *args
          shipping_address = AddShippingAdress.new @browser
          edit_button.when_present.click
          case args.length
            when 0
              shipping_address
            when 1
              shipping_address.shipping_address = args[0]
            else
              raise "Illegal number of arguments."
          end
          self
        end

        def select_row(row_num)
          click_row_until_selected(row_num, "class", "x-grid-item-selected")
          browser_helper.click window_title, 'window_title'
        end

        def click_row_until_selected(row_num, attibute, attribute_value)
          cell = grid_cell(row_num, 1)
          5.times do
            begin
              browser_helper.click cell, "cell(#{row_num}, 1)"
              #log_browser_click(cell, attibute, attribute_value)
              break if checked? row_num
            rescue
              #ignore
            end
          end
        end

        def deleted?
          @deleted
        end

        def delete_all
          begin
            count = shipping_address_count
            if count > 1
              for row in 1..(count)
                browser_helper.click window_title, 'window_title'
                delete_row 1
                log.info "Row #{row} :: Deleting row 1..."
                break if shipping_address_count == 1
              end
            end
          rescue
            #
          end
          @deleted = shipping_address_count == 1
          self
        end

        def close_window
          begin
            10.times{
              sleep(1)
              break unless browser_helper.present? close_button
              browser_helper.click close_button, "Close"
            }
          rescue
            #ignore
          end
        end

        def wait_until_present
          add_button.wait_until_present
        end

        def shipping_address_count
          wait_until_present
          rows = @browser.trs(:css => "div[id^=grid-][class*=x-panel-body-default]>div>div>table")
          log.info "Manage Shipping Address:: row count = #{rows.length.to_i}"
          rows.length.to_i
        end

        private
        def window_title
          @browser.div :css => 'div[class*=x-window-header-title-default]>div'
        end

        def grid_cell(row, column)
          @browser.td :css => "div[id^=grid-][class*=x-panel-body-default]>div>div>table:nth-child(#{row.to_i})>tbody>tr>td:nth-child(#{column.to_i})"
        end

        def grid_cell_text(row, column)
          browser_helper.text grid_cell(row, column), "grid.row#{row}.column#{column})"
        end

        def close_button
          @browser.image :css => "img[class*='x-tool-close']"
        end

        def checked?(row)
          field = @browser.table :css => "div[id^=manageShipFromWindow][class^=x-window-body]>div>div[id$=body]>div[id^=gridview]>div[class=x-grid-item-container]>table[data-recordindex='#{row.to_i-1}']"
          value = browser_helper.attribute_value field, "class"
          checked = value.include? "selected"
          log.info "Row #{row} selected? #{checked}"
          checked
        end

        def add_button
          @browser.span :text => 'Add Item'
        end

        def edit_button
          @browser.span :text => 'Edit Item'
        end

        def delete_button
          @browser.span :text => 'Delete'
        end

        class DeleteItem < OrdersObject
          public
          def delete
            5.times {
              begin
                log.info "Delete Shipping Address :: #{message_field.text}"
                browser_helper.click delete_button, 'Delete'
              rescue
                #ignore
              end
              break unless present?
            }
          end

          def present?
            browser_helper.present?  window_title
          end

          def close
            field = @browser.elements(:css => 'img[class$=close]').last
            present = field.present?
            field.click if present
          end

          private

          def window_title
            @browser.div :text => "Delete Shipping Address"
          end

          def message_field
            @browser.div :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
          end

          def delete_button
            field = @browser.elements(:text => 'Delete').last
            present = field.present?
            field
          end
        end

      end



      def add_item
        AddItem.new @browser
      end

      def item_grid
        ItemGrid.new @browser
      end

      def package_contents
        PackageContents.new @browser
      end

      def non_delivery_options
        NonDeliveryOptions.new @browser
      end

      def itn_requirement
        ITNRequirement.new @browser
      end

      def itn_number
        Textbox.new @browser.text_field :name => "ITN"
      end

      def more_info
        Textbox.new @browser.text_field :name => "Comments"
      end

      def license_no
        Textbox.new @browser.text_field :name => "LicenseNumber"
      end

      def certificate_no
        Textbox.new @browser.text_field :name => "CertificateNumber"
      end

      def invoice_no
        Textbox.new @browser.text_field :name => "InvoiceNumber"
      end

      def save
        Button.new (@browser.as :css => "a[class*=app-modal-button-primary]")[1]
      end

      def total_weight
        divs = @browser.divs :css => "div[id^=displayfield]>div[id^=displayfield]>div[id^=displayfield]"
        div = divs[divs.size-2]
        weight_label = Label.new div
        log.info "Total Weight: #{weight_label.text}"
        weight_label
      end

      def total_weight_lbs
        lbs = total_weight.text.scan(/\d+/).first
        log.info "Pounds: #{lbs}"
        lbs
      end

      def total_weight_oz
        oz = total_weight.text.scan(/\d+/).last
        log.info "Ounces: #{oz}"
        oz
      end

      def total_value
        test_helper.remove_dollar_sign (Label.new (@browser.divs :css => "div[class*=x-form-display-field-default]").last).text
      end

      def i_agree user_agreed

        checkbox_fields = @browser.inputs :css => "input[id^=checkboxfield]"
        checkbox_field = checkbox_fields.last

        verify_fields = @browser.inputs :css => "div[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields.last
        checkbox = Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"

        if user_agreed
          checkbox.check
          log.info checkbox.checked?
        else
          checkbox.uncheck
          log.info checkbox.checked?
        end

      end

      def privacy_act_statement_link
        link = @browser.span :text => "USPS Privacy Act Statement"
        log.info "USPS Privacy Act Statement is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
        link
      end

      def usps_privacy_act_statement
        privacy_statement = UspsPrivacyActModal.new @browser
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
        restrictions_link = RestrictionsProhibitionsModal.new @browser
        5.times{
          browser_helper.safe_click restrictions_prohibitions_link
          return restrictions_link if restrictions_link.present?
        }
      end

    end

    class UspsPrivacyActModal < Print::Postage::PrintObject
      def window_title
        Label.new @browser.div :text => "USPS Privacy Act Statement"
      end

      def present?
        window_title.present?
      end

      def okay
        @browser.span :text => "OK"
      end

    end

    class RestrictionsProhibitionsModal < Print::Postage::PrintObject

      def present?

      end

    end

  end
end