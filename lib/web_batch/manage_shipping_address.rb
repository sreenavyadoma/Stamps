module Batch
  class ManageShippingAddresses < BrowserObject
    public

    def name(row)
      grid_cell_text row, 1
    end

    def company(row)
      grid_cell_text row, 2
    end

    def city(row)
      grid_cell_text row, 3
    end

    def state(row)
      grid_cell_text row, 4
    end

    def row_number(name, company, city)
      rows = shipping_address_count
      1.upto(rows) do |row|
        grid_name = name row
        grid_company = company row
        grid_city = city row
        grid_state = state row
        found = (grid_name.casecmp(name)==0) && (grid_company.casecmp(company)==0) && (grid_city.casecmp(city)==0)
        if found
          log "Match found! - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
          return row
        else
          log "No match - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
        end
      end
      0
    end

    def window_present?
      browser_helper.field_present?  add_button
    end

    def add
      @shipping_address_form = AddShippingAdress.new(@browser)
      5.times {
        begin
          break if @shipping_address_form.present?
          browser_helper.click add_button, "add_button"
          add_button.wait_until
        rescue
          #ignore
        end
      }
    end

    def add_address(*args)
      add
      case args.length
        when 0
          @shipping_address_form
        when 1
          @shipping_address_form.shipping_address = args[0]
          @test_status = locate_address(args[0][:name], args[0][:company], args[0][:city])
          log "Add Status:  #{@test_status?"Success":"Failed"}"
          close_window
        else
          raise "Illegal number of arguments.  "
      end
      self
    end

    def successful?
      @test_status
    end

    def edit_address(name, company, city, new_address_details)
      row_num = row_number(name, company, city)
      if row_num > 0
        select_row row_num
        self.edit new_address_details
      end
      @test_status = locate_address(new_address_details[:name], new_address_details[:company], new_address_details[:city])
      close_window
      self
    end

    def locate_address(name, company, city)
      row_number(name, company, city) > 0
    end

    def edit(*args)
      edit_button.when_present.click
      case args.length
        when 0
          AddShippingAdress.new(@browser)
        when 1
          AddShippingAdress.new(@browser).shipping_address = args[0]
        else
          raise "Illegal number of arguments.  "
      end
      self
    end

    def delete
      begin
        browser_helper.click(delete_button, "Delete") if browser_helper.field_present?  delete_button
      rescue
        #ignore
      end
    end

    def select_row(row_num)
      click_row_until_selected(row_num, "class", "x-grid-item-selected")
    end

    def click_row_until_selected(row_num, attibute, attribute_value)
      cell = grid_cell(row_num, 1)
      5.times do
        begin
          browser_helper.click cell, "cell(#{row_num}, 1)"
          #log_browser_click(cell, attibute, attribute_value)
          break if row_checked? row_num
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
            delete_row 1
            log "Row #{row} :: Deleting row 1..."
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
          break unless browser_helper.field_present? close_button
          browser_helper.click close_button, "Close"
        }
      rescue
        #ignore
      end
    end

    def delete_row(number)
      @delete_shipping_address = DeleteShippingAddress.new(@browser)
      3.times {
        select_row number
        delete
        break if @delete_shipping_address.present?
      }
      @delete_shipping_address.delete
      @delete_shipping_address.close if @delete_shipping_address.present?
    end

    def wait_until_present
      add_button.wait_until_present
    end

    def shipping_address_count
      wait_until_present
      rows = @browser.trs(:css => "div>div[class=x-grid-item-container]:nth-child(2)>table[id^=gridview-][id*=-record-][data-boundview^=gridview]>tbody>tr")
      count = rows.length
      log "Manage Shipping Address:: row count = #{count}"
      count.to_i
    end

    private

    def grid_cell(row, column)
      @browser.td :css => "div>div[class=x-grid-item-container]:nth-child(2)>table[id^=gridview-][id*=-record-][data-recordindex='#{row-1}'][data-boundview^=gridview]>tbody>tr>td:nth-child(#{column})"
    end

    def grid_cell_text(row, column)
      browser_helper.text grid_cell(row, column), "cell(#{row}, #{column})"
    end

    def close_button
      @browser.image :css => "img[class*='x-tool-close']"
    end

    def row_checked?(number)
      field = @browser.table :css => "div>div[class=x-grid-item-container]:nth-child(2)>table[id^=gridview-][id*=-record-][data-recordindex='#{number-1}'][data-boundview^=gridview]"
      checked = field.attribute_value("class").include? "x-grid-item-selected"
      log "Row #{number} checked? #{checked}"
      checked
    end

    def add_button
      @browser.link :css => "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)"
    end

    def edit_button
      @browser.link :css => "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)"
    end


    def delete_button
      @browser.link :css => "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)"
    end

  end
end