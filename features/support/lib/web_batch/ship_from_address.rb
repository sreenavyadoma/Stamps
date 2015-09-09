module Batch

  class ManageShippingAddresses < BatchObject
    public

    def name(row)
      sleep(1)
      grid_cell_text row, 1
    end

    def company(row)
      sleep(1)
      grid_cell_text row, 2
    end

    def city(row)
      sleep(1)
      grid_cell_text row, 3
    end

    def state(row)
      sleep(1)
      grid_cell_text row, 4
    end

    def locate_address(name, company, city)
      rows = shipping_address_count
      1.upto rows do |row|
        browser_helper.click window_title
        grid_name = name row
        grid_company = company row
        grid_city = city row
        grid_state = state row
        if (grid_name.casecmp(name)==0) && (grid_company.casecmp(company)==0) && (grid_city.casecmp(city)==0)
          log "Match found! - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
          return row
        else
          log "No match - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
        end
      end
      0
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

    def delete *args
      case args.length
        when 1
          address = args[0]
          if address.is_a? Hash
            delete_row(locate_address(address["name"], address["company"], address["city"]))
          else
            raise "Address format is not yet supported for this delete call."
          end

        else
          raise "Parameter Exception: Paramter not supported."
      end
    end

    def delete_row(number)
      @delete_shipping_address = DeleteShippingAddress.new(@browser)
      3.times {
        select_row number
        click_delete_button
        break if @delete_shipping_address.present?
      }
      @delete_shipping_address.delete
      @delete_shipping_address.close if @delete_shipping_address.present?
      self
    end

    def add(*args)
      add_shipping_address_window
      case args.length
        when 0
          AddShippingAdress.new(@browser)
        when 1
          @shipping_address_form = AddShippingAdress.new(@browser)
          address = args[0]
          case address
            when Hash
              @shipping_address_form.shipping_address = address
            else
              raise "Illegal Ship-to argument"
          end
        else
          raise "add_address:  Illegal number of arguments #{args.length}"
      end
    end

    def add_shipping_address_window
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

    def edit_address(name, company, city, new_address_details)
      row_num = locate_address(name, company, city)
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
      locate_address(name, company, city) > 0
    end

    def edit(*args)
      edit_button.when_present.click
      case args.length
        when 0
          AddShippingAdress.new(@browser)
        when 1
          AddShippingAdress.new(@browser).shipping_address = args[0]
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
            browser_helper.click window_title, 'window_title'
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
      log "Manage Shipping Address:: row count = #{rows.length.to_i}"
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

    def row_checked?(row)
      field = @browser.table :css => "div[id^=manageShipFromWindow][class^=x-window-body]>div>div[id$=body]>div[id^=gridview]>div[class=x-grid-item-container]>table[data-recordindex='#{row.to_i-1}']"
      value = browser_helper.attribute_value field, "class"
      checked = value.include? "selected"
      log "Row #{row} selected? #{checked}"
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

  class AddShippingAdress < BatchObject
    public
    def shipping_address=(table)
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

    def origin_zip=(zip)
      browser_helper.set origin_zip_field, zip, "origin_zip"
    end

    def origin_zip
      browser_helper.text origin_zip_field
    end

    def name=(name)
      browser_helper.set name_field, name, "name_field"
    end

    def company=(company)
      browser_helper.set company_field, company, "company_field"
    end

    def street_address1=(street)
      browser_helper.set street_address1_field, street, "street_address1_field"
    end

    def street_address2=(street)
      browser_helper.set street_address2_field, street, "street_address2_field"
    end

    def state_dd_button
      @browser.div :css => "div[id^=statecombobox-][id$=-trigger-picker]"
    end

    def city=(city)
      browser_helper.set city_text_field, city, "state_field"
    end

    def state=(state)
      browser_helper.drop_down @browser, state_dd_button, "li", state_field, state
    end

    def zip=(code)
      browser_helper.set zip_field, code, "zip_field"
    end

    def phone=(number)
      browser_helper.set phone_field, number, "phone_field"
    end

    def save
      5.times{
        begin
          browser_helper.click save_button, "save_button"
          save_button.wait_while_present
          break unless browser_helper.present? save_button
        rescue
          #ignore
        end
      }
    end

    def present?
      save_button.present?
    end

    private
    def origin_zip_field
      @browser.text_field :name => 'OriginZip'
    end

    def name_field
      text_fields = @browser.text_fields :name => 'FullName'
      text_fields.last
    end

    def company_field
      text_fields = @browser.text_fields :name => 'Company'
      text_fields.last
    end

    def street_address1_field
      @browser.text_field :name => 'Street1'
    end

    def street_address2_field
      @browser.text_field :name => 'Street2'
    end

    def city_text_field
      text_fields = @browser.text_fields :name => 'City'
      text_fields.last
    end

    def state_field
      field = @browser.text_field :name => 'State'
      present = browser_helper.present? field
      field
    end

    def zip_field
      @browser.text_field :name => 'Zip'
    end

    def phone_field
      (@browser.text_fields :css => "input[name=Phone]").last
    end

    def save_button
      @browser.span :text => 'Save'
    end

  end



  class DeleteShippingAddress < Stamps::BrowserObject
    public
    def delete
      5.times {
        begin
          log "Delete Shipping Address :: #{message_field.text}"
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

  class AddressNotFound < Stamps::BrowserObject

    private
    def exact_address_not_found_field
      @browser.div :text => 'Exact Address Not Found'
    end

    public
    def present?
      begin
        exact_address_not_found_field.wait_until_present
      rescue
        #ignore
      end
      browser_helper.present? exact_address_not_found_field
    end

    def row=(number=0)
      row = number.to_i<=0?0:number.to_i-1
      rox_input = @browser.input :css => "input[name=addrAmbig][value='#{row}']"
      accept_button = @browser.span :text => 'Accept'
      3.times do
        begin
          rox_input.click
          checked = rox_input.attribute_value("checked")
          rox_input.attribute_value("checked").include? "checked"
          if checked
            accept_button.click
            accept_button.wait_while_present
            break
          end
        rescue
          #ignore
        end
      end
    end

    def set(partial_address_hash)
      single_order_form = SingleOrderFormBase.new(@browser)
      single_order_form.validate_address_link
      single_order_form.expand_ship_to
      single_order_form.browser_ship_to_textbox.set BatchHelper.instance.format_address(partial_address_hash)
      5.times {
        begin
          item_label.click
          break if (browser_helper.present?  exact_address_not_found_field) || (browser_helper.present?  single_order_form.validate_address_link)
        rescue
          #ignore
        end
      }
      single_order_form.less
      self
    end
  end


end