module Batch

  # Order Grid Toolbar
  class GridToolbar < BatchObject
    def present?

    end

    def page_count
      divs = @browser.divs :css => "div[id^=tbtext]"
      div = divs.last
      present = browser_helper.present? div
      log.info "Page count: #{browser_helper.text div}"
      div
    end

    def page_number
      field = @browser.text_field :css => "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
      text_box = Textbox.new field
      text_box
    end

    def first_page
      field = @browser.span :css => "span[class*=x-tbar-page-first]"
      label = Label.new field
      label
    end

    def first_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      label.disabled?
    end

    def previous_page
      Label.new field @browser.span :css => "span[class*=x-tbar-page-prev]"
    end

    def previous_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      label.disabled?
    end

    def next_page
      Label.new field @browser.span :css => "span[class*=x-tbar-page-next]"
    end

    def last_page
      Label.new field @browser.span :css => "span[class*=x-tbar-page-last]"
    end

    def last_page_disabled
      Label.new @browser.a :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
    end

    def total_number_of_pages
      label = (Label.new @browser.divs :css => "div[id^=tbtext-]").last
      number_str=label.text
      number = number_str.scan /\d+/
      number.last.to_s
    end

    def per_page_dd
      #browser, drop_down_button, selection_field_type, drop_down_input
      buttons = @browser.divs :css => "div[id^=combo-][id$=trigger-picker]"
      drop_down_button = buttons.first
      drop_down_input = @browser.text_field :css => "input[name^=combo]"
      Dropdown.new @browser, drop_down_button, :li, drop_down_input
    end

  end

  # Grid Columns
  class Column < BatchObject
    MONTH_ARRAY = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
    TIME_UNITS_ARRAY = ['minute','minutes','hour','hours','day','days']
    GRID_COLUMNS ||= {
        :check_box => " ",
        :ship_cost => "Ship Cost",
        :age => "Age",
        :order_id => "Order ID",
        :order_date => "Order Date",
        :recipient => "Recipient",
        :company => "Company",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :country => "Country",
        :phone => "Phone",
        :email => "Email",
        :qty => "Qty.",
        :item_sku => "Item SKU",
        :item_name => "Item Name",
        :ship_from => "Ship From",
        :service => "Service",
        :weight => "Weight",
        :insured_value => "Insured Value",
        :reference_no => "Reference No.",
        :cost_code => "Cost Code",
        :order_status => "Order Status",
        :date_printed => "Date Printed",
        :ship_date => "Ship Date",
        :tracking_no => "Tracking #",
        :order_total => "Order Total"
    }

    def row_count
      tables = @browser.tables :css => "div[id^=ordersGrid]>div>div>table"
      count = tables.size
      log.info "Total Number of Orders on Grid:  #{count}"
      count.to_i
    end

    def scroll column
      field = Label.new column_name_field(column)
      field.scroll_into_view
      field
    end

    def column_name_field column
      column_name = @browser.span :text => GRID_COLUMNS[column]
      log.info "Column Name:  #{browser_helper.text column_name}"
      column_name
    end

    def empty?
      size == 0
    end

    def size
      @browser.tables(:css=>"div[id^=ordersGrid]>div>div>table").size
    end

    def test_helper
      TestHelper.instance
    end

    def grid_text column, row
      browser_helper.text grid_field(column, row), "Grid.#{column}.Row#{row}"
    end

    def grid_field column_number, row
      @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_number(column_number).to_s})>div"
    end

    def grid_field_column_name column_name, row
      grid_text column_number(column_name), row
    end

    def column_number column_name
      begin
        column_str = GRID_COLUMNS[column_name]
        columns = column_fields
        columns.each_with_index { |column_field, index|
          column_text = browser_helper.text column_field
          if column_text == column_str
            return index+1
          end
        }
      rescue Exception => e
        log.info e
      end
    end

    def column_fields
      @column_fields ||= @browser.spans :css => "div[componentid^=gridcolumn]"
    end

    def row_number order_id
      row = 1
      column = column_number(:order_id)
      css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column})>div"
      log.info "Order ID: #{order_id} CSS: #{css}"
      fields = @browser.divs :css => css
      fields.each_with_index { |div, index|
        row_text = browser_helper.text div
        if row_text.include? order_id
          row = index + 1 #row offset
          log.info "Order ID #{order_id} is in Row #{row}"
          break
        end
      }
      row
    end

    def row_div number
      raise "row_div:  number can't be nil" if number.nil?
      div = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div[class=x-grid-row-checker]"
      raise("Order Grid Row number #{number} is not present")unless browser_helper.present? div
      div
    end
  end

  class OrderId < Column

    def sort
      Sort.new @browser, :order_id
    end

    def scroll_into_view
      scroll :order_id
    end

    def field row
      grid_field_column_name :order_id, row
    end
    
    def row row
      scroll_into_view
      8.times{
        break if size > 0
        sleep 1
      }

      if size == 0
        return ""
      end

      begin
        grid_text(:order_id, row)
      rescue
        return ""
      end
    end

  end

  class Age < Column

    def sort
      Sort.new @browser, :age
    end

    def scroll_into_view
      scroll :age
    end

    def field row
      grid_field_column_name :age, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:age, row)
    end
  end

  class OrderDate < Column

    def sort
      Sort.new @browser, :order_date
    end

    def scroll_into_view
      scroll :order_date
    end

    def field row
      grid_field_column_name :order_date, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_date, row)
    end
  end

  class Sort < Column
    private

    # x-column-header-sort-ASC
    # x-column-header-sort-DESC
    def sort column, sort_order
      scroll column
      column_field = column_name_field column
      sort_verify_field = Label.new column_field.parent.parent.parent.parent.parent
      sort_drop_down = Button.new column_field.parent.parent.parent.parent.divs[3]

      sort_field_id = (sort_order==:ascending)?"Sort Ascending":"Sort Descending"
      verify_sort = (sort_order==:ascending)?"ASC":"DESC"
      sort_field = Label.new @browser.span :text => sort_field_id

      15.times{
        sort_drop_down.scroll_into_view
        sort_drop_down.safe_click unless sort_field.present?
        sort_field.safe_click
        sleep 1
        return true if sort_verify_field.attribute_value("class").include? verify_sort
        return true if sort_verify_field.attribute_value("class").include? verify_sort
        return true if sort_verify_field.attribute_value("class").include? verify_sort
        return true if sort_verify_field.attribute_value("class").include? verify_sort
      }
      false
    end

    public

    def initialize browser, column
      super browser
      @column = column
    end

    def ascending
      sort @column, :ascending
    end

    def descending
      sort @column, :descending
    end

  end

  class Recipient < Column

    def sort
      Sort.new @browser, :recipient
    end

    def field row
      grid_field_column_name :recipient, row
    end
    
    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id}, Row #{row}"
      grid_text(:recipient, row)
    end

    def data_for row
      grid_text(:recipient, row)
    end

  end

  class Company < Column

    def sort
      Sort.new @browser, :company
    end

    def scroll_into_view
      scroll :company
    end

    def field row
      grid_field_column_name :company, row
    end

    def data_for row
      grid_text(:company, row)
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id}, Row #{row}"
      grid_text(:company, row)
    end
  end

  class Address < Column

    def sort
      Sort.new @browser, :address
    end

    def scroll_into_view
      scroll :address
    end

    def field row
      grid_field_column_name :address, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:address, row)
    end

    def data_for row
      grid_text(:address, row)
    end
  end

  class City < Column

    def sort
      Sort.new @browser, :city
    end

    def scroll_into_view
      scroll :city
    end

    def field row
      grid_field_column_name :city, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:city, row)
    end
  end

  class State < Column

    def sort
      Sort.new @browser, :state
    end

    def scroll_into_view
      scroll :state
    end

    def field row
      grid_field_column_name :state, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:state, row)
    end
  end

  class Zip < Column

    def sort
      Sort.new @browser, :zip
    end

    def scroll_into_view
      scroll :zip
    end

    def field row
      grid_field_column_name :zip, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:zip, row)
    end
  end

  class Phone < Column

    def sort
      Sort.new @browser, :phone
    end

    def scroll_into_view
      scroll :phone
    end

    def field row
      grid_field_column_name :phone, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:phone, row)
    end
  end

  class Email < Column

    def sort
      Sort.new @browser, :email
    end

    def scroll_into_view
      scroll :email
    end

    def field row
      grid_field_column_name :email, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:email, row)
    end
  end

  class Qty < Column

    def sort
      Sort.new @browser, :qty
    end

    def scroll_into_view
      scroll :qty
    end

    def field row
      grid_field_column_name :qty, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:qty, row)
    end
  end

  class ItemSKU < Column

    def sort
      Sort.new @browser, :item_sku
    end

    def scroll_into_view
      scroll :item_sku
    end

    def field row
      grid_field_column_name :item_sku, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:item_sku, row)
    end
  end

  class ItemName < Column

    def sort
      Sort.new @browser, :item_name
    end

    def scroll_into_view
      scroll :item_name
    end

    def field row
      grid_field_column_name :item_name, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:item_name, row)
    end
  end

  class Weight < Column

    def sort
      Sort.new @browser, :weight
    end

    def scroll_into_view
      scroll :weight
    end

    def field row
      grid_field_column_name :weight, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      weight = grid_text(:weight, row)
      log.info "Weight: #{weight}"
      weight
    end

    def lbs order_id
      data(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
    end

    def oz order_id
      data(order_id).scan(/\d+ oz./).first.scan(/\d/).first
    end
  end

  class InsuredValue < Column

    def sort
      Sort.new @browser, :insured_value
    end

    def scroll_into_view
      scroll :insured_value
    end

    def field row
      grid_field_column_name :insured_value, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      test_helper.remove_dollar_sign grid_text(:insured_value, row)
    end
  end

  class OrderStatus < Column

    def sort
      Sort.new @browser, :order_status
    end

    def scroll_into_view
      scroll :order_status
    end

    def field row
      grid_field_column_name :order_status, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_status, row)
    end
  end

  class ShipDate < Column

    def sort
      Sort.new @browser, :ship_date
    end

    def scroll_into_view
      scroll :ship_date
    end

    def field row
      grid_field_column_name :ship_date, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_date, row)
    end
  end

  class ShipFrom < Column

    def sort
      Sort.new @browser, :ship_from
    end

    def scroll_into_view
      scroll :ship_from
    end

    def field row
      grid_field_column_name :ship_from, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_from, row)
    end
  end

  class OrderTotal < Column

    def sort
      Sort.new @browser, :order_total
    end

    def scroll_into_view
      scroll :order_total
    end

    def field row
      grid_field_column_name :order_total, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_total, row)
    end
  end

  class Country < Column

    def sort
      Sort.new @browser, :country
    end

    def scroll_into_view
      scroll :country
    end

    def field row
      grid_field_column_name :country, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:country, row)
    end
  end

  class ShipCost < Column

    def sort
      Sort.new @browser, :ship_cost
    end

    def scroll_into_view
      scroll :ship_cost
    end

    def field row
      grid_field_column_name :ship_cost, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_cost, row)
    end

    def ship_cost_error order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"

      ship_cost_field = grid_field :ship_cost, row

      begin
        div = ship_cost_field.div
        data_error = browser_helper.attribute_value div, "data-qtip"
      rescue
        data_error = ""
      end

      log.info "#{order_id} data-qtip error:  #{(data_error.length==0)?"None":data_error}"
      data_error
    end

  end

  class Company < Column

    def sort
      Sort.new @browser, :company
    end

    def scroll_into_view
      scroll :company
    end

    def field row
      grid_field_column_name :company, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:company, row)
    end
  end

  class Service < Column

    def sort
      Sort.new @browser, :service
    end

    def scroll_into_view
      scroll :service
    end

    def field row
      grid_field_column_name :service, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:service, row)
    end
  end

  class ReferenceNo < Column

    def sort
      Sort.new @browser, :reference_no
    end

    def scroll_into_view
      scroll :reference_no
    end

    def field row
      grid_field_column_name :reference_no, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:reference_no, row)
    end
  end

  class CostCode < Column

    def sort
      Sort.new @browser, :cost_code
    end

    def scroll_into_view
      scroll :cost_code
    end

    def field row
      grid_field_column_name :cost_code, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:cost_code, row)
    end
  end

  class Tracking < Column

    def sort
      Sort.new @browser, :tracking_no
    end

    def scroll_into_view
      scroll :tracking_no
    end

    def field row
      grid_field_column_name :tracking_no, row
    end

    def data order_id
      scroll_into_view
      grid_text :tracking_no, row_number(order_id)
    end
  end

  class DatePrinted < Column

    def sort
      Sort.new @browser, :date_printed
    end
    def scroll_into_view
      scroll :date_printed
    end

    def field row
      grid_field_column_name :ship_date, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log.info "Order ID: #{order_id} = Row #{row}"
      grid_text(:date_printed, row)
    end
  end

  class CheckBox < Column
    private
    def checkbox_header
      scroll_into_view

      checkbox_field = (@browser.spans :css => "div[componentid^=gridcolumn]").first
      check_verify_field = @browser.div :css => "div[class*=x-column-header-checkbox]"
      attribute = "class"
      attrib_value_check = "checker-on"
      Stamps::Browser::Checkbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
    end

    public

    def scroll_into_view
      field = Label.new((@browser.spans :css => "div[componentid^=gridcolumn]").first)
      field.scroll_into_view
      field
    end

    def field row
      grid_field_column_name :check_box, row
    end

    def edit order_id
      check row_number order_id
    end

    def check number
      scroll_into_view
      if size > 0
        checkbox_field = row_div number
        verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
        checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
        checkbox.check
        log.info "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
      else
        log.info "Grid is empty"
      end
    end

    def uncheck number
      scroll_into_view
      if size > 0
        checkbox_field = row_div number
        verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
        checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
        checkbox.uncheck
        log.info "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
      else
        log.info "Grid is empty"
      end
    end

    def checked? number
      scroll_into_view
      checkbox_field = row_div number
      verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
      checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
      checkbox.checked?
    end

    def order_id_checked? order_number
      scroll_into_view
      checked? row_number order_number
    end

    def check_all *args
      scroll_into_view
      if args.length==1
        if args[0].is_a? Hash
          rows = args[0]
          log.info "Restoring #{} checked orders..."
        else
          raise "Invalid parameter exception.  This method expects a Hash of Web Elements."
        end

        rows.each do |hash_element|
          row_number = hash_element[0]
          checked = hash_element[1]
          if checked
            check row_number
            log.info "Row #{row_number} #{row_checked? row_number}"
          end

        end
      else
        checkbox_header.check
      end
    end

    def uncheck_all
      scroll_into_view
      checkbox_header.uncheck
    end

    def checked_rows *args
      cache_count = 10
      if args.length == 1
        cache_count = args[0]
      end

      log.info "Caching checked rows..."
      checked_rows = Hash.new
      grid_total = row_count
      if cache_count > 2 && cache_count < grid_total
        cache_item_count = cache_count
      elsif cache_count > grid_total
        cache_item_count = grid_total
      else
        cache_item_count = cache_count
      end
      log.info "Number of rows to check:  #{cache_item_count}"
      1.upto(cache_item_count) { |row|
        checked = checked? row
        if checked
          checked_rows[row] = checked
        end
        log.info "Row #{row} Checked? #{checked}.  Stored:  #{checked_rows[row]}"
      }
      log.info "Checked rows cached."
      checked_rows
    end

  end

  # Order Grid
  class Grid < BatchObject

    def checkbox
      @check ||= CheckBox.new @browser
    end

    def order_id
      @order_id ||= OrderId.new @browser
    end

    def ship_cost
      @ship_cost ||= ShipCost.new @browser
    end

    def age
      @age ||= Age.new @browser
    end

    def order_date
      @order_date ||= OrderDate.new @browser
    end

    def recipient
      @recipient ||= Recipient.new @browser
    end

    def company
      @company ||= Company.new @browser
    end

    def address
      @address ||= Address.new @browser
    end

    def city
      @city ||= City.new @browser
    end

    def state
      @state ||= State.new @browser
    end

    def zip
      @zip ||= Zip.new @browser
    end

    def country
      @country ||= Country.new @browser
    end

    def phone
      @phone ||= Phone.new @browser
    end

    def email
      @email ||= Email.new @browser
    end

    def qty
      @qty ||= Qty.new @browser
    end

    def item_sku
      @item_sku ||= ItemSKU.new @browser
    end

    def item_name
      @item_name ||= ItemName.new @browser
    end

    def ship_from
      @ship_from ||= ShipFrom.new @browser
    end

    def service
      @service ||= Service.new @browser
    end

    def weight
      @weight ||= Weight.new @browser
    end

    def insured_value
      @insured_value ||= InsuredValue.new @browser
    end

    def reference_no
      @reference_no ||= ReferenceNo.new @browser
    end

    def cost_code
      @cost_code ||= CostCode.new @browser
    end

    def order_status
      @order_status ||= OrderStatus.new @browser
    end

    def date_printed
      @date_printed ||= DatePrinted.new @browser
    end

    def ship_date
      @ship_date ||= ShipDate.new @browser
    end

    def tracking_no
      @tracking ||= Tracking.new @browser
    end

    def order_total
      @order_total ||= OrderTotal.new @browser
    end

    def toolbar
      @grid_toolbar ||= GridToolbar.new @browser
    end

    def wait_until_present *args
      grid_present_span = Label.new (@browser.div :css => "div[id=appContent]>div>div>div[id^=ordersGrid]")
      log.info "Order Grid is #{(grid_present_span.present?)?'present':'NOT present'}"
      grid_present_span.wait_until_present
      log.info "Order Grid is #{(grid_present_span.present?)?'present':'NOT present'}"
    end

  end

end