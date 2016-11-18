module Stamps
  module Orders
    module Details

      class ShipToTextArea < TextBoxElement
        def full_address
          50.times do
            break if element.attribute_value("value").size > 0
          end
          element.attribute_value("value")
        end

        def recipient_name
          address = full_address
          address_arr = address.split("\n")
          address_arr.size.should be > 2
          address_arr[0].strip
        end

        def company_name
          address = full_address
          address_arr = address.split("\n")
          address_arr.size.should be_between(4, 5).inclusive
          address_arr[1].strip
        end

        def street_address
          address = full_address
          address_arr = address.split("\n")
          if address_arr.size == 3
            addy = address_arr[1]
            addy.strip
          elsif address_arr.size == 4 || address_arr.size == 5
            addy = address_arr[2]
            addy.strip
          else
            address_arr.size.should be > 2
          end
        end

        def city
          address = full_address
          address_arr = address.split("\n")
          if address_arr.size == 3
            last_line = address_arr[2].strip
          elsif address_arr.size == 4
            last_line = address_arr[3].strip
          elsif address_arr.size == 5
            last_line = address_arr[4].strip
          else
            address_arr.size.should be > 2
          end
          last_line_arr = last_line.split(",")
          last_line_arr.size.should equal 2
          last_line_arr[0]
        end

        def state
          address = full_address
          address_arr = address.split("\n")
          if address_arr.size == 3
            last_line = address_arr[2].strip
          elsif address_arr.size == 4
            last_line = address_arr[3].strip
          elsif address_arr.size == 5
            last_line = address_arr[4].strip
          else
            address_arr.size.should be > 2
          end
          last_line_arr = last_line.split(",")
          last_line_arr.size.should equal 2
          city_zip = last_line_arr[1].strip
          city_zip.split(" ").first
        end

        def zip_plus_4
          address = full_address
          address_arr = address.split("\n")
          if address_arr.size == 3
            last_line = address_arr[2].strip
          elsif address_arr.size == 4
            last_line = address_arr[3].strip
          elsif address_arr.size == 5
            last_line = address_arr[4].strip
          else
            address_arr.size.should be > 2
          end
          last_line_arr = last_line.split(",")
          last_line_arr.size.should equal 2
          last_line_arr.last.strip.split(" ").last
        end

        def zip_code
          code = zip_plus_4.split("-")
          code.size.should equal 2
          code.first
        end
      end

      class DetailsElement < Browser::Modal
        attr_reader :insure_for_label

        def initialize param
          super param
          @insure_for_label = ElementWrapper.new browser.label(text: 'Insure For $:')
        end

        def blur_out
          insure_for_label.safe_click
          insure_for_label.safe_double_click
          insure_for_label.safe_click
        end
      end

      class ShipToBase < DetailsElement
        attr_reader :less, :ship_to_dd

        def initialize param
          super param
          @less ||= ElementWrapper.new browser.span(css: "div#shiptoview-domestic-targetEl>div>div>div>div>div>div>a[class*=link]>span>span>span[id$=btnInnerEl]")
          @ship_to_dd = ElementWrapper.new browser.span(css: "div#shiptoview-addressCollapsed-targetEl>a>span>span>span[class*=down]")
        end

        def hide_address_details
          blur_out
          less.click_while_present
        end

        def show_address_details
          blur_out
          15.times {
            ship_to_dd.safe_click
            break unless ship_to_dd.present?
          }
        end
      end

      class ShipToCountry < ShipToBase
        attr_reader :dom_drop_down, :dom_text_box, :int_drop_down, :int_text_box

        def initialize param
          super param
          @dom_drop_down ||= ElementWrapper.new browser.div(css: "div#shiptoview-domestic-targetEl>div>div>div>div>div>div>div[id^=combo-][id$=-trigger-picker]")
          @dom_text_box ||= TextBoxElement.new browser.text_field(css: "div#shiptoview-domestic-targetEl>div>div>div>div>div>div>div>input[name=ShipCountryCode]")
          @int_drop_down ||= ElementWrapper.new browser.div(css: "div#shiptoview-international-targetEl>div:nth-child(1)>div>div>div>div:nth-child(2)>div>div:nth-child(2)")
          @int_text_box ||= TextBoxElement.new browser.text_field(css: "div#shiptoview-international-targetEl>div:nth-child(1)>div>div>div>div>div>div>input")
        end

        def drop_down
          show_address_details
          if dom_drop_down.present?
            dom_drop_down
          elsif int_drop_down.present?
            int_drop_down
          else
            "Country drop-down (both domestic and international) is not present.".should eql ""
          end
        end

        def text_box
          show_address_details
          sleep 1
          if dom_text_box.present?
            dom_text_box
          elsif int_text_box.present?
            int_text_box
          else
            "Country text box (both domestic and international) is not present.".should eql ""
          end
        end

        def select country
          logger.info "Select Country #{country}"
          sleep 1
          selection_1 = ElementWrapper.new browser.li(text: country)
          selection_2 = ElementWrapper.new browser.li(text: "#{country} ")

          10.times do
            begin
              break if text_box.text.include? country
              drop_down.safe_click unless selection_1.present? || selection_2.present?
              if selection_1.present?
                selection_1.safe_scroll_into_view
                selection_1.safe_click
              elsif selection_2.present?
                selection_2.safe_scroll_into_view
                selection_2.safe_click
              else
                sleep 1
                if browser.lis(text: country).size == 2
                  element1 = browser.lis(text: country)[0]
                  element2 = browser.lis(text: country)[1]
                  if element1.present?
                    element_helper.safe_click element1
                  elsif element2.present?
                    element_helper.safe_click element2
                  end
                end
              end

              logger.info "Selection #{text_box.text} - #{(text_box.text.include? country)?"was selected": "not selected"}"
            rescue Exception => e
              logger.error e.backtrace.join("\n")
            end
          end
          logger.info "#{country} selected."
          text_box.text.should include country
        end
      end

      class IntShipToBase < ShipToBase
        attr_reader :name_field, :company_field, :address_1_field, :address_2_field, :city_field, :phone_field, :province_field, :postal_code_field, :email_field

        def initialize param
          super param
          @name_field ||= TextBoxElement.new browser.text_field(name: "ShipName"), browser.div(css: "div#shiptoview-international-targetEl>div:nth-child(2)>div>div>div>div>div[class*=error-msg]"), "data-errorqtip"
          @company_field ||= TextBoxElement.new browser.text_field(name: "ShipCompany"), browser.div(css: "div#shiptoview-international-targetEl>div:nth-child(3)>div>div>div>div>div[class*=error-msg]"), "data-errorqtip"
          @address_1_field ||= TextBoxElement.new browser.text_field(name: "ShipStreet1"), browser.div(css: "div#shiptoview-international-targetEl>div:nth-child(4)>div>div>div>div>div[class*=error-msg]"), "data-errorqtip"
          @address_2_field ||= TextBoxElement.new browser.text_field(name: "ShipStreet2")
          @city_field ||= TextBoxElement.new browser.text_field(name: "ShipCity"), browser.div(css: "div#shiptoview-international-targetEl>div:nth-child(6)>div>div>div>div>div[class*=error-msg]"), "data-errorqtip"
          @phone_field = TextBoxElement.new browser.text_field(css: "div#shiptoview-international-targetEl>div>div>div>div>div>div>div>input[name=ShipPhone]"), browser.div(css: "div#shiptoview-international-targetEl>div:nth-child(8)>div>div>div>div>div[class*=error-msg]"), "data-errorqtip"
          @province_field ||= TextBoxElement.new browser.text_field(name: "ShipState")
          @postal_code_field ||= TextBoxElement.new browser.text_field(name: "ShipPostalCode")
          @email_field ||= TextBoxElement.new browser.text_field(css: "div#shiptoview-international-targetEl>div>div>div>div>div>div>div>input[name=BuyerEmail]")
        end

        def present?
          show_address_details
          name_field.present?
        end

        def name
          show_address_details
          name_field
        end

        def company
          show_address_details
          company_field
        end

        def address_1
          show_address_details
          address_1_field
        end

        def address_2
          show_address_details
          address_2_field
        end

        def city
          show_address_details
          city_field
        end

        def phone
          show_address_details
          phone_field
        end

        def province
          show_address_details
          province_field
        end

        def postal_code
          show_address_details
          postal_code_field
        end

        def email
          show_address_details
          email_field
        end
      end

      class IntShipTo < IntShipToBase
        attr_reader :auto_suggest
        def initialize param
          super param
          @auto_suggest ||= AutoSuggestInternational.new param
        end
      end

      class DomShipToBase < ShipToBase
        def text_area
          show_address_details
          if @text_area.nil?
            field = browser.textarea(name: "freeFormAddress")
            error_field = browser.a css: "a[data-errorqtip*=address]" #This is the field containing data error property data-errorqtip
            error_field_attribute = "data-errorqtip"
            @text_area ||= ShipToTextArea.new field, error_field, error_field_attribute
          end
          @text_area
        end

        def email
          show_address_details
          if @email.nil?
            field = browser.text_field name: 'BuyerEmail'
            error_field = (browser.divs css: "div[data-errorqtip*=email]")[0]
            error_field_attribute = "data-errorqtip"
            @email ||= TextBoxElement.new field, error_field, error_field_attribute
          end
          @email
        end

        def phone
          show_address_details
          if @phone.nil?
            @phone ||= TextBoxElement.new browser.text_field name: "ShipPhone"
          end
          @phone
        end
      end

      class DomShipTo < DomShipToBase
        attr_reader :ambiguous, :auto_suggest

        def initialize param
          super param
          @ambiguous ||= AmbiguousAddress.new param
          @auto_suggest ||= AutoSuggestDomestic.new param
        end

        def set address
          20.times do
            begin
              text_area.set address
              blur_out
              break if less.present?
              blur_out
              break if less.present?
              blur_out
              break if less.present?
              blur_out
              break if less.present?
              blur_out
              break if less.present?
            rescue
              "Unable to Ship-To address to #{address}".should eql "Set Ship-To Address Failed"
            end
          end
          text_area.text.should include address.split(" ").last
        end
      end

      class ShipTo < Browser::Modal
        attr_reader :country, :international, :address
        def initialize param
          super param
          @country ||= ShipToCountry.new param
          @address ||= DomShipTo.new param
          @international ||= IntShipTo.new param
        end
      end

      class AutoSuggestPopUp < Browser::Modal
        def present?
          (ElementWrapper.new self.name_fields[0]).present?
        end

        def size
          (browser.lis css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]").size
        end

        def select number
          selection = ElementWrapper.new name_fields[number.to_i-1]
          selection.safe_click
          selection.safe_click
          selection.safe_click
        end

        def name_fields
          (browser.lis css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]")
        end

        def address_fields
          (browser.lis css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=sub]")
        end
      end

      class AutoSuggestInternational < IntShipToBase
        attr_reader :auto_suggest_box

        def initialize param
          super param
          @auto_suggest_box ||= AutoSuggestPopUp.new param
        end

        def set address
          text_field = self.name

          20.times{
            begin
              text_field.set address
              return auto_suggest_box if auto_suggest_box.present?
              text_field.safe_click
              sleep 1
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.safe_double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue
              #ignore
            end
          }
        end
      end

      class AddressNotFound < Browser::Modal
        attr_reader :window_title

        def initialize param
          super param
          @window_title ||= ElementWrapper.new browser.div(text: 'Exact Address Not Found')
        end

        def present?
          window_title.present?
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def row number
          row = number.to_i<=0?0:number.to_i-1
          checkbox_field = browser.text_field css: "input[name=addrAmbig][value='#{row}']"

          checkbox = CheckboxElement.new checkbox_field, checkbox_field, "checked", "checked"
          checkbox.check

          accept_button = ElementWrapper.new browser.span text: "Accept"
          accept_button.click_while_present
        end

        def set partial_address_hash
          exact_address_not_found_field = browser.div text: 'Exact Address Not Found'
          form = SingleOrderDetails.new param
          form.validate_address_link
          country_drop_down = self.country
          form.ship_to.set ParameterHelper.format_address(partial_address_hash)
          30.times {
            begin
              item_label.click
              country_drop_down.drop_down.safe_click
              country_drop_down.drop_down.safe_click
              item_label.click

              break if (exact_address_not_found_field.present?) || (form.validate_address_link.present?)
            rescue
              #ignore
            end
          }
          #single_order_form.hide_ship_to
          self
        end
      end

      class AmbiguousAddress < DomShipToBase
        attr_reader :address_not_found

        def initialize param
          super param
          @address_not_found ||= AddressNotFound.new param
        end

        def set address
          text_box = self.text_area

          10.times do
            text_box.set address
            blur_out
            address_not_found.wait_until_present 4
            return address_not_found if address_not_found.present? if address_not_found.present?
          end
          "Exact Address Not Found module did not appear.".should eql ""
        end

        def data_error
          self.text_area.data_error_qtip
        end
      end

      class AutoSuggestDomestic < DomShipToBase
        attr_reader :auto_suggest_box
        def initialize param
          super param
          @auto_suggest_box = AutoSuggestPopUp.new param
        end

        def set address
          text_area = self.text_area

          20.times{
            begin
              text_area.set address
              return auto_suggest_box if auto_suggest_box.present?
              text_area.safe_click
              sleep 1
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.safe_double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue
              #ignore
            end
          }
        end
      end

      class AddShippingAdress < Browser::Modal
        attr_reader :save_button, :origin_zip, :window_title

        def initialize param
          super param
          @window_title ||= ElementWrapper.new browser.div(text: 'Add Shipping Address')
          @save_button ||= ElementWrapper.new browser.span(text: 'Save')
          @origin_zip ||= ElementWrapper.new browser.text_field(name: 'OriginZip')
        end

        def present?
          window_title.present?
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def shipping_address table
          origin_zip.set table["ship_from_zip"]
          self.name table['name']
          self.company table['company']
          self.street_address1 table["street_address"]
          self.street_address2 table["street_address2"]
          self.city table['city']
          self.state.select table["state"]
          self.zip table["zip"]
          self.phone table['phone']
          self.save
        end

        def name *args
          field = (browser.text_fields name: 'FullName').last
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def company *args
          field =(browser.text_fields name: 'Company').last
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def street_address1 *args
          field = browser.text_field name: 'Street1'
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def street_address2 *args
          field = browser.text_field name: 'Street2'
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def city *args
          field = (browser.text_fields name: 'City').last
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def state
          text_box = (browser.text_field name: 'State')
          dd = browser.div css: "div[id^=statecombobox-][id$=-trigger-picker]"
          DropDownElement.new @browser, dd, :li, text_box
        end

        def zip *args
          field = browser.text_field name: 'Zip'
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def phone *args
          field = (browser.text_fields css: "input[name=Phone]").last
          case args.length
            when 0
              element_helper.text field
            when 1
              element_helper.set field, args[0]
            else
              raise "Illegal number of arguments." if args.length > 2
          end
        end

        def save
          10.times{
            begin
              element_helper.safe_click save_button
              sleep 1
              break unless save_button.present?
            rescue
              #ignore
            end
          }
        end

      end

      class DeleteShippingAddress < Browser::Modal

        def window_title
          browser.div text: "Delete Shipping Address"
        end

        def delete
          5.times {
            begin
              logger.info "Delete Shipping Address :: #{message_field.text}"
              element_helper.safe_click delete_button
            rescue
              #ignore
            end
            break unless present?
          }
        end

        def present?
          window_title.present?
        end

        def close
          field = browser.elements(css: 'img[class$=close]').last
          present = field.present?
          field.click if present
        end

        def message_field
          browser.div css: "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
        end

        def delete_button
          field = browser.elements(text: 'Delete').last
          present = field.present?
          field
        end
      end

      class ViewRestrictions < Browser::Modal
        def browser_ok_button
          ElementWrapper.new browser.span text: "OK"
        end

        def present?
          browser_ok_button.present?
        end

        def ok
          browser_ok_button.safe_click
        end
      end

      class ManageShippingAddresses < Browser::Modal
        attr_reader :edit_button, :add_button, :window_title, :close_button, :delete_button, :add_shipping_address

        def initialize param
          super param
          @edit_button ||= ElementWrapper.new browser.link css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)"
          @add_button ||= ElementWrapper.new browser.link css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)"
          @window_title ||= ElementWrapper.new browser.div css: 'div[class*=x-window-header-title-default]>div'
          @close_button ||= ElementWrapper.new browser.image css: "img[class*='x-tool-close']"
          @delete_button ||= ElementWrapper.new browser.link css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)"
          @add_shipping_address ||= AddShippingAdress.new param
        end

        def present?
          add_button.present?
        end

        def grid_cell(row, column)
          browser.td css: "div[id^=grid-][class*=x-panel-body-default]>div>div>table:nth-child(#{row.to_i})>tbody>tr>td:nth-child(#{column.to_i})"
        end

        def grid_cell_text(row, column)
          element_helper.text grid_cell(row, column) #, "grid.row#{row}.column#{column})"
        end

        def checked?(row)
          field = browser.table css: "div[id^=manageShipFromWindow][class^=x-window-body]>div>div[id$=body]>div[id^=gridview]>div[class=x-grid-item-container]>table[data-recordindex='#{row.to_i-1}']"
          value = field.attribute_value "class"
          checked = value.include? "selected"
          logger.info "Row #{row} selected? #{checked}"
          checked
        end

        def name row
          sleep(1)
          grid_cell_text row, 1
        end

        def company row
          sleep(1)
          grid_cell_text row, 2
        end

        def city row
          sleep 1
          grid_cell_text row, 3
        end

        def state row
          sleep 1
          grid_cell_text row, 4
        end

        def locate_ship_from name, company, city
          rows = shipping_address_count
          1.upto rows do |row|
            element_helper.safe_click window_title
            grid_name = name row
            grid_company = company row
            grid_city = city row
            grid_state = state row
            if (grid_name.casecmp(name)==0) && (grid_company.casecmp(company)==0) && (grid_city.casecmp(city)==0)
              logger.info "Match found! - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
              return row
            else
              logger.info "No match - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
            end
          end
          0
        end

        def click_delete_button
          begin
            element_helper.safe_click delete_button if delete_button.present?
            element_helper.safe_click window_title
          rescue
            #ignore
          end
        end

        def delete *args
          case args.length
            when 1
              address = args[0]
              if address.is_a? Hash
                delete_row(locate_ship_from(address['name'], address['company'], address['city']))
              else
                "Address format is not yet supported for this delete call.".should eql ""
              end

            else
              "Parameter Exception: Paramter not supported.".should eql ""
          end
        end

        def delete_row number
          @delete_shipping_address = DeleteShippingAddress.new param
          5.times {
            select_row number
            click_delete_button
            break if @delete_shipping_address.present?
          }
          @delete_shipping_address.delete
          @delete_shipping_address.close if @delete_shipping_address.present?
          self
        end

        def add
          5.times do
            begin
              return add_shipping_address if add_shipping_address.present?
              add_button.safe_click
              add_shipping_address.wait_until_present 3
            rescue
              #ignore
            end
          end
          "Unable to open Add Shipping Address modal.".should eql "Add Shipping Address"
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
                name = address_hash['name']
                company = address_hash['company']
                city = address_hash['city']
              else
                "Wrong number of arguments for locate_address".should eql "" unless args.length == 3
              end
            when 3
              name = args[0]
              company = args[1]
              city = args[2]
            else
              "Wrong number of arguments for locate_address".should eql "" unless args.length == 3
          end
          locate_ship_from(name, company, city) > 0
        end

        def edit *args
          shipping_address = AddShippingAdress.new param
          edit_button.when_present.click
          case args.length
            when 0
              shipping_address
            when 1
              shipping_address.shipping_address = args[0]
            else
              "Illegal number of arguments.".should eql ""
          end
          self
        end

        def select_row(row_num)
          click_row_until_selected(row_num, "class", "x-grid-item-selected")
          element_helper.safe_click window_title
        end

        def click_row_until_selected(row_num, attibute, attribute_value)
          cell = grid_cell(row_num, 1)
          5.times do
            begin
              element_helper.safe_click cell
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
                element_helper.safe_click window_title
                delete_row 1
                logger.info "Row #{row} :: Deleting row 1..."
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
              sleep 1
              break unless close_button.present?
              element_helper.safe_click close_button
            }
          rescue
            #ignore
          end
        end

        def wait_until_present
          add_button.wait_until_present 8
        end

        def shipping_address_count
          wait_until_present
          rows = browser.trs(css: "div[id^=grid-][class*=x-panel-body-default]>div>div>table")
          logger.info "Manage Shipping Address:: row count = #{rows.length.to_i}"
          rows.length.to_i
        end
      end

      class ShipFromAddress < DetailsElement
        attr_reader :text_box, :drop_down, :manage_shipping_adddress
        def initialize param
          super param
          @text_box ||= TextBoxElement.new browser.text_field name: "ShipFrom"
          @drop_down ||= ElementWrapper.new browser.div css: "div[id^=shipfromdroplist][id$=trigger-picker]"
          @manage_shipping_adddress = ManageShippingAddresses.new param
        end

        def select service
          return manage_shipping_adddress if manage_shipping_adddress.present?

          default_element = browser.li(css: "ul[id^=boundlist-]>li[data-recordindex='0']")

          if service.downcase == "default"
            element = default_element
          elsif service.downcase.include? "manage shipping"
            element = browser.li(text: "Manage Shipping Addresses...")
          else
            element = browser.div text: "#{service}"
          end

          selection = ElementWrapper.new element
          service_text = ""
          if service.downcase.include? "manage shipping"
            7.times{
              begin
                drop_down.safe_click unless selection.present?
                selection.safe_scroll_into_view
                selection.safe_click
                sleep 1
                return manage_shipping_adddress if manage_shipping_adddress.present?
              rescue
                #ignore
              end
              blur_out
            }
          else
            drop_down.safe_click unless selection.present?
            if selection.present?
              selection.safe_scroll_into_view
              service_text = selection.text
            end
            10.times do
              drop_down.safe_click unless selection.present?
              selection.safe_scroll_into_view
              selection.safe_click
              sleep 1
              text_box_text = text_box.text
              return if text_box_text.include? service_text
            end
          end
          "Unable to select service #{service}".should eql ""
        end
      end

      class DetailsTracking < DetailsElement
        attr_reader :text_box, :cost_label, :drop_down
        def initialize param
          super param
          @text_box ||= TextBoxElement.new browser.text_field(name: 'Tracking')
          @cost_label = ElementWrapper.new browser.label(css: "label[class*=selected_tracking_cost]")
          @drop_down ||= ElementWrapper.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
        end

        def tracking_selection selection
          if selection.downcase.include? "usps"
            browser.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td")
          elsif selection.downcase.include? "signature"
            browser.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td")
          elsif selection.downcase.include? "none"
            browser.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td")
          else
            "#{selection} is not a valid selection".should eql "Valid selections are USPS Tracking and Signature Required"
          end
        end

        def select selection
          drop_down.present?.should be true
          5.times {
            begin
              drop_down.safe_click
              selection_label = tracking_selection(selection).first
              drop_down.safe_click unless selection_label.present?
              element_helper.safe_click selection_label
              break if text_box.text.include? selection
            rescue
              #ignore
            end
          }
          text_box.text.should include selection
        end

        def inline_cost selection
          tds = tracking_selection(selection)
          tds.size.should equal 2
          selection_label = ElementWrapper.new tds.last
          5.times do
            begin
              drop_down.safe_click unless selection_label.present?
              return selection_label.text if selection_label.present?

              drop_down.safe_click
              selection_label = tracking_selection(selection).last
              drop_down.safe_click unless selection_label.present?
              return element_helper.text selection_label if selection_label.present?
            rescue
              #ignore
            end
            "Unable to fetch inline cost for #{selection}".should eql "Details - Tracking inline cost"
          end
        end

        def cost
          10.times do
            begin
              cost_label.text.include? "$"
            rescue
              #ignore
            end
          end
          cost_label.text.should include "$"
          ParameterHelper.remove_dollar_sign cost_label.text
        end

        def tooltip selection
          button = drop_down
          selection_label = browser.td text: selection
          5.times {
            begin
              button.safe_click unless selection_label.present?
              if selection_label.present?
                qtip = selection_label.parent.parent.parent.parent.attribute_value "data-qtip"
                logger.info "#{qtip}"
                return qtip
              end
            rescue
              #ignore
            end
          }
        end
      end

      class DetailsService < DetailsElement
        attr_reader :text_box, :drop_down, :cost_label
        def initialize param
          super param
          @text_box ||= TextBoxElement.new (browser.text_field name: "Service"), (browser.div css: "div[data-anchortarget^=servicedroplist-]"), "data-errorqtip"
          @drop_down ||= ElementWrapper.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]")
          @cost_label = ElementWrapper.new browser.label(css: 'div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(6)>div>div>label:nth-child(3)')
        end

        def abbrev_service_name long_name
          if long_name.include? 'First-Class Mail International'
            long_name.sub 'First-Class Mail International', 'FCMI'
          elsif long_name.include? 'First-Class Mail'
            long_name.sub 'First-Class Mail', 'FCM'
          elsif long_name.include? 'Priority Mail Express International'
            long_name.sub 'Priority Mail Express International', 'PMEI'
          elsif long_name.include? 'Priority Mail International'
            long_name.sub 'Priority Mail International', 'PMI'
          elsif long_name.include? 'Priority Mail Express'
            long_name.sub 'Priority Mail Express', 'PME'
          elsif long_name.include? 'Priority Mail'
            long_name.sub 'Priority Mail', 'PM'
          elsif long_name.include? 'Media Mail'
            long_name.sub 'Media Mail', 'MM'
          elsif long_name.include? 'Parcel Select Ground'
            long_name.sub 'Parcel Select Ground', 'PSG'
          else # there's no abbreviation for this long name so send it right back.
            long_name
          end
        end

        def select selection
          logger.info "Select Service #{selection}"

          abbrev_selection = abbrev_service_name(selection)

          selected_service = ""
          @details_services ||= data_for(:details_services, {})

          selection_label = ElementWrapper.new browser.td css: "li##{@details_services[selection]}>table>tbody>tr>td.x-boundlist-item-text"

          20.times do
            begin
              drop_down.safe_click unless selection_label.present?
              selection_label.safe_scroll_into_view
              selection_label.safe_click
              blur_out
              selected_service = text_box.text
              logger.info "Selected Service #{selected_service} - #{(selected_service.include? abbrev_selection)?"success": "service not selected"}"
              break if selected_service.include? abbrev_selection
            rescue
              #ignore
            end
          end
          logger.info "#{selected_service} service selected."

          # Test if selected service includes abbreviated selection.
          selected_service.should include abbrev_selection
          selection_label
        end

        def inline_cost service_name
          cost_label = ElementWrapper.new browser.td css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"
          10.times do
            begin
              drop_down.safe_click unless cost_label.present?
              if cost_label.present?
                service_cost = ParameterHelper.remove_dollar_sign cost_label.text
                logger.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                drop_down.safe_click if cost_label.present?
                return service_cost
              end
            rescue
              #ignore
            end
          end
        end

        def cost
          ParameterHelper.remove_dollar_sign(cost_label.text)
        end

        def tooltip selection
          button = drop_down
          selection_label = ElementWrapper.new browser.tr(css: "tr[data-qtip*='#{selection}']")
          10.times {
            begin
              button.safe_click unless selection_label.present?
              sleep 1
              if selection_label.present?
                tooltip = selection_label.attribute_value "data-qtip"
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip if tooltip.include? "<strong>"
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def disabled? service

          @details_services ||= data_for(:details_services, {})

          dd_btn = self.drop_down
          selection_field = browser.li(id: "#{@details_services[service]}")
          #selection_element = browser.tr css: "tr[data-qtip*='#{service}']"
          selection_label = ElementWrapper.new selection_field

          10.times do |index|
            dd_btn.safe_click unless selection_label.present?
            sleep 1
            if selection_field.present?
              disabled_field = ElementWrapper.new (selection_field.parent.parent.parent)
              begin
                if selection_label.present?
                  if disabled_field.present?
                    result = disabled_field.attribute_value("class").include? "disabled"
                    sleep 1
                    result = disabled_field.attribute_value("class").include? "disabled"
                    result = disabled_field.attribute_value("class").include? "disabled"
                    dd_btn.safe_click
                    return result
                  end
                end
              rescue
                #ignore
              end
            else
              sleep 1
              return true if index == 5 #try to look for service in Service selection drop-down 3 times before declaring it's disabled.
            end
          end
        end

        def enabled? service
          !(self.disabled? service)
        end
      end

      class Weight < Browser::Modal
        attr_reader :lbs, :oz
        def initialize param
          super param
          @lbs ||= Pounds.new param
          @oz ||= Ounces.new param
        end

        class Pounds < Browser::Modal
          attr_reader :text_box
          def initialize param
            super param
            @text_box ||= TextBoxElement.new (browser.text_field name: 'WeightLbs'), "data-errorqtip"
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
            logger.info "Pounds set to #{text_field.text}"
          end

          def increment value
            button = ElementWrapper.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]").first
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = ElementWrapper.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]").first
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class Ounces < Browser::Modal
          attr_reader :text_box
          def initialize param
            super param
            @text_box ||= TextBoxElement.new (browser.text_field name: 'WeightOz'), "data-errorqtip"
          end

          def set value
