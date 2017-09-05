module Stamps
  module Orders
    module ShipFrom
      class ManageShippingAddresses < Browser::StampsModal
        attr_reader :edit_button, :add_button, :window_title, :close_button, :delete_button, :add_shipping_address

        def initialize(param)
          super
          @edit_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)")
          @add_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)")
          @window_title = StampsElement.new browser.div(css: 'div[class*=x-window-header-title-default]>div')
          @close_button = StampsElement.new browser.image(css: "img[class*='x-tool-close']")
          @delete_button = StampsElement.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)")
          @add_shipping_address = AddShippingAddress.new(param)
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
              if args.first.is_a? Hash
                delete_row(locate_ship_from(args.first['full_name'], args.first['company'], args.first['city']))
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

        def address_located?(*args) #name, company, city)
          case args.length
            when 1
              if args[0].is_a? Hash
                address_hash = args[0]
                name = address_hash['full_name']
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

      class AddShippingAddress < Browser::StampsModal
        attr_reader :save_btn, :origin_zip, :name, :company, :street_address_1, :street_address_2, :city, :state, :zip, :phone
        attr_accessor :address_hash

        def initialize(param)
          super
          @save_btn = StampsElement.new browser.span(text: 'Save')
          @origin_zip = StampsTextBox.new browser.text_field(name: 'OriginZip')
          @name = StampsTextBox.new(browser.text_field(name: 'FullName'))
          @company = StampsTextBox.new(browser.text_field(name: 'Company'))
          @street_address_1 = StampsTextBox.new(browser.text_field name: 'Street1')
          @street_address_2 = StampsTextBox.new(browser.text_field name: 'Street2')
          @city = StampsTextBox.new(browser.text_field(name: 'City'))

          dropdown = browser.div(css: "div[id^=statecombobox-][id$=-trigger-picker]")
          textbox = browser.text_field(css: 'input[id^=statecombobox-][id$=-inputEl]')
          @state = StampsDropDown.new(textbox, dropdown, :li)

          @zip = StampsTextBox.new(browser.text_field(name: 'Zip'))
          @phone = StampsTextBox.new(browser.text_field(name: "Phone"))
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
          name.set(table['full_name'])
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
          expect(save_btn.present?).not_to be(true), "Add Shipping Address failed to save Return Address: #{address_hash.each do |key, value| "#{key}:#{value}" end}"
        end

      end

      class DeleteShippingAddress < Browser::StampsModal

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