module Batch

  # Order Grid Toolbar
  class GridToolbar < BatchObject
    def present?

    end

    def page_count
      divs = @browser.divs :css => "div[id^=tbtext]"
      div = divs.last
      present = browser_helper.present? div
      log "Page count: #{browser_helper.text div}" if Stamps::Test.verbose
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
        :domestic => "Address",
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
        :ship_date => "Ship Date",
        :tracking_no => "Tracking #",
        :order_total => "Order Total"
    }

    def scroll column
      Label.new(column_name_field column).scroll_into_view
    end

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


    def xsort_ascending column
      column_field = column_name_field column
      sort_drop_down = Button.new column_field.parent.parent.parent.parent.divs[1]
      sort_field = Label.new @browser.span :text => "Sort Ascending"
      sort_verify_field = Label.new column_field.parent.parent.parent.parent.parent

      5.times{
        sort_drop_down.safe_click unless sort_field.present?
        sort_field.safe_click
        sorted = sort_verify_field.attribute_value("class").downcase.include? "asc"
        break if sorted
      }
      sorted
    end

    def xsort_descending column
      column_field = column_name_field column
      sort_drop_down = Button.new column_field.parent.parent.parent.parent.divs[1]
      sort_field = Label.new @browser.span :text => "Sort Descending"
      sort_verify_field = Label.new column_field.parent.parent.parent.parent.parent

      5.times{
        sort_drop_down.safe_click unless sort_field.present?
        sort_field.safe_click
        sorted = sort_verify_field.attribute_value("class").downcase.include? "asc"
        break if sorted
      }
      sorted
    end

    def column_name_field column
      column_name = @browser.span :text => GRID_COLUMNS[column]
      log "Column Name:  #{browser_helper.text column_name}" if Stamps::Test.verbose
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
      test_helper.remove_dollar_sign(browser_helper.text grid_field(column, row), "Grid.#{column}.Row#{row}")
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
        log e if Stamps::Test.verbose
      end
    end

    def column_fields
      @column_fields ||= @browser.spans :css => "div[componentid^=gridcolumn]"
    end

    def row_number order_id
      row = 1
      column = column_number(:order_id)
      css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column})>div"
      log "Order ID: #{order_id} CSS: #{css}" if Stamps::Test.verbose
      fields = @browser.divs :css => css
      fields.each_with_index { |div, index|
        row_text = browser_helper.text div
        if row_text.include? order_id
          row = index + 1 #row offset
          log "Order ID #{order_id} is in Row #{row}" if Stamps::Test.verbose
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

    def sort_ascending
      sort :order_id, :ascending
    end

    def sort_descending
      sort :order_id, :descending
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

    def sort_ascending
      sort :age, :ascending
    end

    def sort_descending
      sort :age, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:age, row)
    end
  end

  class OrderDate < Column

    def sort_ascending
      sort :order_date, :ascending
    end

    def sort_descending
      sort :order_date, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:order_date, row)
    end
  end

  class Recipient < Column

    def sort_ascending
      sort :recipient, :ascending
    end

    def sort_descending
      sort :recipient, :descending
    end

    def scroll_into_view
      scroll :recipient
    end

    def field row
      grid_field_column_name :recipient, row
    end
    
    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id}, Row #{row}" if Stamps::Test.verbose
      grid_text(:recipient, row)
    end

  end

  class Company < Column

    def sort_ascending
      sort :company, :ascending
    end

    def sort_descending
      sort :company, :descending
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
      log "Order ID: #{order_id}, Row #{row}" if Stamps::Test.verbose
      grid_text(:company, row)
    end
  end

  class Address < Column

    def sort_ascending
      sort :domestic, :ascending
    end

    def sort_descending
      sort :domestic, :descending
    end

    def scroll_into_view
      scroll :domestic
    end

    def field row
      grid_field_column_name :domestic, row
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:domestic, row)
    end
  end

  class City < Column

    def sort_ascending
      sort :city, :ascending
    end

    def sort_descending
      sort :city, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:city, row)
    end
  end

  class State < Column

    def sort_ascending
      sort :state, :ascending
    end

    def sort_descending
      sort :state, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:state, row)
    end
  end

  class Zip < Column

    def sort_ascending
      sort :zip, :ascending
    end

    def sort_descending
      sort :zip, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:zip, row)
    end
  end

  class Phone < Column

    def sort_ascending
      sort :phone, :ascending
    end

    def sort_descending
      sort :phone, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:phone, row)
    end
  end

  class Email < Column

    def sort_ascending
      sort :email, :ascending
    end

    def sort_descending
      sort :email, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:email, row)
    end
  end

  class Qty < Column

    def sort_ascending
      sort :qty, :ascending
    end

    def sort_descending
      sort :qty, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:qty, row)
    end
  end

  class ItemSKU < Column

    def sort_ascending
      sort :item_sku, :ascending
    end

    def sort_descending
      sort :item_sku, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:item_sku, row)
    end
  end

  class ItemName < Column

    def sort_ascending
      sort :item_name, :ascending
    end

    def sort_descending
      sort :item_name, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:item_name, row)
    end
  end

  class Weight < Column

    def sort_ascending
      sort :weight, :ascending
    end

    def sort_descending
      sort :weight, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      weight = grid_text(:weight, row)
      log "Weight: #{weight}" if Stamps::Test.verbose
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

    def sort_ascending
      sort :insured_value, :ascending
    end

    def sort_descending
      sort :insured_value, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      test_helper.remove_dollar_sign grid_text(:insured_value, row)
    end
  end

  class OrderStatus < Column

    def sort_ascending
      sort :order_status, :ascending
    end

    def sort_descending
      sort :order_status, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:order_status, row)
    end
  end

  class ShipDate < Column

    def sort_ascending
      sort :ship_date, :ascending
    end

    def sort_descending
      sort :ship_date, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:ship_date, row)
    end
  end

  class ShipFrom < Column

    def sort_ascending
      sort :ship_from, :ascending
    end

    def sort_descending
      sort :ship_from, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:ship_from, row)
    end
  end

  class OrderTotal < Column

    def sort_ascending
      sort :order_total, :ascending
    end

    def sort_descending
      sort :order_total, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:order_total, row)
    end
  end

  class Country < Column

    def sort_ascending
      sort :country, :ascending
    end

    def sort_descending
      sort :country, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:country, row)
    end
  end

  class ShipCost < Column

    def sort_ascending
      sort :ship_cost, :ascending
    end

    def sort_descending
      sort :ship_cost, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:ship_cost, row)
    end

    def ship_cost_error order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose

      ship_cost_field = grid_field :ship_cost, row

      begin
        div = ship_cost_field.div
        data_error = browser_helper.attribute_value div, "data-qtip"
      rescue
        data_error = ""
      end

      log "#{order_id} data-qtip error:  #{(data_error.length==0)?"None":data_error}"
      data_error
    end

  end

  class Company < Column

    def sort_ascending
      sort :company, :ascending
    end

    def sort_descending
      sort :company, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:company, row)
    end
  end

  class Service < Column

    def sort_ascending
      sort :service, :ascending
    end

    def sort_descending
      sort :service, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:service, row)
    end
  end

  class ReferenceNo < Column

    def sort_ascending
      sort :reference_no, :ascending
    end

    def sort_descending
      sort :reference_no, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:reference_no, row)
    end
  end

  class CostCode < Column

    def sort_ascending
      sort :cost_code, :ascending
    end

    def sort_descending
      sort :cost_code, :descending
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
      log "Order ID: #{order_id} = Row #{row}" if Stamps::Test.verbose
      grid_text(:cost_code, row)
    end
  end

  class Tracking < Column

    def sort_ascending
      sort :tracking_no, :ascending
    end

    def sort_descending
      sort :tracking_no, :descending
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

  class CheckColumn < Column
    def scroll_into_view
      Label.new((@browser.spans :css => "div[componentid^=gridcolumn]").first).scroll_into_view
    end

    def field row
      grid_field_column_name :check_box, row
    end

    def edit order_id
      check(row_number order_id)
    end

    def uncheck number
      self.scroll_into_view
      if size > 0
        checkbox_field = row_div number
        verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
        checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
        checkbox.uncheck
        log "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}." if Stamps::Test.verbose
      else
        log "Grid is empty" if Stamps::Test.verbose
      end
    end

    def check number
      scroll_into_view
      if size > 0
        checkbox_field = row_div number
        verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
        checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
        checkbox.check
        log "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}." if Stamps::Test.verbose
      else
        log "Grid is empty" if Stamps::Test.verbose
      end
    end

    def row_checked? number
      scroll_into_view
      checkbox_field = row_div number
      verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
      checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
      checkbox.checked?
    end

    def select_all_checkbox
      scroll_into_view
      spans = @browser.spans :css => "span[class=x-column-header-text]"
      checkbox_field = spans.first
      check_verify_field = @browser.div :css => "div[class*=x-column-header-checkbox]"
      attribute = "class"
      attrib_value_check = "checker-on"
      Stamps::Browser::Checkbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
    end

    def select_all
      scroll_into_view
      select_all_checkbox.check
    end

    def unselect_all
      scroll_into_view
      select_all_checkbox.uncheck
    end

    def order_checked? order_number
      scroll_into_view
      row_checked? row_number order_number
    end

    def cache_checked_rows *args
      cache_count = 2
      if args.length == 1
        cache_count = args[0]
      end

      log "Caching checked rows..." if Stamps::Test.verbose
      checked_rows = Hash.new
      grid_total = total_number_of_orders
      if cache_count > 2 && cache_count < grid_total
        cache_item_count = cache_count
      elsif cache_count > grid_total
        cache_item_count = grid_total
      else
        cache_item_count = cache_count
      end
      log "Number of rows to check:  #{cache_item_count}" if Stamps::Test.verbose
      1.upto(cache_item_count) { |row|
        checked = row_checked? row
        if checked
          checked_rows[row] = checked
        end
        log "Row #{row} Checked? #{checked}.  Stored:  #{checked_rows[row]}" if Stamps::Test.verbose
      }
      log "Checked rows cached." if Stamps::Test.verbose
      checked_rows
    end

    def total_number_of_orders
      tables = @browser.tables :css => "div[id^=ordersGrid]>div>div>table"
      count = tables.size
      log "Total Number of Orders on Grid:  #{count}" if Stamps::Test.verbose
      count.to_i
    end

    def check_rows rows
      scroll_into_view
      log "Restoring #{} checked orders..." if Stamps::Test.verbose
      begin
        rows.each do |row|
          checked = rows[row]
          if checked
            check row
            log "Row #{row} #{row_checked? row}" if Stamps::Test.verbose
          end
        end
      end unless rows.nil?
    end
  end

  # Order Grid
  class Grid < BatchObject
    def age
      @age ||= Age.new @browser
    end

    def order_id
      @order_id ||= OrderId.new @browser
    end

    def order_date
      @order_date ||= OrderDate.new @browser
    end

    def recipient
      @recipient ||= Recipient.new @browser
    end

    def domestic
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

    def weight
      @weight ||= Weight.new @browser
    end

    def insured_value
      @insured_value ||= InsuredValue.new @browser
    end

    def order_status
      @order_status ||= OrderStatus.new @browser
    end

    def ship_date
      @ship_date ||= ShipDate.new @browser
    end

    def ship_from
      @ship_from ||= ShipFrom.new @browser
    end

    def order_total
      @order_total ||= OrderTotal.new @browser
    end

    def country
      @country ||= Country.new @browser
    end

    def ship_cost
      @ship_cost ||= ShipCost.new @browser
    end

    def company
      @company ||= Company.new @browser
    end

    def address
      @address ||= Address.new @browser
    end

    def service
      @service ||= Service.new @browser
    end

    def reference_no
      @reference_no ||= ReferenceNo.new @browser
    end

    def cost_code
      @cost_code ||= CostCode.new @browser
    end

    def tracking_no
      @tracking ||= Tracking.new @browser
    end

    def check
      @check ||= CheckColumn.new @browser
    end

    def toolbar
      @grid_toolbar ||= GridToolbar.new @browser
    end

    def wait_until_present *args
      grid_present_span = Label.new (@browser.div :css => "div[id=appContent]>div>div>div[id^=ordersGrid]")
      log "Order Grid is #{(grid_present_span.present?)?'present':'NOT present'}" if Stamps::Test.verbose
      grid_present_span.wait_until_present
      log "Order Grid is #{(grid_present_span.present?)?'present':'NOT present'}" if Stamps::Test.verbose
    end

  end

end