=begin
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
=end
            self.text_box.set value
            logger.info "Ounces set to #{text_box.text}"
          end

          def increment value
            button = ElementWrapper.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]").last
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = ElementWrapper.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]").last
            value.to_i.times do
              button.safe_click
            end
          end
        end
      end

      class Dimensions < Browser::Modal
        attr_reader :length, :width, :height
        def initialize param
          super param
          @length ||= Length.new param
          @width ||= Width.new param
          @height ||= Height.new param
        end

        class Length < Browser::Modal
          attr_reader :text_box, :increment_button, :decrement_button

          def initialize param
            super param
            @text_box ||= TextBoxElement.new browser.text_field css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div>input"
            @increment_button = ElementWrapper.new browser.div css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=up]"
            @decrement_button = ElementWrapper.new browser.div css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=down]"
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
            logger.info "Length set to #{text_field.text}"
          end

          def increment value
            value.to_i.times do
              increment_button.safe_click
            end
          end

          def decrement value
            value.to_i.times do
              decrement_button.safe_click
            end
          end
        end

        class Width < Browser::Modal
          attr_reader :text_box, :increment_button, :decrement_button

          def initialize param
            super param
            @text_box ||= TextBoxElement.new browser.text_field css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div>input"
            @increment_button = ElementWrapper.new browser.div css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=up]"
            @decrement_button = ElementWrapper.new browser.div css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=down]"
          end

          def set value
            value = value.to_i
            max = value + text_box.text.to_i
            max.times do
              current_value = text_box.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Width set to #{text_box.text}"
          end

          def increment value
            value.to_i.times do
              increment_button.safe_click
            end
          end

          def decrement value
            value.to_i.times do
              decrement_button.safe_click
            end
          end
        end

        class Height < Browser::Modal
          attr_reader :text_box, :increment_button, :decrement_button

          def initialize param
            super param
            @text_box ||= TextBoxElement.new browser.text_field css: 'div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(5)>div>div>div>input'
            @increment_button ||= ElementWrapper.new browser.div css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(5)>div>div>div[id*=spinner]>div[class*=up]"
            @decrement_button ||= ElementWrapper.new browser.div css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(5)>div>div>div[id*=spinner]>div[class*=down]"
          end

          def set value
            value = value.to_i
            max = value + text_box.text.to_i
            max.times do
              current_value = text_box.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Height set to #{text_box.text}"
          end

          def increment value
            value.to_i.times do
              increment_button.safe_click
            end
          end

          def decrement value
            value.to_i.times do
              decrement_button.safe_click
            end
          end
        end
      end

      class DetailsInsureFor < Browser::Modal
        attr_reader :checkbox, :text_box, :cost_label, :increment_trigger, :decrement_trigger

        def initialize param
          super param
          @text_box ||= TextBoxElement.new browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>input[name=InsuredValue]")
          @cost_label = ElementWrapper.new browser.label(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(7)>div>div>label")
          @decrement_trigger ||= ElementWrapper.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger ||= ElementWrapper.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")

          field = browser.input(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=checkbox-]:nth-child(2)>div>div>input")
          verify = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=checkbox-]:nth-child(2)")
          @checkbox ||= CheckboxElement.new field, verify, "class", "checked"
        end

        def set value
          checkbox.check
          text_box.set value
        end

        def increment value
          value.to_i.times do
            increment_trigger.safe_click
          end
        end

        def decrement value
          value.to_i.times do
            decrement_trigger.safe_click
          end
        end

        def cost
          ParameterHelper.remove_dollar_sign(cost_label.text)
        end
      end

      class DetailsItemGrid < Browser::Modal
        class DetailsStoreItem < Browser::Modal
        end

        class DetailsItem < Browser::Modal
          attr_reader :index, :qty, :id, :description, :delete
          def initialize param, number
            super param
            @index = number
            @qty ||= Qty.new param, index
            @id ||= TextBoxElement.new (browser.text_fields name: "SKU")[index-1]
            @delete ||= ElementWrapper.new (browser.spans css: "span[class*=sdc-icon-remove]")[index-1]
            @description ||= TextBoxElement.new (browser.text_fields name: "Description")[index-1]
          end

          class Qty < Browser::Modal
            attr_reader :text_box

            def initialize param, number
              super param
              @index = number
              @text_box = TextBoxElement.new ((browser.text_fields name: "Quantity")[@index-1]), "data-errorqtip"
            end

            def set value
              value = value.to_i
              max = value + text_box.text.to_i
              max.times do
                current_value = text_box.text.to_i
                break if value == current_value
                if value > current_value
                  increment 1
                else
                  decrement 1
                end
                break if value == current_value
              end
              logger.info "Qty set to #{text_box.text}"
            end

            def increment value
              button = ElementWrapper.new (browser.divs css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index-1]
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = ElementWrapper.new (browser.divs css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index-1]
              value.to_i.times do
                button.safe_click
              end
            end
          end

          def present?
            ((browser.text_fields name: "SKU")[@index-1]).present?
          end
        end

        def item_details_header
          ElementWrapper.new (browser.div text: "Items Ordered")
        end

        attr_reader :add_btn

        def initialize param
          super param
          @add_btn = ElementWrapper.new browser.span(css: "span[class*=sdc-icon-add]")
        end

        def expand
          button = ElementWrapper.new (browser.img css: "img[class*='x-tool-expand-bottom']")
          button.safe_click
        end

        def collapse_store_item
          button = ElementWrapper.new (browser.imgs css: "img[class*='x-tool-collapse-top']")[1]
          button.safe_click
        end

        def collapse_item
          button = ElementWrapper.new (browser.img css: "img[class*='x-tool-collapse-top']")
          button.safe_click
        end

        def size
          (browser.divs css: "div[id^=singleorderitem-][id$=-targetEl]").size
        end

        def count
          size
        end

        def store_item
          DetailsStoreItem.new param
        end

        def item number
          logger.info "Item Count: #{size}"

          20.times{
            break if size >= number
            add_btn.safe_click if number > size
            sleep 1
            logger.info "Item Count: #{size}"
          }
          DetailsItem.new(param, number)
        end
      end

      class DetailsCollapsible < Browser::Modal
        attr_reader :field
        def initialize param
          super param
          @field ||= browser.img class: "x-tool-img x-tool-expand-left"
        end

        def present?
          field.present?
        end

        def open
          5.times do
            element_helper.safe_click field
            break unless field.present?
          end
        end
      end

      class DetailsToolbar < Browser::Modal
        class ToolbarMenu < Browser::Modal
          attr_reader :drop_down
          def initialize param
            super param
            @drop_down ||= ElementWrapper.new (browser.spans(css: "span[class*='sdc-icon-more']").first)
          end

          def collapse
            selection = ElementWrapper.new browser.span(text: "Collapse Panel")
            dd = drop_down
            collapsed_details = DetailsCollapsible.new param
            10.times do
              dd.safe_click unless selection.present?
              selection.safe_click
              break if collapsed_details.present?
            end
          end

          def tooltip
            btn = drop_down
            tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
            btn.element.hover
            btn.element.hover
            15.times do
              btn.element.hover
              sleep 1
              if tooltip_element.present?
                logger.info tooltip_element.text
                return tooltip_element.text
              end
            end
          end
        end

        def menu
          ToolbarMenu.new param
        end

        def order_id
          order_id_label = ElementWrapper.new browser.bs(css: "label>b").first
          15.times{
            begin
              order_id_str = order_id_label.text
              sleep 1
              return order_id_str.split('#').last if order_id_str.include? '#'
            rescue
              #ignroe
            end
          }

          "Unable to obtain Order ID from Single Order Details Form".should eql ""
        end
      end

      class DetailsFooter < Browser::Modal
        attr_reader :label
        def initialize param
          super param
          @label ||= ElementWrapper.new browser.strong(text: 'Total Ship Cost:')
        end

        def total_ship_cost
          cost_label = ElementWrapper.new browser.label(css: "div[id^=singleOrderDetailsForm]>div>div>div>label[class*=total_cost]")
          10.times do
            begin
              cost = cost_label.text
              logger.info "Single Order Details Total Cost is #{cost}"
              break if cost.include? "$"
            rescue
              #ignore
            end
          end
          ParameterHelper.remove_dollar_sign cost_label.text
        end

        def multiple_order_cost
          cost_label = ElementWrapper.new (browser.labels css: "label[class*=total_cost]")[1]
          10.times do
            begin
              cost = cost_label.text
              logger.info "Cost is #{cost}"
            rescue
              #ignore
            end
            break unless cost.include? "$"
          end
          ParameterHelper.remove_dollar_sign cost_label.text
        end
      end

      class SingleOrderDetails < DetailsElement
        attr_reader :body, :insure_for, :ship_from, :toolbar, :ship_to, :weight, :service, :tracking, :dimensions,
                    :footer, :customs, :item_grid, :reference_no, :collapsed_details

        def initialize param
          super param
          @body = ElementWrapper.new browser.div(css: "div[id^=singleOrderDetailsForm][id$=body]")
          @insure_for ||= DetailsInsureFor.new param
          @ship_from ||= ShipFromAddress.new param
          @toolbar ||= DetailsToolbar.new param
          @ship_to ||= ShipTo.new param
          @weight ||= Weight.new param
          @service ||= DetailsService.new param
          @tracking ||= DetailsTracking.new param
          @dimensions ||= Dimensions.new param
          @footer ||= DetailsFooter.new param
          @customs ||= OrdersCustomsFields.new param
          @item_grid ||= DetailsItemGrid.new param
          @reference_no ||= TextBoxElement.new browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(10)>div>div>div>div>div>div>input")
          @collapsed_details = DetailsCollapsible.new param
        end

        def present?
          body.present?
        end

        def wait_until_present *args
          body.safely_wait_until_present *args
        end

        def expand
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        end

        def item line_item
          DetailsItem.new param, line_item
        end

        # ------------------------check if below are valid

        def items_count
          begin
            count = (browser.text_fields css: "div[id^=singleorderitem][id$=innerCt]").size
            logger.info "Order Details Item Count: #{count}"
            count
          rescue
            0
          end
        end

        def add_item
          add_item = ElementWrapper.new browser.span text: "Add Item"
          "Add Item button is not present in Order Details form!".should be "" unless add_item.present?
          count = items_count
          5.times do
            add_item.safe_click
            sleep 1
            return if items_count == count + 1
          end
        end

        def auto_suggest_name_array
          browser.divs css: 'div[class*=main-title]'
        end

        def auto_suggest_location_array
          browser.divs css: 'div[class*=sub-title]'
        end

        def pounds_max_value
          pounds_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
        end

        def pounds_qtip_error_displayed?(message) # "The maximum value for this field is 70"
          pounds_qtip_error.include?(message)
        end

        def pounds_qtip_error
          pounds_textbox.attribute_value('data-errorqtip')
        end

        def ounces_qtip_error
          ounces_textbox.attribute_value('data-errorqtip')
        end

        def ounces_max_value
          ounces_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
        end

        def validate_address_link
          browser.span text: 'Validate Address'
        end

      end
    end
  end
end