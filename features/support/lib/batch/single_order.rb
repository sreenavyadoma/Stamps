module Batch

  class OrderDetails < BatchObject
    def click_form
      item_label = Label.new @browser.label :text => 'Item:'
      10.times {
        begin
          item_label.safe_click
        rescue
          #ignore
        end
      }
    end
  end

  class ShipToAddress < OrderDetails

    def international_address
      @international_shipping ||= InternationalShipping.new @browser
    end

    def hide
      click_form
      less_button1 = Button.new (@browser.spans :text => "Less").first
      less_button2 = Button.new (@browser.spans :text => "Less").last
      if less_button1.present?
        less_button1.click_while_present
      end
      if less_button2.present?
        less_button2.click_while_present
      end
    end

    def expand
      click_form
      ship_to_dd = Link.new @browser.link :css => "div[id=shiptoview-addressCollapsed-innerCt]>a>span>span>span:nth-child(1)"

      5.times {
        ship_to_dd.safe_click
        break unless ship_to_dd.present?
      }
    end


    def country
      ShipToCountry.new @browser
    end

    def address address
      country_drop_down = country
      text_box = Textbox.new @browser.textarea :name => 'FreeFormAddress'
      text_box.data_qtip_field @browser.link(:css => "a[data-qtip*='Ambiguous']"), "data-qtip"
      text_box.set address
      country_drop_down.drop_down.safe_click
      country_drop_down.drop_down.safe_click
      click_form
      country_drop_down.drop_down.safe_click
      hide
    end

    def ambiguous_address
      suggested_address_corrections.safe_click
      ExactAddressNotFound.new @browser
    end

    def suggested_address_corrections
      Link.new @browser.span(:text => "View Suggested Address Corrections")
    end

    def email email
      expand
      text_box = Textbox.new @browser.text_field :name => 'Email'
      data_qtip_field = (@browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]")[0]
      text_box.data_qtip_field data_qtip_field, "data-errorqtip"
      text_box.set email
      click_form
      hide
    end

    def phone phone
      expand
      text_box = Textbox.new @browser.text_field :name => 'Phone'
      text_box.set phone
      click_form
      hide
    end
  end

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

    def add *args
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
      browser_helper.drop_down @browser, state_dd_button, :li, state_field, state
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

  class DeleteShippingAddress < BatchObject
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

  class ExactAddressNotFound < BatchObject

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
      checkbox_field = @browser.input :css => "input[name=addrAmbig][value='#{row}']"

      checkbox = Checkbox.new checkbox_field, checkbox_field, "checked", "checked"
      checkbox.check

      accept_button = Button.new @browser.span :text => "Accept"
      accept_button.click_while_present
    end

    def set(partial_address_hash)
      single_order_form = SingleOrderForm.new(@browser)
      single_order_form.validate_address_link
      #single_order_form.expand
      single_order_form.ship_to.set BatchHelper.instance.format_address(partial_address_hash)
      5.times {
        begin
          item_label.click
          break if (browser_helper.present?  exact_address_not_found_field) || (browser_helper.present?  single_order_form.validate_address_link)
        rescue
          #ignore
        end
      }
      #single_order_form.hide_ship_to
      self
    end
  end

  class ViewRestrictions < BatchObject
    def browser_ok_button
      Button.new @browser.span :text => "OK"
    end

    def present?
      browser_ok_button.present?
    end

    def ok
      browser_ok_button.safe_click
    end
  end

  class CustomsFields < BatchObject

    def browser_edit_form_button
      links = @browser.links :css => "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
      Link.new links.first
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
      Button.new @browser.span :text => "Restrictions..."
    end

    def restrictions
      restrictions_button = browser_restrictions_button
      view_restrictions = ViewRestrictions.new @browser
      5.times{
        restrictions_button.safe_click
        if view_restrictions.present?
          return view_restrictions
        end
      }
      nil
    end

  end

  class SingleOrderFormLineItem < BatchObject
    def remove_field
      @browser.span :css => "span[class*=sdc-icon-remove]"
    end

    public

    def present?
      browser_helper.present? remove_field
    end

    def wait_until_present
      browser_helper.wait_until_present remove_field
    end

    def delete_line *args
      browser_fields = @browser.spans :css => "span[class*=sdc-icon-remove]"
      browser_fields
      browser_field = browser_fields
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def qty *args
      browser_field = Textbox.new @browser.text_field :name => "Quantity"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def id *args
      browser_field = Textbox.new @browser.text_field :name => "Sku"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def description *args
      browser_field = Textbox.new @browser.text_field :name => "ItemName"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end
  end

  class Tracking < OrderDetails

    private

    def text_box
      Textbox.new @browser.text_field :name => 'Tracking'
    end

    def drop_down
      Button.new @browser.div :css => "div[id^=trackingdroplist-][id$=-trigger-picker]"
    end

    public

    def text
      text_box.text
    end

    def select selection
      box = text_box
      button = drop_down
      selection_label = Label.new @browser.td :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          selection_label.safe_click
          click_form
          break if box.text.include? selection
        rescue
          #ignore
        end
      }
      selection_label
    end

    def cost selection
      button = drop_down
      selection_label = @browser.td :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            selection_cost = selection_label.parent.tds[1].text
            log "#{selection_cost}"
            return selection_cost
          end
        rescue
          #ignore
        end
      }
    end

    def tooltip selection
      button = drop_down
      selection_label = @browser.td :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            qtip = selection_label.parent.parent.parent.parent.attribute_value "data-qtip"
            log "#{qtip}"
            return qtip
          end
        rescue
          #ignore
        end
      }
    end

  end

  class Service < OrderDetails

    private

    def text_box
      Textbox.new @browser.text_field :css => "input[name^=servicedroplist]"
    end

    def drop_down
      Button.new @browser.div :css => "div[id^=servicedroplist][id$=trigger-picker][class*=arrow-trigger-default]"
    end

    public

    def text
      text_box.text
    end

    def select selection
      log "Select Service #{selection}"
      box = text_box
      button = drop_down
      selection_label = Label.new @browser.td :css => "tr[data-qtip*='#{selection}']>td:nth-child(2)"
      10.times {
        begin
          button.safe_click unless selection_label.present?
          selection_label.safe_click
          click_form
          selected_service = box.text
          log "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
          break if selected_service.include? selection
        rescue
          #ignore
        end
      }
      log "#{selection} service selected."
      selection_label
    end

    def cost selection
      button = drop_down
      cost_label = Label.new @browser.td :css => "tr[data-qtip*='#{selection}']>td:nth-child(3)"
      10.times {
        begin
          button.safe_click unless cost_label.present?
          if cost_label.present?
            service_cost = test_helper.remove_dollar_sign cost_label.text
            log "Service Cost for \"#{selection}\" is #{service_cost}"
            return service_cost
          end
        rescue
          #ignore
        end
      }
      click_form
    end

    def tooltip selection
      button = drop_down
      selection_label = Label.new @browser.tr :css => "tr[data-qtip*='#{selection}']"
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            tooltip = selection_label.attribute_value "data-qtip"
            log "Service Tooltip for \"#{selection}\" is #{tooltip}"
            return tooltip
          end
        rescue
          #ignore
        end
      }
      click_form
    end

  end

  class ShipToCountry < OrderDetails

    def drop_down
      divs = @browser.divs :css => "div[id^=combo-][id$=-trigger-picker]"
      domestic = Button.new divs.first
      international = Button.new divs.last

      if domestic.present?
        domestic
      elsif international.present?
        international
      else
        raise "Unable to located Ship-To drop-down button."
      end
    end

    def text_box
      Textbox.new (@browser.text_fields :name => "CountryCode")[1]
    end

    def select country
      log "Select Country #{country}"

      dd_button = drop_down
      box = text_box
      dd_button.safe_click
      selection_label = Label.new @browser.li(:text => /#{country}/)
      10.times {
        begin
          dd_button.safe_click unless selection_label.present?
          selection_label.safe_click
          click_form
          selected_country_text = box.text
          log "Selected Country  #{selected_country_text} - #{(selected_country_text.include? country)?"#{country} selected": "#{country} not selected"}"
          break if selected_country_text.include? country
        rescue
          #ignore
        end
      }
      log "Ship-To country now set to #{country}"
      InternationalShipping.new @browser
    end
  end

  #
  #  Single Order Edit Form
  #
  class SingleOrderForm < OrderDetails

    def service
      Service.new @browser
    end

    def tracking
      Tracking.new @browser
    end

    def address_textbox
      Textbox.new @browser.textarea :name => 'FreeFormAddress'
    end

    def service_textbox
      @browser.text_field :css => "input[componentid^=servicedroplist]"
    end

    def insurance_cost_label
      @browser.label :css => 'label[class*=insurance_cost]'
    end

    def ship_from_dropdown
      @browser.div :css => "div[id^=shipfromdroplist][class*=x-form-arrow-trigger-default]"
    end

    def height_textbox
      @browser.text_field :name => 'Height'
    end

    def country_textbox
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div>input'
    end

    def country_dropdown
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div:nth-child(2)'
    end

    def tracking_dropdown
      @browser.div :css => 'div[id^=trackingdroplist-][id$=-trigger-picker]'[0]
    end

    def tracking_usps_selection
      @browser.td :text => 'USPS Tracking'
    end

    def text_box
      @browser.text_field :name => 'Tracking'
    end

    def service_cost_label
      #@browser.label(:text => 'Service:').element(:xpath => './following-sibling::*[2]')
      @browser.label(:css => 'label[class*=selected_service_cost]')
    end

    def tracking_cost_label
      @browser.label(:css => 'label[class*=selected_tracking_cost]')
    end

    #Auto Suggest Elements

    def auto_suggest_name_array
      @browser.divs :css => 'div[class*=main-title]'
    end

    def auto_suggest_location_array
      @browser.divs :css => 'div[class*=sub-title]'
    end

    def customs_form
      @customs_form ||= CustomsForm.new @browser
    end

    def customs
      CustomsFields.new @browser
    end
    def add_item
      add_item = Link.new @browser.span :text => "Add Item"
      log "Add Item Button #{(browser_helper.present? add_item)?"Exist!":'DOES NOT EXIST!'}"
      add_item

      line_item = SingleOrderFormLineItem.new @browser
      5.times{
        add_item.safe_click
        line_item.wait_until_present
        break if line_item.present?
      }
      line_item
    end

    def service_inline_cost
      @service_cost
    end

    def service_input_text
      browser_helper.text service_textbox, 'service'
    end

    def service_cost
      10.times{
        begin
          cost = service_cost_label.text
        rescue
          #ignore
        end
        break unless cost.include? "0.00"
      }
      test_helper.remove_dollar_sign(browser_helper.text(service_cost_label, 'service'))
    end

    def insurance_cost
      10.times{
        begin
          cost = insurance_cost_label.text
        rescue
          #ignore
        end
        break unless cost.include? "0.00"
      }
      test_helper.remove_dollar_sign(browser_helper.text(insurance_cost_label,'insurance'))
    end

    def tracking_cost
      10.times{
        begin
          cost = tracking_cost_label.text
        rescue
          #ignore
        end
        break unless cost.include? "0.00"
      }
      test_helper.remove_dollar_sign(browser_helper.text(tracking_cost_label, 'tracking'))
    end

    def total
      total_label = Label.new @browser.labels(:css => "label[class*='total_cost']").first
      test_helper.remove_dollar_sign total_label.text
    end

    def total_amount_calculation
      total_cost = self.total
      log total_cost
      # @correct = will add service price + insure for + tracking

    end

    def correct?
      @correct
    end

    def present?
      (Label.new @browser.label :text => "Ship From:").present?
    end

    def wait_until_present
      (Label.new @browser.label :text => "Ship From:").wait_until_present
    end

    def edit_details(data = {})
      #self.weight = {}
      log_hash_param data
      self.insured_value.set data[:insured_value]
      self.lbs.set data[:lbs]
      self.oz.set data[:oz]
      self.length.set data[:@length]
      self.width.set data[:width]
      self.height.set data[:height]
    end

    def weight=(data={})
      log_hash_param data
      self.lbs.set data[:lbs]
      self.oz.set data[:oz]
    end

    def dimensions=(data={})
      log_hash_param data
      self.length.set data[:@length]
      self.width.set data[:width]
      self.height.set data[:height]
    end

    def oz
      click_form
      Textbox.new @browser.text_field :name => 'WeightOz'
    end

    def lbs
      click_form
      Textbox.new @browser.text_field :name => 'WeightLbs'
    end

    def insured_value
      click_form
      Textbox.new @browser.text_field :name => "InsuranceAmount"
    end

    def length
      click_form
      Textbox.new @browser.text_field :name => 'Length'
    end

    def width
      click_form
      Textbox.new @browser.text_field :name => 'Width'
    end

    def height
      click_form
      Textbox.new @browser.text_field :name => 'Height'
    end

    def ship_to
      ShipToAddress.new @browser
    end

    def manage_ship_from_address_field
      @browser.div :text => 'Manage Shipping Addresses...'
    end

    def ship_from_selection selection
      @browser.div :text => selection
    end

    def ship_from selection
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
      ship_from_default_selection = Label.new @browser.div :css => "div[data-recordindex='0']"
      ship_from_dropdown = Button.new @browser.div :css => "div[id^=shipfromdroplist][id$=trigger-picker]"
      ship_from_textbox = Textbox.new @browser.text_field :css => "input[name^=shipfromdroplist]"
      if selection.downcase.eql? "default"
        5.times{
          ship_from_dropdown.safe_click
          ship_from_default_selection.safe_click
          break if ship_from_textbox.text.length > 2
        }
        click_form
      else
        5.times {
          begin
            break if @manage_shipping_adddress.present?
            browser_helper.click ship_from_dropdown, "ship_from_selection.[#{selection}]" unless browser_helper.present?  ship_from_selection(selection)
            browser_helper.click ship_from_selection(selection), selection
          rescue
            #ignore
          end
          click_form
        }
        @manage_shipping_adddress
      end
    end

    def manage_shipping_address
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
    end

    def manage_shipping_addresses
      self.ship_from "Manage Shipping Addresses..."
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

    def ounces_qtip_error_displayed?(message) # "The maximum value for this field is 70"
      ounces_qtip_error.include?(message)
    end

    def service_default_text
      service_textbox.attribute_value("placeholder")
    end

    def country
      country_textbox.attribute_value('value')
    end

    def click_auto_suggest_name index
      browser_helper.click auto_suggest_name_array[index.to_i-1]
    end

    def get_address_text
      browser_helper.text address_textbox
    end

    def get_email_text
      browser_helper.text email
    end

    def get_phone_text
      browser_helper.text phone
    end

    def get_auto_suggest_name index
      auto_suggest_name_array[index.to_i-1].text
    end

    def get_auto_suggest_location index
      auto_suggest_location_array[index.to_i-1].text
    end
    def ship_cost_span
      span = @browser.span :text => "Ship Cost"
      log "single-order form is #{(browser_helper.present? span)?'present':'NOT present'}"
      span
    end

    def order_id
      order_id_label = Label.new @browser.label :css => "div[id^=orderDetailsPanel]>div[id^=singleOrderDetailsForm]>div>div[id^=container]>div>div:nth-child(1)>div>div>div>div>div>label:nth-child(1)"
      5.times{
        begin
          order_id_str = order_id_label.text
          break if order_id_str.include? 'Order #'
        rescue
          #ignroe
        end
      }

      return "Empty Grid" unless order_id_label.present?

      begin
        order_id_label.wait_until_present
      rescue
        log "single-order form Order ID label was not present"
      end
      #(browser_helper.text order_id_label).split('Order #').last
      order_id_str = order_id_label.text
      order_id = order_id_str.split('Order #').last
      order_id
    end

    def order_status_label
      @browser.label :css => "div[id^=orderDetailsPanel]>div[id^=singleOrderDetailsForm]>div>div[id^=container]>div>div>div>div>label"
    end

    def order_status
      browser_helper.text order_status_label, 'order_status'
    end

    def single_order_form_present
      browser_helper.present? order_id_label
    end

    def validate_address_link
      @browser.span :text => 'Validate Address'
    end


  end #SingleOrderEdit Module
end