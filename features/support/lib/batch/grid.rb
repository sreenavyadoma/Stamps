module Batch
  #
  # Orders Grid
  #
  class Grid < BatchObject
    public
    MONTH_ARRAY = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
    TIME_UNITS_ARRAY = ['minute','minutes','hour','hours','day','days']
    GRID_COLUMNS ||= {
        :check => " ",
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
        :description => "Item Name",
        :ship_from => "Ship From",
        :service => "Service",
        :weight => "Weight",
        :insured_value => "Insured Value",
        :reference_no => "Reference No.",
        :cost_code => "Cost Code",
        :order_status => "Order Status",
        :ship_date => "Ship Date",
        :tracking => "Tracking #",
        :order_total => "Order Total"
    }

    def test_helper
      TestHelper.instance
    end

    def grid_text column, row
      test_helper.remove_dollar_sign(browser_helper.text grid_field(column, row), "Grid.#{column}.Row#{row}")
    end

    def grid_field column, row
      @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_number(column).to_s})>div"
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
        log e
      end
    end

    def column_fields
      @browser.spans :css => "div[componentid^=gridcolumn]"
    end

    def column_header_field column
      column_str = GRID_COLUMNS[column]
      columns = column_fields
      columns.each{ |column_field|
        column_text = browser_helper.text column_field
        log "#{column_text} == #{column_str} ? #{column_text == column_str}"
        if column_text.downcase == column_str.downcase
          return column_field
        end
      }
    end

    def scroll_into_view column
      field = Label.new column_header_field column
      field.scroll_into_view @browser
      log "Grid Column #{column} #{((field.present?)? 'scrolled into view' :'not visible')}"
    end

    def row_number order_id
      row = 1
      column = column_number(:order_id)
      css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column})>div"
      log "Order ID: #{order_id} CSS: #{css}"
      fields = @browser.divs :css => css
      fields.each_with_index { |div, index|
        row_text = browser_helper.text div
        if row_text.include? order_id
          row = index + 1 #row offset
          log "Found it. Order ID #{order_id} is in Row #{row}"
          break
        end
      }
      row
    end

    def order_id row
      scroll_into_view :order_id
      8.times{
        break if size > 0
        sleep 1
      }

      if size == 0
        return '0000'
      end

      begin
        grid_text(:order_id, row)
      rescue
        return '0000'
      end
    end

    def row_div number
      raise "row_div:  number can't be nil" if number.nil?
      div = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div[class=x-grid-row-checker]"
      raise("Order Grid Row number #{number} is not present")unless browser_helper.present? div
      div
    end

    def edit_order(order_id)
      check_row(row_number order_id)
    end

    def uncheck_row number
      scroll_into_view :check
      if size > 0
        checkbox_field = row_div number
        verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
        checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
        checkbox.uncheck
        log "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
      else
        log "Grid is empty"
      end
    end

    def check_row number
      scroll_into_view :check
      if size > 0
        checkbox_field = row_div number
        verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
        checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
        checkbox.check
        log "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
      else
        log "Grid is empty"
      end
    end

    def row_checked? number
      scroll_into_view :check
      checkbox_field = row_div number
      verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
      checkbox = Checkbox.new checkbox_field, verify_field, "class", "grid-item-selected"
      checkbox.checked?
    end

    def select_all_checkbox
      scroll_into_view :check
      spans = @browser.spans :css => "span[class=x-column-header-text]"
      checkbox_field = spans.first
      check_verify_field = @browser.div :css => "div[class*=x-column-header-checkbox]"
      attribute = "class"
      attrib_value_check = "checker-on"
      Stamps::Browser::Checkbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
    end

    def select_all
      scroll_into_view :check
      select_all_checkbox.check
    end

    def unselect_all
      scroll_into_view :check
      select_all_checkbox.uncheck
    end

    def order_checked?(order_number)
      scroll_into_view :check
      row_checked? row_number order_number
    end

    def size
      @browser.tables(:css=>"div[id^=ordersGrid]>div>div>table").size
    end

    def paging_toolbar
      OrderGridPagingToolbar.new @browser
    end

    def grid_present_span
      div = @browser.div :css => "div[id=appContent]>div>div>div[id^=ordersGrid]"
      log "Order Grid is #{(browser_helper.present? div)?'present':'NOT present'}"
      div
    end

    def wait_until_present *args
      case args.length
        when 0
          browser_helper.wait_until_present grid_present_span
        when 1
          browser_helper.wait_until_present grid_present_span, args[0].to_i
        else
          raise "Illegal number of arguments for wait_until_present"
      end
    end

    def cache_checked_rows *args
      cache_count = 2
      if args.length == 1
        cache_count = args[0]
      end

      log "Caching checked rows..."
      checked_rows = Hash.new
      grid_total = total_number_of_orders
      if cache_count > 2 && cache_count < grid_total
        cache_item_count = cache_count
      elsif cache_count > grid_total
        cache_item_count = grid_total
      else
        cache_item_count = cache_count
      end
      log "Number of rows to check:  #{cache_item_count}"
      1.upto(cache_item_count) { |row|
        checked = row_checked? row
        if checked
          checked_rows[row] = checked
        end
        log "Row #{row} Checked? #{checked}.  Stored:  #{checked_rows[row]}"
      }
      log "Checked rows cached."
      checked_rows
    end

    def check_rows rows
      scroll_into_view :check
      log "Restoring #{} checked orders..."
      begin
        rows.each do |row|
          checked = rows[row]
          if checked
            check_row row
            log "Row #{row} #{row_checked? row}"
          end
        end
      end unless rows.nil?
    end

    def total_number_of_orders
      tables = @browser.tables :css => "div[id^=ordersGrid]>div>div>table"
      count = tables.size
      log "Total Number of Orders on Grid:  #{count}"
      count.to_i
    end

    def ship_cost order_id
      scroll_into_view :ship_cost
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_cost, row)
    end


    def ship_cost_error order_id
      scroll_into_view :ship_cost
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"

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

    def age order_id
      scroll_into_view :age
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:age, row)
    end

    def order_date order_id
      scroll_into_view :order_date
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_date, row)
    end

    def recipient order_id
      scroll_into_view :recipient
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:recipient, row)
    end

    def company order_id
      scroll_into_view :company
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:company, row)
    end

    def domestic order_id
      scroll_into_view :domestic
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:domestic, row)
    end

    def city order_id
      scroll_into_view :city
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:city, row)
    end

    def state order_id
      scroll_into_view :state
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:state, row)
    end

    def zip order_id
      scroll_into_view :zip
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:zip, row)
    end

    def country order_id
      scroll_into_view :country
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:country, row)
    end

    def phone order_id
      scroll_into_view :phone
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:phone, row)
    end

    def email order_id
      scroll_into_view :email
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:email, row)
    end

    def qty order_id
      scroll_into_view :qty
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:qty, row)
    end

    def item_sku order_id
      scroll_into_view :item_sku
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:item_sku, row)
    end

    def item_name order_id
      scroll_into_view :item_name
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:description, row)
    end

    def ship_from order_id
      scroll_into_view :ship_from
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_from, row)
    end

    def service order_id
      scroll_into_view :service
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:service, row)
    end

    def weight order_id
      scroll_into_view :weight
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      weight = grid_text(:weight, row)
      log "Weight: #{weight}"
      weight
    end

    # 5 lbs. 10 oz.
    def lbs order_id
      weight(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
    end

    def oz order_id
      weight(order_id).scan(/\d+ oz./).first.scan(/\d/).first
    end

    def reference_no order_id
      scroll_into_view :reference_no
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:reference_no, row)
    end

    def cost_code order_id
      scroll_into_view :cost_code
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:cost_code, row)
    end

    def order_status order_id
      scroll_into_view :order_status
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_status, row)
    end

    def ship_date order_id
      scroll_into_view :ship_date
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_date, row)
    end

    def tracking order_id
      scroll_into_view :tracking
      grid_text :tracking, row_number(order_id)
    end

    def order_total order_id
      scroll_into_view :order_total
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_total, row)
    end

    def insured_value order_id
      scroll_into_view :insured_value
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      test_helper.remove_dollar_sign grid_text(:insured_value, row)
    end


    def check_sorted_column(name, sort_order)   #function to verify that order column is sorted
      id = nil
      if name.eql? 'Order Date'
        name = 'Age'
      end

      GRID_COLUMNS.each do |key, value|         #Iterate through hash of column names and values
        if value.eql? name                     #If the column name text matches the column name we want to sort
          id = key                              #Set the id variable to the key for that column
          break
        end
      end

      check_sort = true

      case name
        when 'Weight'
          check_sort = compare_sorted_weight(id, sort_order)
        when 'Item SKU'
          check_sort = compare_sorted_items(id, sort_order)
        when 'Item Name'
          check_sort = compare_sorted_items(id, sort_order)
        when 'Order Date'
          check_sort = compare_sorted_ages(id, sort_order)
        when 'Age'
          check_sort = compare_sorted_ages(id, sort_order)
        when 'Insured Value'
          check_sort = compare_sorted_money(id, sort_order)
        when 'Order Total'
          check_sort = compare_sorted_money(id, sort_order)
        else
          if sort_order == 'ascending'                #check if sort check is for s or ascending order
            check_sort = compare_cells(id,1)          #call function to compare first ten cells in column for ascending order
          elsif sort_order == 'descending'
            check_sort = compare_cells(id,-1)         #call function to compare first ten cells in column for descending order
          end
      end
      check_sort
    end

    def compare_sorted_money(id, direction)              #function to verify that text in column cells are sorted in alphanumeric order
      compare = true
      for index in 1..5
        log "COMPARING #{grid_text(id, index)} and #{grid_text(id, index+1)}"

        no_sign_cost_1 = grid_text(id, index).gsub('$','')
        no_sign_cost_2 = grid_text(id, index+1).gsub('$','')

        cost_stripped_1 = no_sign_cost_1.gsub('.','')
        cost_stripped_2 = no_sign_cost_2.gsub('.','')

        log "COMPARING #{cost_stripped_1} and #{cost_stripped_2}"

        if (cost_stripped_1 <=> cost_stripped_2) == direction       #compare text in current cell with next cell
          compare = false                                                           #set comparison check to 0 if current cell and next cell are in wrong sort order
          break
        end

      end
      compare
    end

    def compare_sorted_items(id, direction)              #function to verify that text in column cells are sorted in alphanumeric order
      compare = true
      for index in 1..5
        log "COMPARING #{grid_text(id, index)} and #{grid_text(id, index+1)}"
        item_1=grid_text(id, index).downcase
        item_2=grid_text(id, index+1).downcase

        if item_1.eql 'multiple'
          item_1 = '1'
        end

        if item_2.eql 'multiple'
          item_2 = '1'
        end

        if (item_1 <=> item_2) == direction       #compare text in current cell with next cell
          compare = false                                                           #set comparison check to 0 if current cell and next cell are in wrong sort order
          break
        end

      end
      compare
    end

    def compare_sorted_weight(id, direction)              #function to verify that text in column cells are sorted in alphanumeric order
      compare = true
      for index in 1..5
        log "COMPARING #{grid_text(id, index)} and #{grid_text(id, index+1)}"

        weight_array_1 = grid_text(id, index).split(" ")
        weight_array_2= grid_text(id, index+1).split(" ")

        pounds_1 = get_time_index(weight_array_1[0]).to_i
        pounds_2 = get_time_index(weight_array_2[0]).to_i

        ounces_1 = weight_array_1[2].to_i
        ounces_2 = weight_array_2[2].to_i

        total_ounces_1 =  pounds_1*16 + ounces_1
        total_ounces_2 =  pounds_2*16 + ounces_2


        if (total_ounces_1 <=> total_ounces_2) == direction       #compare text in current cell with next cell
          compare = false                                                           #set comparison check to 0 if current cell and next cell are in wrong sort order
          break
        end

      end
      compare
    end

    def compare_cells(id, direction)              #function to verify that text in column cells are sorted in alphanumeric order
      compare = true
      for index in 1..5
        log "COMPARING #{grid_text(id, index)} and #{grid_text(id, index+1)}"
        if (grid_text(id, index).downcase <=> grid_text(id, index+1).downcase) == direction       #compare text in current cell with next cell
          compare = false                                                           #set comparison check to 0 if current cell and next cell are in wrong sort order
          break
        end

      end
      compare
    end


    def compare_sorted_ages(id, sort_order)
      compare = true
      for index in 1..5

        age_array_1 = grid_text(id, index).split(" ")
        age_array_2 = grid_text(id, index+1).split(" ")

        if age_array_1.eql? ''
          age_array_1 = '1000000 days ago'
        end
        if age_array_2.eql? ''
          age_array_2 = '1000000 days ago'
        end

        time_unit_1 = get_time_index(age_array_1[1])
        time_unit_2 = get_time_index(age_array_2[1])

        time_amount_1 = age_array_1[0].to_i
        time_amount_2 = age_array_2[0].to_i
        log "COMPARING #{time_amount_1} #{age_array_1[1]} and #{time_amount_2} #{age_array_2[1]} for #{sort_order} order"

        if sort_order == 'ascending'
          if (time_unit_1 <=> time_unit_2) == -1
            return false
          elsif (time_unit_1 <=> time_unit_2) == 0 && (time_amount_1 <=> time_amount_2) == -1
            return false
          end
        elsif sort_order == 'descending'
          if (time_unit_1 <=> time_unit_2) == 1
            return false
          elsif (time_unit_1 <=> time_unit_2) == 0 && (time_amount_1 <=> time_amount_2) == 1
            return false
            break
          end
        end
      end
      compare
    end

    def get_time_index(time_text)
      TIME_UNITS_ARRAY.each_with_index do |time,index|
        if time_text == time
          return index
        end
      end
      return 0
    end


    def column
      Column.new @browser
    end



  end

end