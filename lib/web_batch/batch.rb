module Batch
  require_relative '../common/stamps'
  include Stamps

  module GridCommon

    GRID_COLUMNS ||= {
        :ship_cost => [2, 'Ship Cost'],
        :age => [3, 'Age'],
        :order_id => [4, 'Order ID'],
        :order_date => [5, 'Order Date'],
        :recipient => [6, 'Receipient'],
        :company => [7, 'Company'],
        :street_address => [8, 'Address'],
        :city => [9, 'City'],
        :state => [10, 'State'],
        :zip => [11, 'Zip'],
        :phone => [12, 'Phone'],
        :email => [13, 'Email'],
        :qty => [14, 'Qty.'],
        :item_sku => [15, 'Item SKU'],
        :item_name => [16, 'Item Name'],
        :ship_from => [17, 'Ship From'],
        :service => [18, 'Service'],
        :weight => [19, 'Weight'],
        :insured_value => [20, 'Insured Value'],
        :reference_no => [21, 'Reference No.'],
        :cost_code => [22, 'Cost Code'],
        :order_status => [23, 'Order Status'],
        :ship_date => [24, 'Ship Date'],
        :tracking => [25, 'Tracking #'],
        :order_total => [26, 'Order Total']
    }

    def grid_text(column, row)
      grid_field(column, row).text
    end

    def grid_field(column, row)
      @browser.div(:css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (row.to_s) +")>tbody>tr>td:nth-child("+GRID_COLUMNS[column].first.to_s+")>div")
    end

    def order_id(row)
      grid_text(:order_id, row)
    end

    def row_number(order_id)
      row_offset = 1
      css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{GRID_COLUMNS[:order_id].first})>div"
      elements = @browser.divs :css => css
      elements.each_with_index { |div, index|
        id = div.text
        id
        if id.casecmp order_id
          return index + row_offset
        end
      }
    end

    def edit_order(order_id)
      check_row(row_number order_id)
    end

    def check_row(number)
      field = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div"
      unless field_present? field
        raise("Order Grid Row number #{number} does not exist.")
      end
      5.times do
        if row_checked?(number)
          break
        else
          click field, "Row#{number}"
        end
      end
      log "Row #{number} checked."
    end

    def order_checked?(order_number)
      row_checked? row_number order_number
    end

    def row_checked?(row)
      @browser.table(:css => "div[id^=ordersGrid]>div>div>table:nth-child(#{row})").attribute_value("class").include? 'item-selected'
    end

    def check(row_number)
      # is row checked?
      # no?, check it.
    end
  end

  module SingleOrderCommon

    def ship_to_address_field
      @browser.span :css => 'div[id=shiptoview-addressCollapsed-targetEl]>a>span>span>span:nth-child(2)'
    end

    def less_field
      @browser.span :text => 'Less'
    end

    def expand_ship_to_address
      3.times {
        if field_present? address_field
          break
        else
          click ship_to_address_field, "ship_to_address_field"
        end
      }
    end

    def less
      click less_field, "Less" if field_present? less_field
    end

    def item_label_field
      @browser.label :text => 'Item:'
    end

    def address_field
      @browser.textarea :name => 'FreeFormAddress'
    end

    def validate_address_field
      @browser.span :text => 'Validate Address'
    end
  end

  #
  # Navigation bar containing Sign-in, etc
  #
  module NavVar
    private
    def username_field
      @browser.span(:id => 'userNameText')
    end

    def sign_out_link
      @browser.link :id => "signOutLink"
    end

    public

    def sign_out
      10.times {
        begin
          click username_field, "userNameText" unless sign_out_link.present?
          click sign_out_link, "signOutLink"
          break field_present? username_field
        rescue
          #ignore
        end
      }
    end

    def username
      username_field.when_present.text
    end

    def wait_until_present(timeout)
      username_field.wait_until_present(timeout)
    end

    def present?
      field_present? username_field
    end

  end

  #
  #  Contains Add/Edit buton for orders.
  #
  module Toolbar
    include GridCommon
    private
    def add_field
      @browser.span :text => 'Add'
    end

    def print_button
      @browser.elements(:text => 'Print').first
    end

    public
    def print(*args)
      printer_window = PrintWindow.new(@browser)
      7.times {
        print_button.click
        break if printer_window.present?
      }
      printer_window.print_options args
    end

    def add
      add_field.when_present.click
      3.times do
        Batch.order_id = order_id(1)
        unless Batch.order_id.size == 0
          break
        end
      end
    end

    def wait_until_present
      add_field.wait_until_present
    end

    def toolbar_present?
      field_present? add_field
    end
  end

  class BatchPage < Page
    include Toolbar

    protected
    def helper
      ParameterHelper.instance #todo refactor to BatchHelper
    end
  end

  class WebBatch < Batch::BatchPage

    def sign_in(*args)
      LoginPage.new(@browser).sign_in *args
    end

    def single_order
      @single_order_form ||= SingleOrder.new(@browser)
    end

    def grid
      @grid ||= Grid.new(@browser)
    end

  end

  def self.url_prefix
    @url_prefix ||= data_for(:url_prefix, {})[ENV['URL']]
  end

  def self.order_id=(order_id)
    @order_id = order_id
    log "New Order ID:  #{order_id}"
  end

  def self.order_id
    @order_id
  end

  class ParameterHelper #todo refactor to helper module within batch
    include Singleton
    include DataMagic

    def default_sign_in_credentials
      @sign_in_credentials ||= data_for(:login_credentials, {})[ENV['URL']]
    end

    def username
      default_sign_in_credentials
      username = @sign_in_credentials['username']
      "username:    #{username}"
      username
    end

    def password
      default_sign_in_credentials
      password = @sign_in_credentials['password']
      "password:    #{password}"
      password
    end

    def sign_in_credentials
      @sign_in_credentials
    end
  end

  class LoginPage < BatchPage
    private
    LOGIN_FIELDS = {
        :sign_in_link_loc => {:text => 'Sign In'},
        :username_loc => {:id => 'UserNameTextBox'},
        :password_loc => {:id => 'PasswordTextBox'},
        :sign_in_button_loc => {:id => 'signInButton'}
    }

    def page_title
      @browser.title
    end

    def verify_page
      page_title
    end

    def username_field
      @browser.text_field(LOGIN_FIELDS[:username_loc])
    end

    def password_field
      @browser.text_field(LOGIN_FIELDS[:password_loc])
    end

    def sign_in_button
      @browser.button(LOGIN_FIELDS[:sign_in_button_loc])
    end

    public

    def visit
      @browser.goto url = "http://#{Batch.url_prefix}.stamps.com/webbatch/"
      log "Visited #{url}"
    end

    def sign_in(*args)
      case args.count
        when 0
          username = helper.default_sign_in_credentials['username']
          password = helper.default_sign_in_credentials['password']
        when 1
          if args[0].is_a? Hash
            username = args[0]['username']
            password = args[0]['password']
          else
            raise 'Argument Parameter Error.'
          end
        when 2
          username = args[0]
          password = args[1]
        else
          raise 'Argument Parameter Error.'
      end

      5.times do
        visit
        if username_field.present?
          username_field.wait_until_present
          self.username = username
          self.password = password
          click sign_in_button, "SignIn"
          sign_in_button.wait_while_present(60)
        end
        break if toolbar_present?
      end
    end

    def username=(username)
      set_text username_field, username, 'Username'
    end

    def password=(password)
      set_text password_field, password, 'Password'
    end
  end

  class ServiceSelection < BatchPage
    def initialize(browser, selection)
      #select the service and get service cost
      super(browser)
      @selection = selection
      self
    end

    def inline_service_price_field
      @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(3)"
    end

    def single_order_form_item_label
      @browser.label :text => 'Item:'
    end

