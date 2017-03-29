module Stamps
  module Orders
    module Details
      class ShipFromAddress < Browser::StampsModal
        attr_reader :drop_down, :text_box, :manage_shipping_adddress, :blur_element

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(name: "ShipFrom")
          @drop_down = StampsElement.new browser.div(css: "div[id^=shipfromdroplist][id$=trigger-picker]")
          @manage_shipping_adddress = ManageShippingAddresses.new(param)
          @blur_element = BlurOutElement.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def select service
          return manage_shipping_adddress if manage_shipping_adddress.present?

          default_element = browser.li(css: "ul[id^=boundlist-]>li[data-recordindex='0']")

          if service.downcase == "default"
            element = default_element
          elsif service.downcase.include? "manage shipping"
            element = browser.li(text: "Manage Shipping Addresses...")
          else
            element = browser.div(text: "#{service}")
          end

          selection = StampsElement.new element
          service_text = ""
          if service.downcase.include? "manage shipping"
            15.times{
              begin
                drop_down.click unless selection.present?
                selection.safe_scroll_into_view
                selection.click
                sleep(0.35)
                return manage_shipping_adddress if manage_shipping_adddress.present?
              rescue Exception => e
                logger.error e.message
                logger.error e.backtrace.join "\n"
              end
              expect(manage_shipping_adddress.present?).to be(true)
            }
          else
            drop_down.click unless selection.present?
            if selection.present?
              selection.safe_scroll_into_view
              service_text = selection.text
            end
            10.times do
              drop_down.click unless selection.present?
              selection.safe_scroll_into_view
              selection.click
              sleep(0.35)
              text_box_text = text_box.text
              return if text_box_text.include? service_text
            end
          end
          expect("Unable to select service #{service}").to eql ""
        end
      end

      class BlurOutElement < Browser::StampsModal
        attr_reader :element

        def initialize(param)
          super(param)
          @element= StampsElement.new browser.label(text: 'Insure For $:')
        end

        def blur_out
          element.click
          element.safe_double_click
        end
      end

      class ShipToCountry < Browser::StampsModal
        attr_reader :ship_to_dd

        def initialize(param)
          super(param)
          @ship_to_dd = ShipToCountryDropDown.new(param)
        end

        def present?
          drop_down.present?
        end

        def show_address
          ship_to_dd.element.click_while_present
        end

        def text_box
          show_address
          text_field = nil
          text_fields = browser.text_fields(css: "input[name=ShipCountryCode]")
          6.times do
            text_fields.each do |element|
              text_field = element if element.present?
              sleep(0.35)
            end
            break unless text_field.nil?
          end
          text_field.should_not be nil
          expect(text_field.present?).to be(true)
          StampsTextbox.new(text_field)
        end

        def  drop_down
          dd = nil
          dom_dd = browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker")
          int_dd = browser.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div>div>div>div[class*=arrow-trigger]")
          10.times do
            if dom_dd.present?
              dd = dom_dd
              break
            elsif int_dd.present?
              dd = int_dd
              break
            end
            sleep(0.35)
          end
          dd.should_not be nil
          expect(dd.present?).to be(true)
          StampsElement.new(dd)
        end

        def selected?(country)
          text_box.text == country
        end

        def select(country)
          show_address
          dd = drop_down
          text_field = text_box
          logger.info "Select Country #{country}"
          begin
            dd.click
            sleep(0.35)
            dd.click
            dd.click
            lis = browser.lis(text: country)
            expect(lis.size).to be_between(1, 2).inclusive

            case lis.size
              when 1
                selection = StampsElement.new(lis[0])
              when 2
                if lis[0].text.size > 0
                  selection = StampsElement.new(lis[0])
                else
                  selection = StampsElement.new(lis[1])
                end
              else
                expect(lis.size).to be_between(1, 2).inclusive
            end

            10.times do
              break if text_field.text.include?(country)
              dd.click unless selection.present?
              selection.safe_scroll_into_view
              selection.safe_scroll_into_view
              selection.click if selection.present?
              logger.info "Selection #{text_field.text} - #{(text_field.text.include? country)?"was selected": "not selected"}"
              break if text_field.text.include?(country)
              break if text_field.text.include?(country)
            end
            logger.info "#{country} selected."
            expect(text_field.text).to include(country)
          end unless text_field.text.include?(country)
        end
      end

      class ShipToCountryDropDown < Browser::StampsModal
        attr_reader :element
        def initialize(param)
          super(param)
          @element = StampsElement.new browser.span(css: "div[id*=shipto]>a>span>span>span[class*=down]")
        end
      end

      class ShipToInternational < Browser::StampsModal
        attr_reader :name, :company, :address_1, :address_2, :city, :phone, :province, :postal_code, :email, :auto_suggest, :blur_element, :less_link, :ship_to_dd

        def initialize(param)
          super(param)
          @name = StampsTextbox.new(browser.text_field(name: "ShipName"))
          @company = StampsTextbox.new(browser.text_field(name: "ShipCompany"))
          @address_1 = StampsTextbox.new(browser.text_field(name: "ShipStreet1"))
          @address_2 = StampsTextbox.new(browser.text_field(name: "ShipStreet2"))
          @city = StampsTextbox.new(browser.text_field(name: "ShipCity"))
          @phone = StampsTextbox.new(browser.text_field(css: "div#shiptoview-international-targetEl>div>div>div>div>div>div>div>input[name=ShipPhone]"))
          @province = StampsTextbox.new(browser.text_field(name: "ShipState"))
          @postal_code = StampsTextbox.new(browser.text_field(name: "ShipPostalCode"))
          @email = StampsTextbox.new(browser.text_field(css: "div#shiptoview-international-targetEl>div>div>div>div>div>div>div>input[name=BuyerEmail]"))
          @auto_suggest = AutoSuggestInternational.new(param)
          @blur_element = BlurOutElement.new(param)
          @less_link = StampsElement.new(browser.span(css: "div[id*=international]>div>div>div>div>div>div>a[class*=link]>span>span>span[id$=btnInnerEl]"))
          @ship_to_dd = ShipToCountryDropDown.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def present?
          name.present?
        end
      end

      class AutoSuggestPopUp < Browser::StampsModal
        def present?
          name_fields[0].present?
        end

        def size
          browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]").size
        end

        def select number
          selection = StampsElement.new(name_fields[number.to_i-1])
          selection.click
          selection.click
          selection.click
        end

        def name_fields
          browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]")
        end

        def address_fields
          browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=sub]")
        end
      end

      class AutoSuggestInternational < Browser::StampsModal
        #todo-rob FIX ME
        attr_reader :auto_suggest_box

        def initialize(param)
          super(param)
          @auto_suggest_box = AutoSuggestPopUp.new(param)
        end

        def set address
          text_field = self.name

          20.times{
            begin
              text_field.set address
              return auto_suggest_box if auto_suggest_box.present?
              text_field.click
              sleep(0.35)
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.safe_double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue
              #ignore
            end
          }
        end
      end

      class AddressNotFound < Browser::StampsModal
        attr_reader :window_title

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.div(text: 'Exact Address Not Found')
        end

        def present?
          window_title.present?
        end

        def wait_until_present *args
          window_title.wait_until_present *args
        end

        def row number
          row = number.to_i<=0?0:number.to_i-1
          checkbox_field = browser.text_field css: "input[name=addrAmbig][value='#{row}']"

          checkbox = StampsCheckbox.new checkbox_field, checkbox_field, "checked", "checked"
          checkbox.check

          accept_button = StampsElement.new browser.span text: "Accept"
          accept_button.click_while_present
        end

        def set partial_address_hash
          exact_address_not_found_field = browser.div text: 'Exact Address Not Found'
          form = SingleOrderDetails.new(param)
          form.validate_address_link
          country_drop_down = self.country
          form.ship_to.set ParameterHelper.format_address(partial_address_hash)
          30.times {
            begin
              item_label.click
              country_drop_down.drop_down.click
              country_drop_down.drop_down.click
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

      class AmbiguousAddress < Browser::StampsModal
        attr_reader :address_not_found

        def initialize(param)
          super(param)
          @address_not_found = AddressNotFound.new(param)
        end

        def data_error
          text_area.data_error_qtip
        end
      end

      class ShipToTextArea < StampsTextbox
        def full_address
          50.times do
            break if element.attribute_value("value").size > 0
          end
          element.attribute_value("value")
        end

        def recipient_name
          address = full_address
          address_arr = address.split("\n")
          expect(address_arr.size).to be > 2
          address_arr[0].strip
        end

        def company_name
          address = full_address
          address_arr = address.split("\n")
          expect(address_arr.size).to be_between(4, 5).inclusive
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
            expect(address_arr.size).to be > 2
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
            expect(address_arr.size).to be > 2
          end
          last_line_arr = last_line.split(",")
          expect(last_line_arr.size).to equal 2
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
            expect(address_arr.size).to be > 2
          end
          last_line_arr = last_line.split(",")
          expect(last_line_arr.size).to equal 2
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
            expect(address_arr.size).to be > 2
          end
          last_line_arr = last_line.split(",")
          expect(last_line_arr.size).to equal 2
          last_line_arr.last.strip.split(" ").last
        end

        def zip_code
          code = zip_plus_4.split("-")
          expect(code.size).to equal 2
          code.first
        end
      end

      class ShipToDomestic < Browser::StampsModal
        attr_reader :ambiguous, :auto_suggest, :less_link, :ship_to_dd , :blur_element,
                    :address_not_found

        def initialize(param)
          super(param)
          @less_link = StampsElement.new browser.span(css: "div[id*=domestic]>div>div>div>div>div>div>a[class*=link]>span>span>span[id$=btnInnerEl]")
          @ship_to_dd  = ShipToCountryDropDown.new(param)
          @blur_element = BlurOutElement.new(param)
          @address_not_found = AddressNotFound.new(param)
          @text_area = ShipToTextArea.new browser.textarea(name: "freeFormAddress")
          @email = StampsTextbox.new browser.text_field(name: 'BuyerEmail')
          @phone = StampsTextbox.new browser.text_field(name: "ShipPhone")

          @ambiguous = AmbiguousAddress.new(param)
          @auto_suggest = AutoSuggestDomestic.new(param, @text_area)
        end

        def text_area
          show_address
          @text_area
        end

        def email
          show_address
          @email
        end

        def phone
          show_address
          @phone
        end

        def blur_out
          blur_element.blur_out
        end

        def present?
          dom_text_area.present?
        end

        def less
          less_link.click_while_present
        end

        def show_address
          ship_to_dd.element.click_while_present
        end

        def set address
          10.times do
            begin
              text_area.set address
              15.times do
                blur_out
                break if less_link.present?
              end
              break if less_link.present?
            rescue Exception => e
              logger.error e.message
              logger.error e.backtrace.join("\n")
              expect("Unable to Ship-To address to #{address}. Error: #{e.message}").to eql "Set Ship-To Address Failed"
            end
          end
          expect(text_area.text).to include address.split(" ").last
        end

        def set_ambiguous address
          10.times do
            text_area.set address
            blur_out
            address_not_found.wait_until_present 4
            return address_not_found if address_not_found.present?
          end
          expect("Exact Address Not Found module did not appear.").to eql ""
        end
      end

      class AutoSuggestDomestic < Browser::StampsModal
        attr_reader :text_area, :auto_suggest_box
        def initialize(param, text_area)
          super(param)
          @text_area = text_area
          @auto_suggest_box = AutoSuggestPopUp.new(param)
        end

        def set(address)
          20.times{
            begin
              text_area.set address
              return auto_suggest_box if auto_suggest_box.present?
              text_area.click
              sleep(0.35)
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.safe_double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue Exception => e
              logger.error e.message
              logger.error e.backtrace.join("\n")
            end
          }
        end
      end

      class ShipTo < Browser::StampsModal
        attr_reader :country, :international, :domestic
        def initialize(param)
          super(param)
          @country = ShipToCountry.new(param)
          @domestic = ShipToDomestic.new(param)
          @international = ShipToInternational.new(param)
        end
      end

      class AddEditShipFromModal < Browser::StampsModal
        attr_reader :save_button, :origin_zip

        def initialize(param)
          super(param)
          @save_button = StampsElement.new browser.span(text: 'Save')
          @origin_zip = StampsTextbox.new browser.text_field(name: 'OriginZip')
        end

        def present?
          browser.div(text: "Edit Shipping Address").present? || browser.div(text: "Add Shipping Address").present?
        end

        def wait_until_present *args
          browser.div(text: "Edit Shipping Address").wait_until_present(*args) if browser.div(text: "Edit Shipping Address").present?
          browser.div(text: "Add Shipping Address").wait_until_present(*args) if browser.div(text: "Add Shipping Address").present?
        end

        def ship_from_address table
          origin_zip.set table["ship_from_zip"]
          name table['name']
          company table['company']
          street_address1 table["street_address"]
          street_address2 table["street_address2"]
          city table['city']
          state.select table["state"]
          zip table["zip"]
          phone table['phone']
          save
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
          text_box = browser.text_field(css: 'input[id^=statecombobox-][id$=-inputEl]')
          dd = browser.div(css: "div[id^=statecombobox-][id$=-trigger-picker]")
          StampsDropDown.new(dd, :li, text_box)
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
              element_helper.click save_button
              sleep(0.35)
              break unless save_button.present?
            rescue
              #ignore
            end
          }
        end

      end

      class DeleteShippingAddress < Browser::StampsModal

        def window_title
          browser.div text: "Delete Shipping Address"
        end

        def delete
          5.times {
            begin
              logger.info "Delete Shipping Address :: #{message_field.text}"
              element_helper.click delete_button
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

      class ViewRestrictions < Browser::StampsModal
        def browser_ok_button
          StampsElement.new browser.span text: "OK"
        end

        def present?
          browser_ok_button.present?
        end

        def ok
          browser_ok_button.click
        end
      end

      class ManageShippingAddresses < Browser::StampsModal
        attr_reader :edit_button, :add_button, :window_title, :close_button, :delete_button, :shipping_address

        def initialize(param)
          super(param)
          @edit_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)")
          @add_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)")
          @window_title = StampsElement.new browser.div(css: 'div[class*=x-window-header-title-default]>div')
          @close_button = StampsElement.new browser.image(css: "img[class*='x-tool-close']")
          @delete_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)")
          @shipping_address = AddEditShipFromModal.new(param)
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
          sleep(0.35)
          grid_cell_text row, 1
        end

        def company row
          sleep(0.35)
          grid_cell_text row, 2
        end

        def city row
          sleep(0.35)
          grid_cell_text row, 3
        end

        def state row
          sleep(0.35)
          grid_cell_text row, 4
        end

        def locate_ship_from name, company, city
          rows = shipping_address_count
          1.upto rows do |row|
            element_helper.click window_title
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
            element_helper.click delete_button if delete_button.present?
            element_helper.click window_title
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
                expect("Address format is not yet supported for this delete call.").to eql ""
              end

            else
              expect("Parameter Exception: Paramter not supported.").to eql ""
          end
        end

        def delete_row number
          @delete_shipping_address = DeleteShippingAddress.new(param)
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
              return shipping_address if shipping_address.present?
              add_button.click
              shipping_address.wait_until_present 3
            rescue Exception => e
              logger.error e.message
              logger.error e.backtrace.join("\n")
              #ignore
            end
          end
          expect("Unable to open Add Shipping Address modal.").to eql "Add Shipping Address"
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
                expect("Wrong number of arguments for locate_address").to eql "" unless args.length == 3
              end
            when 3
              name = args[0]
              company = args[1]
              city = args[2]
            else
              expect("Wrong number of arguments for locate_address").to eql "" unless args.length == 3
          end
          locate_ship_from(name, company, city) > 0
        end

        def select_address(name, company, city)
          row_num = locate_ship_from(name, company, city)
          if row_num > 0
            select_row row_num
            15.times do
              edit_button.click
              return shipping_address if shipping_address.present?
            end
          end
          expect("Row: #{row_num}").to eql "Unable to Select name: #{name}, company: #{company}, city: #{city}"
        end

        def select_row(row_num)
          click_row_until_selected(row_num, "class", "x-grid-item-selected")
          element_helper.click window_title
        end

        def click_row_until_selected(row_num, attibute, attribute_value)
          cell = grid_cell(row_num, 1)
          5.times do
            begin
              element_helper.click cell
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
                element_helper.click window_title
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
              sleep(0.35)
              break unless close_button.present?
              element_helper.click close_button
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

      class DetailsService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm][id$=targetEl]>div>div>div>div>div>div>div>input[id^=service]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]"))
          @blur_element = BlurOutElement.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def select(str)
          logger.info "Select service #{str}"

          sel_arr = str.split(/\s+/)
          substr = (sel_arr.size>=2?"#{sel_arr[0]} #{sel_arr[1]}":"#{sel_arr[0]}")

          selection = StampsElement.new browser.td(css: "li##{data_for(:orders_services, {})[str]}>table>tbody>tr>td.x-boundlist-item-text")

          20.times do
            begin
              drop_down.click unless selection.present?
              selection.safe_scroll_into_view
              selection.click
              blur_out
              logger.info "Selected service #{text_box.text} - #{(text_box.text.include? str)?"success": "service not selected"}"
              break if text_box.text.include?(substr)
            rescue
              #ignore
            end
          end
          logger.info "#{text_box.text} service selected."

          # Test if selected service includes abbreviated selection.
          expect(text_box.text).to include substr
          text_box.text
        end

        def inline_cost(service_name)
          cost_label = StampsElement.new(browser.td(css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"))
          10.times do
            begin
              drop_down.click unless cost_label.present?
              if cost_label.present?
                service_cost = ParameterHelper.remove_dollar_sign(cost_label.text)
                logger.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                drop_down.click if cost_label.present?
                return service_cost.to_f.round(2)
              end
            rescue
              #ignore
            end
          end
        end

        def cost_label
          labels = browser.label(text: "Service:").parent.labels
          cost_element = nil
          labels.each do |label|
            cost_element = label if label.text.include?('.')
          end
          cost_element
        end

        def cost
          ParameterHelper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def tooltip(selection)
          button = drop_down
          selection_label = StampsElement.new(browser.tr(css: "tr[data-qtip*='#{selection}']"))
          10.times {
            begin
              button.click unless selection_label.present?
              sleep(0.35)
              if selection_label.present?
                tooltip = selection_label.attribute_value("data-qtip")
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip if tooltip.include? "<strong>"
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def disabled?(service)

          @details_services = data_for(:orders_services, {})

          selection_field = browser.li(id: "#{@details_services[service]}")
          #selection_element = browser.tr css: "tr[data-qtip*='#{service}']"
          selection_label = StampsElement.new selection_field

          10.times do |index|
            drop_down.click unless selection_label.present?
            sleep(0.35)
            if selection_field.present?
              disabled_field = StampsElement.new(selection_field.parent.parent.parent)
              begin
                if selection_label.present?
                  if disabled_field.present?
                    result = disabled_field.attribute_value("class").include? "disabled"
                    sleep(0.35)
                    result = disabled_field.attribute_value("class").include? "disabled"
                    result = disabled_field.attribute_value("class").include? "disabled"
                    drop_down.click
                    return result
                  end
                end
              rescue
                #ignore
              end
            else
              sleep(0.35)
              return true if index == 5 #try to look for service in service selection drop-down 3 times before declaring it's disabled.
            end
          end
        end

        def enabled? service
          !(disabled? service)
        end
      end

      class InsuranceTermsConditions < Browser::StampsModal
        def present?
          begin
            (browser.divs(text: "Stamps.com Insurance Terms and Conditions").first).present? || browser.spans(text: "I Agree").last.present?
          rescue
            false
          end
        end

        def agree
          10.times do
            begin
              browser.spans(text: "I Agree").each do |button|
                element_helper.click(button)
              end
            rescue
              #ignore
            end
          end
        end

        def cancel
          10.times do
            begin
              browser.spans(text: "Cancel").each do |button|
                element_helper.click(button)
              end
            rescue
              #ignore
            end
          end
        end
      end

      class DetailsInsureFor < Browser::StampsModal
        attr_reader :checkbox, :text_box, :increment_trigger, :decrement_trigger, :terms, :blur_element

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>input[name=InsuredValue]")
          @decrement_trigger = StampsElement.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger = StampsElement.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")

          field = browser.input(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=checkbox-]:nth-child(2)>div>div>input")
          verify = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=checkbox-]:nth-child(2)")
          @checkbox = StampsCheckbox.new(field, verify, "class", "checked")
          @terms = InsuranceTermsConditions.new(param)
          @blur_element = BlurOutElement.new(param)
        end

        def checked?
          checkbox.checked?
        end

        def check
          checkbox.check
        end

        def uncheck
          checkbox.uncheck
        end

        def text
          text_box.text
        end

        def value
          text.to_f if checked?
          0
        end

        def blur_out
          blur_element.blur_out
        end

        def set(value)
          15.times do
            check
            text_box.set(value)
            sleep(0.25)
            3.times {blur_out}
            return true if text.to_f == value.to_f
          end
          expect(text.to_f).to eql(value.to_f)
        end

        def set_and_agree_to_terms(value)
          set(value)
          5.times do
            3.times {blur_out}
            terms.agree if terms.present?
          end
        end

        def increment(value)
          value.to_i.times do
            increment_trigger.click
          end
        end

        def decrement(value)
          value.to_i.times do
            decrement_trigger.click
          end
        end

        def cost_label
          labels = browser.label(text: "Insure For $:").parent.parent.parent.parent.labels
          cost_element = nil
          labels.each do |label|
            cost_element = label if label.text.include?('.')
          end
          cost_element
        end

        def cost
          ParameterHelper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end
      end

      class DetailsTracking < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element, :cost_label
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(name: 'Tracking')
          @drop_down = StampsElement.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
          @blur_element = BlurOutElement.new(param)
          @cost_label = StampsElement.new(browser.label(css: "label[class*='selected_tracking_cost']"))
        end

        def present?
          text_box.present?
        end

        def blur_out
          blur_element.blur_out
        end

        def tracking_selection(selection)
          if selection.downcase.include? "usps"
            browser.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td")
          elsif selection.downcase.include? "signature"
            browser.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td")
          elsif selection.downcase.include? "none"
            browser.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td")
          else
            expect("#{selection} is not a valid selection").to eql "Valid selections are USPS Tracking and Signature Required"
          end
        end

        def select(selection)
          expect(drop_down.present?).to be(true)
          20.times do
            begin
              drop_down.click
              selection_label = tracking_selection(selection).first
              drop_down.click unless selection_label.present?
              element_helper.click selection_label
              break if text_box.text.include? selection
            rescue Exception => e
              logger.error e.message
              logger.error e.backtrace.join("\n")
              expect("Unable to select Tracking #{selection}. Error: #{e.message}").to eql "Select Tracking #{selection}"
            end
          end
          expect(text_box.text).to include(selection)
        end

        def inline_cost(selection)
          tds = tracking_selection(selection)
          expect(tds.size).to equal 2
          selection_label = StampsElement.new tds.last
          5.times do
            begin
              drop_down.click unless selection_label.present?
              return selection_label.text if selection_label.present?

              drop_down.click
              selection_label = tracking_selection(selection).last
              drop_down.click unless selection_label.present?
              return element_helper.text selection_label if selection_label.present?
            rescue
              #ignore
            end
            expect("Unable to fetch inline cost for #{selection}").to eql "Details - Tracking inline cost"
          end
        end

        def cost
          ParameterHelper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def tooltip(selection)
          selection_label = browser.td(text: selection)
          5.times {
            begin
              drop_down.click unless selection_label.present?
              if selection_label.present?
                qtip = selection_label.parent.parent.parent.parent.attribute_value("data-qtip")
                logger.info "#{qtip}"
                return qtip
              end
            rescue
              #ignore
            end
          }
        end
      end

      class DetailsStoreItem < Browser::StampsModal
      end

      class OrderDetailsWeight < Browser::StampsModal
        attr_reader :lb, :oz
        def initialize(param)
          super(param)
          text_box = browser.text_field(name: 'WeightLbs')
          inc_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=pounds]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=pounds]>div[class*=down]")
          @lb = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: 'WeightOz')
          inc_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=ounces]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=ounces]>div[class*=down]")
          @oz = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn)
        end
      end

      class OrderDetailsDimensions < Browser::StampsModal
        attr_reader :length, :width, :height
        def initialize(param)
          super(param)
          text_box = browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Length]")
          inc_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=down]")
          @length = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn)

          text_box = browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Width]")
          inc_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=down]")
          @width = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn)

          text_box = browser.text_field(css: 'div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Height]')
          inc_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=down]")
          @height = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn)
        end

        def present?
          length.present? && width.present? && height.present?
        end
      end

      class AssociatedOrderItem < Browser::StampsModal
        attr_reader :index, :item_qty, :item_id, :item_description, :delete
        def initialize(param, number)
          super(param)
          @index = number

          text_box = browser.text_fields(name: "Quantity")[@index-1]
          inc_btn = browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index-1]
          dec_btn = browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index-1]
          @item_qty = Stamps::Browser::StampsNumberField.new(param, text_box, inc_btn, dec_btn)

          @item_id = StampsTextbox.new((browser.text_fields(name: "SKU")[index-1]))
          @delete = StampsElement.new(browser.spans(css: "span[class*=sdc-icon-remove]")[index-1])
          @item_description = StampsTextbox.new(browser.text_fields(name: "Description")[index-1])
        end

        def present?
          ((browser.text_fields name: "SKU")[@index-1]).present?
        end
      end

      class ItemsOrderedSection < Browser::StampsModal
        attr_reader :add_btn, :drop_down

        def initialize(param)
          super(param)
          @add_btn = StampsElement.new(browser.span(css: "span[class*=sdc-icon-add]"))
          @drop_down = StampsElement.new(browser.img(css: "div[id^=associatedorderitems-][id$=_header-targetEl]>div>img"))
        end
      
        def expand
          5.times do
            drop_down.click
            break if drop_down.element.attribute_value('class').include?('collapse-top')
          end
        end

        def collapse
          5.times do
            drop_down.click
            break if drop_down.element.attribute_value('class').include?('expand-bottom')
          end
        end

        def size
          browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]").size
        end

        def count
          size
        end

        def item(number)
          associated_item = AssociatedOrderItem.new(param, number)
          10.times do
            return associated_item if associated_item.present?
            sleep(0.5)
            add_btn.click if number > size
            logger.info "Item Count: #{size}"
          end
          associated_item
        end
      end

      class DetailsCollapsible < Browser::StampsModal
        attr_reader :field
        def initialize(param)
          super(param)
          @field = browser.img class: "x-tool-img x-tool-expand-left"
        end

        def present?
          field.present?
        end

        def open
          5.times do
            element_helper.click field
            break unless field.present?
          end
        end
      end

      class ToolbarMenu < Browser::StampsModal
        attr_reader :drop_down
        def initialize(param)
          super(param)
          @drop_down = StampsElement.new(browser.spans(css: "span[class*='sdc-icon-more']").first)
        end

        def collapse
          selection = StampsElement.new browser.span(text: "Collapse Panel")
          dd = drop_down
          collapsed_details = DetailsCollapsible.new(param)
          10.times do
            dd.click unless selection.present?
            selection.click
            break if collapsed_details.present?
          end
        end

        def tooltip
          tooltip_element = StampsElement.new(browser.div id: 'ext-quicktips-tip-innerCt')
          drop_down.element.hover
          drop_down.element.hover
          15.times do
            drop_down.element.hover
            sleep(0.35)
            if tooltip_element.present?
              logger.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      class DetailsToolbar < Browser::StampsModal
        attr_reader :menu

        def initialize(param)
          super(param)
          @menu = ToolbarMenu.new(param)
        end

        def order_id
          order_id_label = StampsElement.new(browser.bs(css: "label>b").first)
          20.times{
            begin
              sleep(0.25)
              return order_id_label.text.split('#').last if order_id_label.text.include? '#'
            rescue
              #ignroe
            end
          }
          expect("Unable to obtain Order ID from Single Order Details Form").to eql ""
        end
      end

      class DetailsFooter < Browser::StampsModal
        attr_reader :label
        def initialize(param)
          super(param)
          @label = StampsElement.new browser.strong(text: 'Total Ship Cost:')
        end

        def total_ship_cost
          cost_label = StampsElement.new browser.label(css: "div[id^=singleOrderDetailsForm]>div>div>div>label[class*=total_cost]")
          10.times do
            begin
              cost = cost_label.text
              logger.info "Single Order Details Total Cost is #{cost}"
              break if cost.include? "$"
            rescue
              #ignore
            end
          end
          ParameterHelper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def multiple_order_cost
          cost_label = StampsElement.new(browser.labels(css: "label[class*=total_cost]")[1])
          10.times do
            begin
              cost = cost_label.text
              logger.info "Cost is #{cost}"
            rescue
              #ignore
            end
            break unless cost.include? "$"
          end
          ParameterHelper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end
      end

      class OrdersCustomsFields < Browser::StampsModal
        attr_reader :customs_form, :view_restrictions, :browser_restrictions_button, :edit_form_btn, :restrictions_btn

        def initialize(param)
          super(param)
          @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
          @view_restrictions = Orders::Details::ViewRestrictions.new(param)
          @edit_form_btn = StampsElement.new browser.span text: 'Edit Form...'
          @restrictions_btn = StampsElement.new browser.span text: 'Restrictions...'
        end

        def edit_form
          10.times do
            return customs_form if customs_form.present?
            edit_form_btn.click
            customs_form.wait_until_present(2)
          end
          expect(customs_form.present?).to be(true)
        end

        def restrictions
          5.times do
            return view_restrictions if view_restrictions.present?
            restrictions_btn.click
          end
          expect(view_restrictions.present?).to be(true)
        end
      end

      class SingleOrderDetails < Browser::StampsModal
        attr_reader :toolbar, :ship_from, :ship_to, :weight, :body, :insure_for, :service, :tracking, :dimensions,
                    :footer, :customs, :items_ordered, :reference_no, :collapsed_details, :blur_element

        def initialize(param)
          super(param)
          @toolbar = DetailsToolbar.new(param)
          @ship_from = ShipFromAddress.new(param)
          @ship_to = ShipTo.new(param)
          @weight = OrderDetailsWeight.new(param)
          @service = DetailsService.new(param)
          @insure_for = DetailsInsureFor.new(param)
          @tracking = DetailsTracking.new(param)
          @reference_no = StampsTextbox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(10)>div>div>div>div>div>div>input"))
          @dimensions = OrderDetailsDimensions.new(param)
          @items_ordered = ItemsOrderedSection.new(param)
          @customs = OrdersCustomsFields.new(param)
          @blur_element = BlurOutElement.new(param)
          @body = StampsElement.new(browser.div(css: "div[id^=singleOrderDetailsForm][id$=body]"))
          @collapsed_details = DetailsCollapsible.new(param)
          @footer = DetailsFooter.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def present?
          body.present?
        end

        def wait_until_present(*args)
          body.wait_until_present(*args)
        end

        def expand
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        end
      end
    end
  end
end