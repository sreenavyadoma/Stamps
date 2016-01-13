# encoding: utf-8
module Print

  module Postage
    class PrintOn < PrintObject

      def drop_down
        Button.new (@browser.divs Print::Locators::FormBody.print_on_drop_down_divs)[0]
      end

      def text_box
        Textbox.new (@browser.text_field Print::Locators::FormBody.print_on_text_field)
      end

      def select selection
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :text => selection
        5.times {
          begin
            button.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if box.text.include? selection
          rescue
            #ignore
          end
        }
      end

      def tooltip selection
        drop_down = Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[0]
        selection_field = Label.new @browser.div :text => selection

        10.times {
          drop_down.safe_click unless selection_field.present?
          return selection_field.attribute_value "data-qtip" if selection_field.present?
        }
      end

      def enabled? selection

      end

      def disabled? selection

      end
    end

    class Weight < PrintObject
      class Pounds < PrintObject
        def text_box
          Textbox.new (@browser.text_field :id => 'sdc-mainpanel-poundsnumberfield-inputEl'), "data-errorqtip"
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
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class Ounces < PrintObject
        def text_box
          Textbox.new (@browser.text_field :id => 'sdc-mainpanel-ouncesnumberfield-inputEl'), "data-errorqtip"
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
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      def lbs
        Pounds.new @browser
      end

      def oz
        Ounces.new @browser
      end
    end

    class ExtraServices < PrintObject
      def button
        Button.new (@browser.span :id => "sdc-mainpanel-extraservicesbtn-btnIconEl")
      end

    end

    class Service < PrintObject
      def text_box
        Textbox.new @browser.text_field :name => "nsService"
      end

      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[6]
      end

      def select selection
        log.info "Select Service #{selection}"
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :css => "div[data-qtip*='#{selection}']"
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            if selected_service == "First Class (1 - 3 Days)"
              selected_service = "First Class Mail (1 - 3 Days)"
            end
            log.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "#{selection} service selected."
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
              log.info "Service Cost for \"#{selection}\" is #{service_cost}"
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
              log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
              return tooltip
            end
          rescue
            #ignore
          end
        }
        click_form
      end

    end

    class ShipFromAddress < PrintObject

      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[1]
      end

      def manage_ship_from_address_field
        @browser.div :text => 'Manage Shipping Addresses...'
      end

      def ship_from_selection selection
        @browser.div :text => selection
      end

      def manage_shipping_address
        @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
      end

      def manage_shipping_addresses
        self.ship_from "Manage Shipping Addresses..."
      end

      def text_box
        Textbox.new @browser.text_field :name => "shipFrom"
      end

      def select selection
        @manage_shipping_adddress = ManageShippingAddresses.new(@browser)

        return @manage_shipping_adddress if @manage_shipping_adddress.present?

        ship_from_default_selection_field = (@browser.divs :css => "div[class*=x-boundlist-item]")[0] #"div[id^=shipfromdroplist][id$=trigger-picker]"
        ship_from_dropdown = self.drop_down
        ship_from_textbox = self.text_box

        if selection.downcase == "default"
          ship_from_selection_field = ship_from_default_selection_field
        elsif selection.downcase.include? "manage shipping"
          ship_from_selection_field = @browser.div :text => "Manage Shipping Addresses..."
        else
          ship_from_selection_field = @browser.div :text => "#{selection}"
        end

        selection_label = Label.new ship_from_selection_field

        if selection.downcase.include? "manage shipping"
          10.times{
            begin
              ship_from_dropdown.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              return @manage_shipping_adddress if @manage_shipping_adddress.present?
            rescue
              #ignore
            end
            click_form
          }
        else
          ship_from_dropdown.safe_click unless selection_label.present?
          if selection_label.present?
            selection_label.scroll_into_view
            selection_text = selection_label.text
          end
          10.times{
            ship_from_dropdown.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if ship_from_textbox.text.include? selection_label.text
          }
        end
      end

    end

    class StampAmount < PrintObject
      def text_box
        Textbox.new (@browser.text_field :name => "stampAmount"), "data-errorqtip"
      end

      def set value
        text_field = text_box
        text_field.set value
        log.info "Pounds set to #{text_field.text}"
      end

      def increment value
        button = Button.new @browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = Button.new @browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class Country < PrintObject
      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[2]
      end

      def text_box
        Textbox.new (@browser.text_field :name => "mailToCountry")
      end

      def select selection
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :text => selection
        5.times {
          begin
            button.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if box.text.include? selection
          rescue
            #ignore
          end
        }
      end
    end
  end

  class PrintPostage < PrintObject

    def sign_in_page
      Print::SignInPage.new @browser
    end

    def navbar
      Print::NavBar.new @browser
    end

    def toolbar
      #we'll get to this when it comes time to buy stamps and prefs
    end

    def print_on
      Print::Postage::PrintOn.new @browser
    end

    def stamps
      Stamps.new @browser
    end
  end

  class Stamps < PrintObject
    class CalculatePostageAmount < PrintObject
      def weight
        Print::Postage::Weight.new @browser
      end

      def extra_services
        Print::Postage::Weight.new @browser
      end
    end

    class SpecifyPostageAmount < PrintObject
      def stamp_amount
        Print::Postage::StampAmount.new @browser
      end
    end

    def country
      Print::Postage::Country.new @browser
    end

    def serial
      Textbox.new @browser.text_field :id => "sdc-mainpanel-nsserialtextfield-inputEl"
    end


    def service
      Print::Postage::Service.new @browser
    end

    def ship_from
      Print::Postage::ShipFromAddress.new @browser
    end

    def calculate_postage_amount
      checkbox = Checkbox.new (@browser.input :id => "sdc-mainpanel-calculatepostageradio-inputEl"), (@browser.table :id => "sdc-mainpanel-calculatepostageradio"), "class", "checked"
      checkbox.check
      CalculatePostageAmount.new @browser
    end

    def specify_postage_amount
      checkbox = Checkbox.new (@browser.input :id => "sdc-mainpanel-specifypostageradio-inputEl"), (@browser.table :id => "sdc-mainpanel-specifypostageradio"), "class", "checked"
      checkbox.check
      SpecifyPostageAmount.new @browser
    end

  end

  ######Parent Class for Postage Form Types

  class PostageBase < PrintPostage
    # all common fields goes here including service drop down


    def total
      @browser.label :css => "label[id*=sdc-printpanel-totalcostlabel]"
    end

    def print_sample_button
      Button.new (@browser.a :css => "a[class*=sdc-printpanel-printsamplebtn]")
    end

    def print_button
      Button.new (@browser.a :css => "a[class*=sdc-printpanel-printpostagebtn]")
    end

    def shipping_label
      ShippingLabel.new @browser
    end

    def envelope
      Envelope.new @browser
    end

    def certified_mail
      CertifiedMail.new @browser
    end

    def postage
      @print_window ||= Print::PrintPostageModal.new @browser
      open_window @print_window
    end

    def print_invalid_address
      open_window InvalidAddressError.new(@browser)
    end

    def print_expecting_error *args
      error_window = OrderErrors.new(@browser)
      open_window error_window
      case args.length
        when 0
          error_window
        when 1
          error_window.error_message.include? error_message
        else
          raise "Illegal number of arguments."
      end
    end

    def open_window window
      return window if window.present?

      browser_helper.click print_button, "print"



      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      install_plugin_error = ErrorInstallPlugin.new @browser

      20.times do
        if install_plugin_error.present?
          install_plugin_error.close
          return nil
        end

        begin
          if error_connecting_to_plugin.present?
            5.times{
              error_connecting_to_plugin.ok
              break unless error_connecting_to_plugin.present?
            }
          end

          if naws_plugin_error.present?
            5.times{
              naws_plugin_error.ok
              break unless naws_plugin_error.present?
            }
          end

          return window if window.present?
          browser_helper.click browser_print_button, "print"
        rescue
          #ignore
        end
      end

      return window if window.present?
      raise "Unable to open Print Window.  There might be errors in printing of order is not ready for printing.  Check your test."
    end

    def browser_settings_button
      Button.new (@browser.span :css => "span[class*=sdc-icon-settings]")
    end

    def click_print_button
      browser_helper.click print_button
    end

    #def wait_until_present
    #  browser_helper.wait_until_present @browser.span Orders::Locators::ToolBar::add
    #end

    #def present?
    #  browser_helper.present? @browser.span Orders::Locators::ToolBar::add
    #end


  end

  class ShippingLabel < PostageBase

    def email_tracking
      EmailTracking.new @browser
    end

    def ship_to
      PostageShipTo.new @browser
    end

    def insure_for
      InsureFor.new @browser
    end

    def extra_services
      Print::Postage::ExtraServices.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end

  end

  class Envelope < PostageBase

    def ship_to
      PostageShipTo.new @browser
    end

    def insure_for
      InsureFor.new @browser
    end

    def extra_services
      Print::Postage::ExtraServices.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end
  end

  class CertifiedMail < PostageBase

    def ship_to
      PostageShipTo.new @browser
    end

    def insure_for
      InsureFor.new @browser
    end

    def cm_extra_services
      CMExtraServices.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end
  end

  class ManageShippingAddresses < PrintObject
    public

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
        browser_helper.click window_title
        grid_name = name row
        grid_company = company row
        grid_city = city row
        grid_state = state row
        if (grid_name.casecmp(name)==0) && (grid_company.casecmp(company)==0) && (grid_city.casecmp(city)==0)
          log.info "Match found! - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
          return row
        else
          log.info "No match - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
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
            delete_row(locate_ship_from(address["name"], address["company"], address["city"]))
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
      @shipping_address_form = AddShippingAdress.new(@browser)
      add_shipping_address_window
      case args.length
        when 0
          @shipping_address_form
        when 1
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
      @shipping_address_form = AddShippingAdress.new @browser
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
      @browser.link :css => "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)"
    end

    def edit_button
      @browser.link :css => "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)"
    end


    def delete_button
      @browser.link :css => "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)"
    end

  end

  class AddShippingAdress < OrdersObject
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

  class ShipToBase < PrintObject
    def email
      EmailTracking.new @browser
    end
  end

  class PostageShipToDomestic < ShipToBase
    def delivery_address
      Textbox.new @browser.text_field :name => "sdc-mainpanel-shiptotextarea-inputEl"
    end

    def data_error_tooltip
      tooltip = browser.div :id => "sdc-mainpanel-shiptotextarea-errorEl"
    end
  end

  class PostageShipToInternational < ShipToBase
    def name
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptonamefield-inputEl"
    end

    def name_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptonamefield-errorEl"
    end

    def company
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptocompanyfield-inputEl"
    end

    def address_1
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptoaddress1field-inputEl"
    end

    def address_1_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptoaddress1field-errorEl"
    end

    def address_2
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptoaddress2field-inputEl"
    end

    def city
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptocityfield-inputEl"
    end

    def city_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptocityfield-errorEl"
    end

    def province
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptoprovincefield-inputEl"
    end

    def province_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptoprovincefield-errorEl"
    end

    def postal_code
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptopostcodefield-inputEl"
    end

    def postal_code_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptopostcodefield-errorEl"
    end

    def phone
      Textbox.new @browser.text_field :id => "sdc-intlform-shiptophonefield-inputEl"
    end

    def phone_data_error_tooltip
      tooltip = browser.div :id => "sdc-intlform-shiptophonefield-errorEl"
    end

  end


  class EmailTracking < PrintObject
    def checkbox
      checkbox_field = @browser.input :id => "sdc-mainpanel-emailcheckbox-inputEl"
      verify_field = checkbox_field.parent.parent.parent.parent
      attribute = "class"
      verify_field_attrib = "checked"
      Stamps::Browser::Checkbox.new checkbox_field, verify_field, attribute, verify_field_attrib
    end

    def text_box
      Textbox.new @browser.text_field :name => "recipientEmail"
    end

    def tooltip
      Label.new(@browser.label :id => "sdc-mainpanel-emailcheckbox-boxLabelEl").attribute_value "data-qtip"
    end

    def data_error_tooltip
      tooltip = browser.div :css => "div[id=sdc-mainpanel-emailtextfield-errorEl]"
    end
  end

  class InsureFor < PrintObject
    def textbox
      Textbox.new @browser.text_field :name => "insureAmt"
    end

    def more_button
      Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[3]
    end

    def less_button
      Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[3]
    end

  end

  class ShipDate < PrintObject
    #Textbox.new @browser.text_field :id => "sdc-mainpanel-shipdatedatefield-inputEl"
  end

  class CMExtraServices < PrintObject
    def cm_checkbox
      @browser.input :id => "sdc-mainpanel-cmcheckbox-inputEl"
    end

    def rre_checkbox
      @browser.input :id => "sdc-mainpanel-rrecheckbox-inputEl"
    end

    def rd_checkbox
      @browser.input :css => "input[class*=sdc-mainpanel-rdcheckbox]"
    end
  end

end