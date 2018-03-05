module Stamps
  module Orders
    module ShipFrom
      #todo-Rob move ManageShippingAddresses modal to stamps.orders.modals.manage_shipping_addresses
      module WindowTitle
        def window_title
          if cache[:window_title].nil? || !cache[:window_title].present?
            cache[:window_title] = StampsField.new(browser.div(css: 'div[class*=x-window-header-title-default]>div'))
          end
          cache[:window_title]
        end
      end

      class ManageShippingAddresses < Browser::Base
        include WindowTitle
        def edit_button
          if cache[:edit_button].nil? || !cache[:edit_button].present?
            cache[:edit_button] = StampsField.new(browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)"))
          end
          cache[:edit_button]
        end

        def add_button
          if cache[:add_button].nil? || !cache[:add_button].present?
            cache[:add_button] = StampsField.new(browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)"))
          end
          cache[:add_button]
        end

        def close_button
          cache[:close_button] = StampsField.new(browser.span(css: "span[class*=sdc-icon-_mobile-close-light]")) if cache[:close_button].nil? || !cache[:close_button].present?
          cache[:close_button]
        end

        def delete_button
          if cache[:delete_button].nil? || !cache[:delete_button].present?
            cache[:delete_button] = StampsField.new browser.link(css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)")
          end
          cache[:delete_button]
        end

        def present?
          add_button.present?
        end

        def grid_cell(row, column)
          browser.td(css: "div[id^=grid-][class*=x-panel-body-default]>div>div>table:nth-child(#{row.to_i})>tbody>tr>td:nth-child(#{column.to_i})")
        end

        def grid_cell_text(row, column)
          StampsField.new(grid_cell(row, column)).text
        end

        def checked?(row)
          begin
            browser.tables(css: "[id^=manageShipFromWindow-][id$=-body][class*=closable] table").each_with_index do |grid_row_item, index|
              return grid_row_item.attribute_value("class").include?('selected') if row == index + 1
            end
          rescue
            #ignore
          end
          false
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
            if (grid_name.casecmp(name) == 0) && (grid_company.casecmp(company) == 0) && (grid_city.casecmp(city) == 0)
              logger.info "Match found! - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
              return row
            else
              logger.info "No match - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
            end
          end
          0
        end

        def delete(*args)
          case args.length
            when 1
              if args.first.is_a? Hash
                #delete_row(locate_ship_from(args.first[:full_name], args.first['company'], args.first['city']))
                select_row(locate_ship_from(args.first[:full_name], args.first['company'], args.first['city']))
                delete_row
              else
                expect("Address format is not yet supported for this delete call.").to eql ""
              end

            else
              expect("Parameter Exception: Paramter not supported.").to eql ""
          end
        end

        def delete_row
          delete_button.click
          window_title.click
        end

        def address_located?(*args) #name, company, city)
          case args.length
            when 1
              if args[0].is_a? Hash
                address_hash = args[0]
                name = address_hash[:full_name]
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

        def select_row(row_num)
          click_row_until_selected(row_num, "class", "x-grid-item-selected")
          window_title.click
        end

        def click_row_until_selected(row_num, attibute, attribute_value)
          cell = StampsField.new(grid_cell(row_num, 1))
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
          shipping_address_count == 1
        end

        def close_window
          close_button.click_while_present
        end

        def wait_until_present(*args)
          add_button.wait_until_present(*args)
        end

        def shipping_address_count
          wait_until_present
          browser.tables(css: "[id^=grid-][class*=panel-body] table[class*=x-grid-item]").size
        end
      end

      #todo-Rob REW
      class AddShippingAddress < Browser::Base


        attr_accessor :address_hash

        def save_btn
          cache[:save_btn] = StampsField.new(browser.span(text: 'Save')) if cache[:save_btn].nil? || !cache[:save_btn].present?
          cache[:save_btn]
        end

        def origin_zip
          cache[:origin_zip] = StampsTextbox.new(browser.text_field(name: 'OriginZip')) if cache[:origin_zip].nil? || !cache[:origin_zip].present?
          cache[:origin_zip]
        end

        def name
          cache[:name] = StampsTextbox.new(browser.text_field(name: 'FullName')) if cache[:name].nil? || !cache[:name].present?
          cache[:name]
        end

        def company
          cache[:company] = StampsTextbox.new(browser.text_field(name: 'Company')) if cache[:company].nil? || !cache[:company].present?
          cache[:company]
        end
        def street_address_1
          cache[:street_address_1] = StampsTextbox.new(browser.text_field name: 'Street1') if cache[:street_address_1].nil? || !cache[:street_address_1].present?
          cache[:street_address_1]
        end
        def street_address_2
          cache[:street_address_2] = StampsTextbox.new(browser.text_field name: 'Street2') if cache[:street_address_2].nil? || !cache[:street_address_2].present?
          cache[:street_address_2]
        end
        def city
          cache[:city] = StampsTextbox.new(browser.text_field(name: 'City')) if cache[:city].nil? || !cache[:city].present?
          cache[:city]
        end
        def state
          cache[:state] = StampsDropdown.new(textbox, dropdown, :li) if cache[:state].nil? || !cache[:state].present?
          cache[:state]
        end
        def zip
          cache[:zip] = StampsTextbox.new(browser.text_field(name: 'Zip')) if cache[:zip].nil? || !cache[:zip].present?
          cache[:zip]
        end
        def phone
          cache[:phone] = StampsTextbox.new(browser.text_field(name: "Phone")) if cache[:phone].nil? || !cache[:phone].present?
          cache[:phone]
        end

        private def dropdown
          browser.div(css: "div[id^=statecombobox-][id$=-trigger-picker]")
        end

        private def textbox
          browser.text_field(css: 'input[id^=statecombobox-][id$=-inputEl]')
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
          name.set(table[:full_name])
          company.set(table['company'])
          street_address_1.set(table["street_address"])
          street_address_2.set(table["street_address2"])
          city.set(table['city'])
          state.select(table["state"])
          zip.set(table["zip"])
          phone.set(table[:phone])
          save
        end

        def save
          save_btn.click_while_present
          expect(save_btn.present?).not_to be(true), "Add Shipping Address failed to save Return Address: #{address_hash.each do |key, value| "#{key}:#{value}" end}"
        end

      end

      class DeleteShippingAddress < Browser::Base


        def window_title
          cache[:window_title] = StampsField.new(browser.div(text: "Delete Shipping Address")) if cache[:window_title].nil? || !cache[:window_title].present?
          cache[:window_title]
        end

        def delete_btn
          if cache[:delete_btn].nil? || !cache[:delete_btn].present?
            cache[:delete_btn] = StampsField.new(browser.a(css: 'div[id^=dialoguemodal-][class*=closable] div[class*=x-panel-default-docked-bottom] a'))
          end
          cache[:delete_btn]
        end

        def present?
          window_title.present?
        end

        def close_btn
          if cache[:close_btn].nil? || !cache[:close_btn].present?
            cache[:close_btn] = StampsField.new(browser.fields(css: 'img[class$=close]').last)
          end
          cache[:close_btn]
        end

        def close
          close_btn.click if close_btn.present?
        end

        def message_field
          if cache[:message_field].nil? || !cache[:message_field].present?
            cache[:message_field] = StampsField.new(browser.div(css: "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"))
          end
          cache[:message_field]
        end
      end

    end
  end
end