=begin
    def service_dlist_field
      log 'dlist:  div[id^=servicedroplist-][id$=-trigger-picker]'
      @browser.div(:css => 'div[id^=servicedroplist-][id$=-trigger-picker]')
    end
=end

    def inline_service_price
      @inline_service_price
    end

    def service_field
      @browser.text_field :css => 'input[name^=servicedroplist-]'
    end

    def select
      3.times {
        begin
          service_dlist_field = @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
          inline_service_selection_field = @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(2)"
          service_dlist_field.click unless field_present? inline_service_selection_field
          @inline_service_price = inline_service_price_field.text.gsub('$', '')
          #log "Service selection:  #{service_selection_field.text} Price: #{@inline_service_price}"
          inline_service_text = inline_service_selection_field.text
          service_dlist_field.click unless field_present? inline_service_selection_field
          log_browser_set inline_service_selection_field, @selection, "Service"
          inline_service_selection_field.click
          inline_service_selection_field.wait_while_present(3)

          # Click this field 3 times to make tool tip disapper, tool tip appears after setting service.
          3.times
          begin
            click single_order_form_item_label, "single_order_form_item_label" if field_present? single_order_form_item_label
          rescue
            #ignroe
          end

          service_input_text = service_field.attribute_value("value")

          log "Service Selected?  #{(service_input_text.include?inline_service_text)?"Yes":"No"}. #{inline_service_text}  #{service_input_text}"
          #log "Service selected: #{service_selected} : Selected: #{selected}, Selection: #{selection}"
          break if service_input_text.include? inline_service_text
        rescue => exception
          #log exception.backtrace
          field = @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
          Watir::Wait.until {field.present?}
        end
      }
      @inline_service_price
    end

  end

  class PrintWindow < Stamps::Page
    def initialize(browser, *args)
      super(browser)
      print_options *args
    end

    public
    def print_options(*args)

      case args.size
        when 0
          return self
        when 1
          self.printer = args[0]
          return self
        when 2
          self.printer = args[0]
          self.paper_trail = args[1]
          return self
        else
          raise "Invalid printer arguments."
      end
      self
    end

    def open_printer_window

    end

    def printer=(printer)
      printer_field.when_present.set printer
      printer_label.click
      printer_label.click
      self
    end

    def paper_trail=(tray)
      paper_tray_field.when_present.set tray
      printer_label.click
      printer_label.click
      self
    end

    def print
      print_button.click
      self.print_result
      self
    end

    def print_sample
      print_sample_button.click
      self.print_result
      self
    end

    def present?
      print_button.present?
    end

    def error_ok_button
      @browser.span :text => 'OK'
    end

    def error_message
      @browser.div(:css => 'div[class=x-autocontainer-outerCt][id^=dialoguemodal]>div[id^=dialoguemodal]').text
    end

    def close
      x_button.click
    end

    private

    def print_result
      if error_ok_button.present?
        error_message = self.error_message
        log "!!!  PRINT ERROR !!!"
        log error_message
        log "!!!  PRINT ERROR !!!"
        5.times {
          error_ok_button.click
          break unless error_ok_button.present?
        }
      end
      close
    end

    def x_button
      @browser.elements(:css => 'img[class*=x-tool-close]').last
    end

    def printer_label
      @browser.label :text => 'Printer:'
    end

    def printer_field
      @browser.text_field :name => 'printers'
    end

    def paper_tray_field
      @browser.text_field :name => 'paperTrays'
    end

    def print_sample_button
      @browser.span :text => 'Print Sample'
    end

    def print_button
      @browser.elements(:text => 'Print').first
    end
  end

  #
  # Orders Table
  #
  class Grid < Batch::BatchPage
    include GridCommon

    public
    def ship_cost(order_id)
      value = grid_text(:ship_cost, row_number(order_id))
      arr = value.scan(/[^$]*$/)
      arr[0]
    end

    def age(order_id)
      grid_text(:age, row_number(order_id))
    end

    def order_date(order_id)
      grid_text(:order_date, row_number(order_id))
    end

    def recipient(order_id)
      grid_text(:recipient, row_number(order_id))
    end

    def company(order_id)
      grid_text(:company, row_number(order_id))
    end

    def street_address(order_id)
      grid_text(:street_address, row_number(order_id))
    end

    def city(order_id)
      grid_text(:city, row_number(order_id))
    end

    def state(order_id)
      grid_text(:state, row_number(order_id))
    end

    def zip(order_id)
      grid_text(:zip, row_number(order_id))
    end

    def phone(order_id)
      grid_text(:phone, row_number(order_id))
    end

    def email(order_id)
      grid_text(:email, row_number(order_id))
    end

    def qty(order_id)
      grid_text(:qty, row_number(order_id))
    end

    def item_sku(order_id)
      grid_text(:item_sku, row_number(order_id))
    end

    def item_name(order_id)
      grid_text(:item_name, row_number(order_id))
    end

    def ship_from(order_id)
      grid_text(:ship_from, row_number(order_id))
    end

    def service(order_id)
      grid_text(:service, row_number(order_id))
    end

    def weight(order_id)
      grid_text(:weight, row_number(order_id))
    end

    # 5 lbs. 10 oz.
    def pounds(order_id)
      weight(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
    end

    def ounces(order_id)
      weight(order_id).scan(/\d+ oz./).first.scan(/\d/).first
    end

    def reference_no(order_id)
      grid_text(:reference_no, row_number(order_id))
    end

    def cost_code(order_id)
      grid_text(:cost_code, row_number(order_id))
    end

    def order_status(order_id)
      grid_text(:order_status, row_number(order_id))
    end

    def ship_date(order_id)
      grid_text(:ship_date, row_number(order_id))
    end

    def tracking_number(order_id)
      grid_text(:tracking_number, row_number(order_id))
    end

    def order_total(order_id)
      grid_text(:order_total, row_number(order_id))
    end

    def insured_value(order_id)
      grid_text(:insured_value, row_number(order_id)).gsub('$', '')
    end

    def list_all_fields(order_id)
      GRID_COLUMNS.keys.each {|key| send(key, row_number(order_id))}
    end

  end

  class ShippingAddressForm < Batch::BatchPage
    public
    def shipping_address=(table)
      self.origin_zip = table[:ship_from_zip]
      self.name = table[:name]
      self.company = table[:company]
      self.street_address1 = table[:street_address1]
      self.street_address2 = table[:street_address2]
      self.city = table[:city]
      self.state = table[:state]
      self.zip = table[:zip]
      self.phone = table[:phone]
      self.save
    end

    def origin_zip=(zip)
      set_text origin_zip_field, zip, "origin_zip"
    end

    def origin_zip

    end

    def name=(name)
      set_text name_field, name, "name_field"
    end

    def company=(company)
      set_text company_field, company, "company_field"
    end

    def street_address1=(street)
      set_text street_address1_field, street, "street_address1_field"
    end

    def street_address2=(street)
      set_text street_address2_field, street, "street_address2_field"
    end

    def city=(city)
      set_text city_field, city, "city_field"
    end

    def state=(state)
      set_text state_field, state, "state_field"
    end

    def zip=(code)
      set_text zip_field, code, "zip_field"
    end

    def phone=(number)
      set_text phone_field, number, "phone_field"
    end

    def save
      click save_button, "save_button"
      save_button.wait_while_present
    end

    def present?
      save_button.present?
    end

    private
    def origin_zip_field
      @browser.text_field :name => 'OriginZip'
    end

    def name_field
      @browser.text_field :name => 'FullName'
    end

    def company_field
      @browser.text_field :name => 'Company'
    end

    def street_address1_field
      @browser.text_field :name => 'Street1'
    end

    def street_address2_field
      @browser.text_field :name => 'Street2'
    end

    def city_field
      @browser.text_field :name => 'City'
    end

    def state_field
      @browser.text_field :name => 'State'
    end

    def zip_field
      @browser.text_field :name => 'Zip'
    end

    def phone_field
      @browser.text_field :css => "input[name=Phone][maxlength='14']"
    end

    def save_button
      @browser.span :text => 'Save'
    end

  end

  class DeleteShippingAddress < Batch::BatchPage
    public
    def delete
      5.times {
        begin
          log "Delete Shipping Address :: #{message_field.text}"
          click delete_button, 'DeleteShippnigAddress'
        rescue
          #ignore
        end
        break unless present?
      }
    end

    def present?
      field_present? window_title
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

  class ManageShippingAddresses < Batch::BatchPage
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
      field_present? add_button
    end

    def add
      @shipping_address_form = ShippingAddressForm.new(@browser)
      10.times {
        begin
          click add_button, "add_button"
          break if @shipping_address_form.present?
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
          count_before = shipping_address_count
          log_param "row count before addition", count_before
          @shipping_address_form.shipping_address = args[0]
          count_after = shipping_address_count
          @run_status = (count_before + 1) == count_after
          log_param "Address added successfully? #{@run_status}", "Row count before:  #{count_before}, Row cuont after: #{count_after}"
          close_window
        else
          raise "Illegal number of arguments.  "
      end
      self
    end

    def edit_address(name, company, city, new_address_details)
      row_num = row_number(name, company, city)
      if row_num > 0
        select_row row_num
        edit new_address_details
      end
      @run_status = row_number(new_address_details[:name], new_address_details[:company], new_address_details[:city]) > 0
      close_window
      self
    end

    def edit(*args)
      edit_button.when_present.click
      case args.length
        when 0
          ShippingAddressForm.new(@browser)
        when 1
          ShippingAddressForm.new(@browser).shipping_address = args[0]
        else
          raise "Illegal number of arguments.  "
      end
      self
    end

    def delete
      begin
        click(delete_button, "Delete") if field_present? delete_button
      rescue
        #ignore
      end
    end

    def added?
      @run_status
    end

    def select_row(row_num)
      click_row_until_selected(row_num, "class", "x-grid-item-selected")
    end

    def click_row_until_selected(row_num, attibute, attribute_value)
      cell = grid_cell(row_num, 1)
      5.times do
        begin
          click cell, "cell(#{row_num}, 1)"
          #log_browser_click(cell, attibute, attribute_value)
          break if row_checked? row_num
        rescue
          #ignore
        end
      end
    end

    def delete_all_address
      begin
        count = shipping_address_count
        if count > 1
          for row in 1..(count+3)
            delete_row 1
            log "Try #{row} :: Deleting row 1..."
            break if shipping_address_count == 1
          end
        end
      rescue
        #
      end
      @run_status = shipping_address_count == 1
      self
    end

    def successful?
      @run_status
    end

    def close_window
      begin
        click(close_button, "Close")
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
      count = @browser.elements(:css => "div>div[class=x-grid-item-container]:nth-child(2)>table[id^=gridview-][id*=-record-][data-boundview^=gridview]").size
      log "Manage Shipping Address:: row count = #{count}"
      count.to_i
    end

    private

    def grid_cell(row, column)
      @browser.td :css => "div>div[class=x-grid-item-container]:nth-child(2)>table[id^=gridview-][id*=-record-][data-recordindex='#{row-1}'][data-boundview^=gridview]>tbody>tr>td:nth-child(#{column})"
    end

    def grid_cell_text(row, column)
      get_text grid_cell(row, column), "cell(#{row}, #{column})"
    end

    def close_button
      @browser.image :css => "img[class*='x-tool-img x-tool-close']"
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
  #
  #  Single Order Edit Form
  #
  class SingleOrder < BatchPage
    include Batch::GridCommon
    include Batch::SingleOrderCommon

    public
    def initialize(browser)
      super(browser)
      @services ||= Hash.new
    end

    def service(selection)
      log_param "Service Selection", selection
      selection_sym = service_to_sym selection
      #add service to hash unless it already exists
      ServiceSelection.new(@browser, selection).select
    end

    def service_price
      service_price_field.text.gsub('$', '')
    end

    def present?
      field_present? height_field
    end

    def wait_until_present(timeout)
      height_field.wait_until_present(timeout)
    end

    def edit_details(data = {})
      #self.weight = {}
      log_hash_param data
      self.insured_value = data[:insured_value]
      self.pounds = data[:pounds]
      self.ounces = data[:ounces]
      self.length = data[:length]
      self.width = data[:width]
      self.height = data[:height]
    end

    def weight=(data={})
      log_hash_param data
      self.pounds = data[:pounds]
      self.ounces = data[:ounces]
    end

    def dimensions=(data={})
      log_hash_param data
      self.length = data[:length]
      self.width = data[:width]
      self.height = data[:height]
    end

    def recipient=(data={})
      log_hash_param data
      self.address = data
      self.phone = data[:phone]
      self.email = data[:email]
      less
    end

    def email=(email)
      expand_ship_to_address
      set_text email_field, email, 'Email'
      less
    end

    def email
      expand_ship_to_address
      log email_field.attribute_value('value')
      less
    end

    def phone
      expand_ship_to_address
      phone_field.attribute_value('value')
      less
    end

    def phone=(phone)
      expand_ship_to_address
      set_text phone_field, phone, 'Phone'
      less
    end

    def address=(address)
      expand_ship_to_address
      set_text address_field, formatAddress(address), 'Address'
      less
    end

    def partial_address
      ExactAddressNotFound.new(@browser)
    end

    def address
      expand_ship_to_address
      address_field.attribute_value('value')
      less
    end

    def edit_address(address)
      self.address=address
    end

    def manage_ship_from_address_field
      @browser.div :text => 'Manage Shipping Addresses...'
    end

    def ship_from_default
      ship_from_drop_list_field.when_present.click
      ship_from_default_field.click
    end

    def ship_from_selection(selection)
      @browser.div :text => selection
    end

    def ship_from(selection)
      @manage_shipping_adddress ||= ManageShippingAddresses.new(@browser)
      10.times {
        begin
          click ship_from_drop_list_field, "ship_from_selection(#{selection})" unless field_present? ship_from_selection(selection)
          click ship_from_selection(selection), selection
          break if @manage_shipping_adddress.window_present?
        rescue
          #ignore
        end
      }
    end

    def manage_shipping_adddress
      self.ship_from "Manage Shipping Addresses..."
      @manage_shipping_adddress
    end

    def pounds=(pounds)
      set_text pounds_field, pounds, 'Pounds'
    end

    def pounds
      pounds_field.attribute_value('value')
    end

    def pounds_max_value
      pounds_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
    end

    def pounds_qtip_error_displayed?(message) # "The maximum value for this field is 70"
      pounds_qtip_error.include?(message)
    end

    def pounds_qtip_error
      pounds_field.attribute_value('data-errorqtip')
    end

    def ounces=(ounces)
      set_text ounces_field, ounces, 'Ounces'
    end

    def ounces_qtip_error
      ounces_field.attribute_value('data-errorqtip')
    end

    def ounces_max_value
      ounces_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
    end

    def ounces_qtip_error_displayed?(message) # "The maximum value for this field is 70"
      ounces_qtip_error.include?(message)
    end

    def ounces
      ounces_field.attribute_value('value')
    end

=begin
    def service
      service_field.attribute_value("value")
    end
=end

    def service_default_text
      service_field.attribute_value("placeholder")
    end

    def insured_value=(amount)
      set_text insured_value_field, amount, 'Insurance'
    end

    def insured_value
      insured_value_field.attribute_value('value')
    end

    def length=(length)
      set_text length_field, length, 'Length'
    end

    def length
      length_field.attribute_value('value')
    end

    def width=(width)
      set_text width_field, width, 'Width'
    end

    def width
      width_field.attribute_value('value')
    end

    def height=(height)
      set_text height_field, height, 'Height'
    end

    def height
      height_field.attribute_value('value')
    end

    def country
      country_field.attribute_value('value')
    end

    private

    def phone_field
      @browser.text_field :name => 'Phone'
    end

    def email_field
      @browser.text_field :name => 'Email'
    end

    def ship_from_drop_list_field
      @browser.div :css => 'div[id^=shipfromdroplist][class*=x-form-arrow-trigger-default]'
    end

    def ship_from_default_field
      @browser.div :css => 'div[data-recordindex=\'0\']'
    end

    def insured_value_field
      @browser.text_field :name => 'InsuranceAmount'
    end

    def pounds_field
      @browser.text_field :name => 'WeightLbs'
    end

    def ounces_field
      @browser.text_field :name => 'WeightOz'
    end

    def length_field
      @browser.text_field :name => 'Length'
    end

    def width_field
      @browser.text_field :name => 'Width'
    end

    def height_field
      @browser.text_field :name => 'Height'
    end

    def country_field
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div>input'
    end

    def country_dlist_field
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div:nth-child(2)'
    end

    def service_postcard_field
      @browser.td :text => 'Postcard'
    end

    def tracking_dlist_field
      @browser.div :css => 'div[id^=trackingdroplist-][id$=-trigger-picker]'[0]
    end

    def tracking_usps_field
      @browser.td :text => 'USPS Tracking'
    end

    def tracking_field
      @browser.text_field :name => 'Tracking'[0]
    end

    def order_id_field
      txt = "Order ##{WebBatchHelper.order_id}"
      @browser.label :text => txt
    end

    def service_price_field
      @browser.label(:text => 'Service:').element(:xpath => './following-sibling::*[2]')
    end

  end #SingleOrderEdit Module

  class ExactAddressNotFound < BatchPage
    include Batch::SingleOrderCommon

    private
    def exact_address_not_found_field
      @browser.div :text => 'Exact Address Not Found'
    end

    public
    def exact_address_not_found?
      field_present? exact_address_not_found_field
    end

    def row=(number)
      offset = 1
      rox_input = @browser.input :css => "input[name=addrAmbig][value='#{number-offset}']"
      accept_button = @browser.span :text => 'Accept'
      3.times do
        begin
          rox_input.click
          checked = rox_input.attribute_value("checked")
          yyy=rox_input.attribute_value("checked").include? "checked"
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

    def set(partial_addy)
      expand_ship_to_address
      set_text address_field, formatAddress(partial_addy), 'Address'
      10.times {
        item_label_field.click
        break if (field_present? exact_address_not_found_field) || (field_present? validate_address_field)
      }
      less
      self
    end
  end

end