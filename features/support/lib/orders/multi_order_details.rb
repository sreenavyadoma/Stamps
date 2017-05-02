module Stamps
  module Orders
    module MultiOrderDetails
      class MultiOrderDetailsForm < Browser::StampsModal
        attr_reader :ship_from_multi, :weight, :domestic_service, :int_service, :insurance, :tracking, :dimensions, :buttons, :manage_shipping_add, :add_shipping_add, :delete_shipping_add

        def initialize(param)
          super(param)
          @ship_from_multi = MultiShipFromAddress.new(param)
          @weight = MultiOrderDetailsWeight.new(param)
          @domestic_service = MultiDomesticService.new(param)
          @int_service = MultiInternationalService.new(param)
          @insurance = MultiDetailsInsureFor.new(param)
          @tracking = MultiOrderDetailsTracking.new(param)
          @dimensions = MultiOrderDetailsDimensions.new(param)
          @buttons = MultiUpdateController.new(param)
          @manage_shipping_add = MultiManageShippingAddresses.new(param)
          @add_shipping_add = MultiAddShippingAddress.new(param)
          @delete_shipping_add = MultiDeleteShippingAddress.new(param)
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
        private
        def order_count_label
          browser.ps(css: 'b').last
        end

        public
        def order_count
          expect(order_count_label).to be_present
          StampsElement.new(order_count_label).text.gsub(/\d+/).first.to_i
        end
      end
   end

      class MultiShipFromAddress < Browser::StampsModal
          attr_reader :drop_down, :text_box, :blur_element, :manage_shipping_add

          def initialize(param)
            super(param)
            @text_box = StampsTextbox.new browser.text_field(name: "ShipFrom")
            @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(3)>div>div>div>div[id^=shipfromdroplist][id$=bodyEl]>div>div[id$=picker]")
            @manage_shipping_add = MultiManageShippingAddresses.new(param)
            @blur_element = BlurOutElement.new(param)
          end

          def blur_out
            blur_element.blur_out
          end

          def selection_element(str)
            if str.downcase.include?('default')
              selection = browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0]
            else
              # verify str is in Ship-From drop-down list of values
              lovs = []
              browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*='x-boundlist-item']").each_with_index { |element, index| lovs[index] = element.text }
              expect(lovs).to include(/#{str}/), "Ship From drop-down list of values: #{lovs} does not include #{str}"
              selection = browser.lis(text: /#{str}/)
            end
            StampsElement.new(selection)
          end

          def select(str)
            return manage_shipping_add if manage_shipping_add.present?
            drop_down.click

            if str.downcase.include?("manage shipping")
              15.times do
                selection = selection_element(str)
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return manage_shipping_add if manage_shipping_add.present?
                expect(manage_shipping_add).to be_present, "Manage Shipping Address modal did not come up."
              end
            else
              10.times do
                selection = selection_element(str)
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return if (str.downcase.include?('default'))?text_box.text.size>0:text_box.text.include?(str)
              end
            end
            expect(text_box.text).to include(str), "Unable to select Ship-From selection #{str}"
          end
      end

      class MultiOrderDetailsWeight < Browser::StampsModal
        attr_reader :lb, :oz
        def initialize(param)
          super(param)
          text_box = browser.text_field(name: 'WeightLbs')
          inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=down]")
          @lb = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: 'WeightOz')
          inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=down]")
          @oz = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)
        end
      end

      class MultiDomesticService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(5)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
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
              selection.scroll_into_view
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
          expect(text_box.text).to include(substr)
          text_box.text
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

      class MultiInternationalService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=intlService]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(6)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
          @blur_element = BlurOutElement.new(param)
        end

      end

      class MultiDetailsInsureFor < Browser::StampsModal
        attr_reader :text_box, :increment_trigger, :decrement_trigger, :blur_element, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div>div>[id^=combo-][id$=-inputEl]")
          @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(7)>div>div>div>div[id^=combo-][id$=bodyEl]>div>div[id$=picker]")
          @decrement_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")
          @blur_element = BlurOutElement.new(param)
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

      end

      class MultiOrderDetailsTracking < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(name: 'Tracking')
          @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
          @blur_element = BlurOutElement.new(param)
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

        # todo-rob Details Tracking selection fix
        def select(str)
          expect(drop_down).to be_present
          20.times do
            selection = StampsElement.new(tracking_selection(str).first)
            drop_down.click unless selection.present?
            selection.click
            break if text_box.text.include?(str)
          end
          expect(text_box.text).to include(str)
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

      class MultiOrderDetailsDimensions < Browser::StampsModal
        attr_reader :length, :width, :height
        def initialize(param)
          super(param)
          text_box = browser.text_field(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Length]")
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=down]")
          @length = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Width]")
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=down]")
          @width = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(css: 'div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Height]')
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=down]")
          @height = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)
        end

        def present?
          length.present? && width.present? && height.present?
        end
      end

      class MultiUpdateController < Browser::StampsModal
        attr_reader :update_orders_btn, :save_as_present_btn, :updating_orders

        def initialize(param)
          super(param)
          @update_orders_btn = StampsElement.new browser.span(text: 'Update Orders')
          @save_as_present_btn = StampsElement.new browser.span(text: 'Save as Preset')
          @updating_orders = StampsElement.new(browser.div(text: "Updating Orders"))
        end

        def present?
          update_orders_btn.present?
        end

        def update_orders
          update_orders_btn.click
          expect(updating_orders).to be_present
          updating_orders.wait_while_present(2.5)
        end

        def save_as_present_btn
          5.times do
            return view_restrictions if view_restrictions.present?
            restrictions_btn.click
          end
        end
      end

      class BlurOutElement < Browser::StampsModal
        attr_reader :element

        def initialize(param)
          super(param)
          @element= StampsElement.new browser.label(text: 'Insurance')
        end

        def blur_out
          2.times do
            element.click
            element.double_click
            element.click
          end
        end
      end

      class MultiManageShippingAddresses < Browser::StampsModal
        attr_reader :edit_button, :add_button, :window_title, :close_button, :delete_button, :add_shipping_address

        def initialize(param)
          super(param)
          @edit_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)")
          @add_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)")
          @window_title = StampsElement.new browser.div(css: 'div[class*=x-window-header-title-default]>div')
          @close_button = StampsElement.new browser.image(css: "img[class*='x-tool-close']")
          @delete_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)")
          @add_shipping_address = MultiAddShippingAddress.new(param)
        end

        def present?
          add_button.present?
        end

        def grid_cell(row, column)
          browser.td css: "div[id^=grid-][class*=x-panel-body-default]>div>div>table:nth-child(#{row.to_i})>tbody>tr>td:nth-child(#{column.to_i})"
        end

        def grid_cell_text(row, column)
          StampsElement.new(grid_cell(row, column)).text
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

        def locate_ship_from(name, company, city)
          rows = shipping_address_count
          1.upto rows do |row|
            window_title.click
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
          delete_button.click
          window_title.click
        end

        def delete(*args)
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

        def delete_row(number)
          @delete_shipping_address = DeleteShippingAddress.new(param)
          5.times do
            select_row(number)
            click_delete_button
            break if @delete_shipping_address.present?
          end
          @delete_shipping_address.delete
          @delete_shipping_address.close if @delete_shipping_address.present?
          self
        end

        def add
          5.times do
            begin
              return add_shipping_address if add_shipping_address.present?
              add_button.click
              add_shipping_address.wait_until_present(3)
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
              return add_shipping_address if add_shipping_address.present?
            end
          end
          expect("Row: #{row_num}").to eql "Unable to Select name: #{name}, company: #{company}, city: #{city}"
        end

        def select_row(row_num)
          click_row_until_selected(row_num, "class", "x-grid-item-selected")
          window_title.click
        end

        def click_row_until_selected(row_num, attibute, attribute_value)
          cell = StampsElement.new(grid_cell(row_num, 1))
          5.times do
            begin
              cell.click
              break if checked?(row_num)
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
                window_title.click
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
          close_button.click_while_present
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

      class MultiAddShippingAddress < Browser::StampsModal
        attr_reader :save_btn, :origin_zip, :name, :company, :street_address_1, :street_address_2, :city, :state, :zip, :phone
        attr_accessor :address_hash

        def initialize(param)
          super(param)
          @save_btn = StampsElement.new browser.span(text: 'Save')
          @origin_zip = StampsTextbox.new browser.text_field(name: 'OriginZip')
          @name = StampsTextbox.new(browser.text_field(name: 'FullName'))
          @company = StampsTextbox.new(browser.text_field(name: 'Company'))
          @street_address_1 = StampsTextbox.new(browser.text_field name: 'Street1')
          @street_address_2 = StampsTextbox.new(browser.text_field name: 'Street2')
          @city = StampsTextbox.new(browser.text_field(name: 'City'))
          @state = StampsOldDropDown.new(browser.div(css: "div[id^=statecombobox-][id$=-trigger-picker]"), :li, browser.text_field(css: 'input[id^=statecombobox-][id$=-inputEl]'))
          @zip = StampsTextbox.new(browser.text_field(name: 'Zip'))
          @phone = StampsTextbox.new(browser.text_field(name: "Phone"))
        end

        def present?
          origin_zip.present?
        end

        def wait_until_present(*args)
          origin_zip.wait_until_present(*args)
        end

        def ship_from_address(table)
          @address_hash = table
          origin_zip.set table["ship_from_zip"]
          name.set(table['name'])
          company.set(table['company'])
          street_address_1.set(table["street_address"])
          street_address_2.set(table["street_address2"])
          city.set(table['city'])
          state.select(table["state"])
          zip.set(table["zip"])
          phone.set(table['phone'])
          save
        end

        def save
          save_btn.click_while_present
          expect(save_btn).not_to be_present, "Add Shipping Address failed to save Return Address: #{address_hash.each do |key, value| "#{key}:#{value}" end}"
        end

      end

      class MultiDeleteShippingAddress < Browser::StampsModal

        def window_title
          browser.div(text: "Delete Shipping Address")
        end

        def delete
          del_btn = StampsElement.new(browser.elements(text: 'Delete').last)
          5.times do
            del_btn.click
            break unless present?
          end
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
      end

    end
  end
end