module Batch

  # Order Grid Toolbar
  class GridToolbar < BatchObject
    def present?

    end

    def page_count
      #field=@browser.text_field :css => "input[name^=combobox]"
      #text_box = Textbox.new field
      #log text_box.present?
      #text_box
      divs = @browser.divs :css => "div[id^=tbtext]"
      div = divs.last
      present = browser_helper.present? div
      log "Page count: #{browser_helper.text div}" # of X
      div
    end

    def page_number
      field = @browser.text_field :css => "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
      text_box = Textbox.new field
      log text_box.present?
      text_box
    end

    def first_page
      field = @browser.span :css => "span[class*=x-tbar-page-first]"
      label = Label.new field
      log label.present?
      label
    end

    def first_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.disabled?
      label.disabled?
    end

    def previous_page
      field = @browser.span :css => "span[class*=x-tbar-page-prev]"
      label = Label.new field
      log label.present?
      label
    end

    def previous_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.disabled?
      label.disabled?
    end

    def next_page
      field = @browser.span :css => "span[class*=x-tbar-page-next]"
      label = Label.new field
      log label.present?
      label
    end

    def last_page
      field = @browser.span :css => "span[class*=x-tbar-page-last]"
      label = Label.new field
      log label.present?
      label
    end

    def last_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.present?
      label
    end

    def total_number_of_pages
      fields = @browser.divs :css => "div[id^=tbtext-]"
      field=fields.last
      label = Label.new field
      log label.present?
      label
      #of 6
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
        :tracking => "Tracking #",
        :order_total => "Order Total"
    }

    def scroll column
      Label.new(column_header_field column).scroll_into_view
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
      @column_fields ||= @browser.spans :css => "div[componentid^=gridcolumn]"
    end

    def column_header_field column
      column_str = GRID_COLUMNS[column]
      columns = column_fields
      columns.each{ |column_field|
        column_text = browser_helper.text column_field
        #log "#{column_text} == #{column_str} ? #{column_text == column_str}"
        if column_text.downcase == column_str.downcase
          return column_field
        end
      }
    end

    def row_number order_id
      row = 1
      column = column_number(:order_id)
      css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column})>div"
      #log "Order ID: #{order_id} CSS: #{css}"
      fields = @browser.divs :css => css
      fields.each_with_index { |div, index|
        row_text = browser_helper.text div
        if row_text.include? order_id
          row = index + 1 #row offset
          #log "Order ID #{order_id} is in Row #{row}"
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

    #------------------------------------


    def click_sort_drop_down id

      sort_array = @browser.divs :css => "div[class*=x-column-header-trigger]"

      log "This is #{id}"

      sort_array.each_with_index do |arrow, index|
        if browser_helper.attribute_value(sort_array[index], 'id').include? id
          @browser.execute_script('arguments[0].scrollIntoView();', sort_array[index])
          browser_helper.click sort_array[index]
        end

      end
    end

    def click_sort_option sort

      ascending_array = @browser.spans(:text => "Sort Ascending")
      descending_array = @browser.spans(:text => "Sort Descending")

      if sort.eql? "ascending"
        ascending_array.each_with_index do |name, index|
          if name.visible?
            browser_helper.click ascending_array[index]
          end
        end

      elsif sort.eql? "descending"
        descending_array.each_with_index do |name, index|
          if name.visible?
            browser_helper.click descending_array[index]
          end
        end
      end
      sleep 5
    end

    def hover_over_header header_name
      header = column_header header_name
      header.click
      header.focus
    end

    def get_header_id header_name
      header = column_header header_name
      parent_header=header.parent
      whole_id = browser_helper.attribute_value(parent_header, 'id')
      whole_id_array = whole_id.split("-")
      whole_id_array[1]


    end

    def click_header header_name
      browser_helper.click column_header header_name
    end

    def column_header header_name
      @browser.span(:text => header_name)
    end

    def check_sorted_column(name, sort)   #function to verify that order column is sorted
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
          check_sort = compare_sorted_weight(id, sort)
        when 'Item SKU'
          check_sort = compare_sorted_items(id, sort)
        when 'Item Name'
          check_sort = compare_sorted_items(id, sort)
        when 'Order Date'
          check_sort = compare_sorted_ages(id, sort)
        when 'Age'
          check_sort = compare_sorted_ages(id, sort)
        when 'Insured Value'
          check_sort = compare_sorted_money(id, sort)
        when 'Order Total'
          check_sort = compare_sorted_money(id, sort)
        else
          if sort == 'ascending'                #check if sort check is for s or ascending order
            check_sort = compare_cells(id,1)          #call function to compare first ten cells in column for ascending order
          elsif sort == 'descending'
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


    def compare_sorted_ages(id, sort)
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
        log "COMPARING #{time_amount_1} #{age_array_1[1]} and #{time_amount_2} #{age_array_2[1]} for #{sort} order"

        if sort == 'ascending'
          if (time_unit_1 <=> time_unit_2) == -1
            return false
          elsif (time_unit_1 <=> time_unit_2) == 0 && (time_amount_1 <=> time_amount_2) == -1
            return false
          end
        elsif sort == 'descending'
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

  end

  class OrderId < Column
    def scroll_into_view
      scroll :order_id
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

    def sort order
      id = get_header_id "Order ID"
      log "Sorting Order ID in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order ID for #{order} sort order"
      batch.grid.first_column.check_sorted_column("Order ID", order)
    end
  end

  class Age < Column
    def scroll_into_view
      scroll :age
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      #log "Order ID: #{order_id} = Row #{row}"
      grid_text(:age, row)
    end

    def sort order
      id = get_header_id "Age"
      #log "Sorting Age in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      #log "Checking Age for #{order} sort order"
      batch.grid.first_column.check_sorted_column("Age", order)
    end
  end

  class OrderDate < Column
    def scroll_into_view
      scroll :order_date
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_date, row)
    end

    def sort order

      id = get_header_id "Order Date"
      log "Sorting Order Date in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order Date for #{order} sort order"
      batch.grid.first_column.check_sorted_column("Order Date", order)
    end
  end

  class Recipient < Column
    def scroll_into_view
      scroll :recipient
    end
    
    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:recipient, row)
    end

    def sort order

      id = get_header_id "Recipient"
      log "Sorting Recipient in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Recipient for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Recipient', order)
    end
  end

  class Company < Column
    def scroll_into_view
      scroll :company
    end

    def sort order
      scroll_into_view
      id = get_header_id "Company"
      log "Sorting Company in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Company for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Company', order)
    end
  end

  class Address < Column
    def scroll_into_view
      scroll :domestic
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:domestic, row)
    end

    def sort order

      id = get_header_id "Address"
      log "Sorting Address in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Address for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Address', order)
    end
  end

  class City < Column
    def scroll_into_view
      scroll :city
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:city, row)
    end

    def sort order
      id = get_header_id "City"
      log "Sorting City in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking City for #{order} sort order"
      batch.grid.first_column.check_sorted_column('City', order)
    end
  end

  class State < Column
    def scroll_into_view
      scroll :state
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:state, row)
    end

    def sort order
      id = get_header_id "State"
      log "Sorting State in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking State for #{order} sort order"
      batch.grid.first_column.check_sorted_column('State', order)
    end
  end

  class Zip < Column
    def scroll_into_view
      scroll :zip
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:zip, row)
    end

    def sort order

      id = get_header_id "Zip"
      log "Sorting Zip in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Zip for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Zip', order)
    end
  end

  class Phone < Column
    def scroll_into_view
      scroll :phone
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:phone, row)
    end

    def sort order

      id = get_header_id "Phone"
      log "Sorting Phone in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Phone for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Phone', order)
    end
  end

  class Email < Column
    def scroll_into_view
      scroll :email
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:email, row)
    end

    def sort order

      id = get_header_id "Email"
      log "Sorting Email in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Email for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Email', order)
    end
  end

  class Qty < Column
    def scroll_into_view
      scroll :qty
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:qty, row)
    end

    def sort order

      id = get_header_id "Qty."
      log "Sorting Qty in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Qty for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Qty.', order)
    end
  end

  class ItemSKU < Column
    def scroll_into_view
      scroll :item_sku
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:item_sku, row)
    end

    def sort order

      id = get_header_id "Item SKU"
      log "Sorting Item SKU in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Item SKU for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Item SKU', order)
    end
  end

  class ItemName < Column
    def scroll_into_view
      scroll :item_name
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:item_name, row)
    end

    def sort order
      id = get_header_id "Item Name"
      log "Sorting Item Name in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Item Name for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Item Name', order)
    end
  end

  class Weight < Column
    def scroll_into_view
      scroll :weight
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      weight = grid_text(:weight, row)
      log "Weight: #{weight}"
      weight
    end

    # 5 lbs. 10 oz.
    def lbs order_id
      data(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
    end

    def oz order_id
      data(order_id).scan(/\d+ oz./).first.scan(/\d/).first
    end

    def sort order

      id = get_header_id "Weight"
      log "Sorting Weight in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Weight for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Weight', order)
    end
  end

  class InsuredValue < Column
    def scroll_into_view
      scroll :insured_value
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      test_helper.remove_dollar_sign grid_text(:insured_value, row)
    end

    def sort order

      id = get_header_id "Insured Value"
      log "Sorting Insured Value in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Insured Value for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Insured Value', order)
    end
  end

  class OrderStatus < Column
    def scroll_into_view
      scroll :order_status
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_status, row)
    end

    def sort order

      id = get_header_id "Order Status"
      log "Sorting Order Status in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order Status for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Order Status', order)
    end
  end

  class ShipDate < Column
    def scroll_into_view
      scroll :ship_date
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_date, row)
    end

    def sort order

    end
  end

  class ShipFrom < Column
    def scroll_into_view
      scroll :ship_from
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_from, row)
    end

    def sort order

    end
  end

  class OrderTotal < Column
    def scroll_into_view
      scroll :order_total
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_total, row)
    end

    def sort order

      id = get_header_id "Order Total"
      log "Sorting Order Total in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order Total for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Order Total', order)
    end
  end

  class Country < Column
    def scroll_into_view
      scroll :country
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:country, row)
    end

    def sort order

      id = get_header_id "Country"
      log "Sorting Country in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Country for #{order} sort order"
      batch.grid.first_column.check_sorted_column('Country', order)
    end
  end

  class ShipCost < Column
    def scroll_into_view
      scroll :ship_cost
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_cost, row)
    end

    def ship_cost_error order_id
      scroll_into_view
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

    def sort order

    end
  end

  class Company < Column
    def scroll_into_view
      scroll :company
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:company, row)
    end

    def sort order

    end

  end

  class Service < Column
    def scroll_into_view
      scroll :service
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:service, row)
    end

    def sort order

    end

  end

  class ReferenceNo < Column
    def scroll_into_view
      scroll :reference_no
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:reference_no, row)
    end

    def sort order

    end

  end

  class CostCode < Column
    def scroll_into_view
      scroll :cost_code
    end

    def data order_id
      scroll_into_view
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:cost_code, row)
    end

    def sort order

    end

  end

  class Tracking < Column
    def scroll_into_view
      scroll :tracking
    end

    def data order_id
      scroll_into_view
      grid_text :tracking, row_number(order_id)
    end

    def sort order

    end

  end

  class FirstColumn < Column
    def scroll_into_view
      scroll :check_box
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
        log "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
      else
        log "Grid is empty"
      end
    end

    def check number
      scroll_into_view
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

    def total_number_of_orders
      tables = @browser.tables :css => "div[id^=ordersGrid]>div>div>table"
      count = tables.size
      log "Total Number of Orders on Grid:  #{count}"
      count.to_i
    end

    def check_rows rows
      scroll_into_view
      log "Restoring #{} checked orders..."
      begin
        rows.each do |row|
          checked = rows[row]
          if checked
            check row
            log "Row #{row} #{row_checked? row}"
          end
        end
      end unless rows.nil?
    end
  end

  # Order Grid
  class Grid < BatchObject
    def age
      Age.new @browser
    end

    def order_id
      OrderId.new @browser
    end

    def order_date
      OrderDate.new @browser
    end

    def recipient
      Recipient.new @browser
    end

    def domestic
      Address.new @browser
    end

    def city
      City.new @browser
    end

    def state
      State.new @browser
    end

    def zip
      Zip.new @browser
    end

    def phone
      Phone.new @browser
    end

    def email
      Email.new @browser
    end

    def qty
      Qty.new @browser
    end

    def item_sku
      ItemSKU.new @browser
    end

    def item_name
      ItemName.new @browser
    end

    def weight
      Weight.new @browser
    end

    def insured_value
      InsuredValue.new @browser
    end

    def order_status
      OrderStatus.new @browser
    end

    def ship_date
      ShipDate.new @browser
    end

    def ship_from
      ShipFrom.new @browser
    end

    def order_total
      OrderTotal.new @browser
    end

    def country
      Country.new @browser
    end

    def ship_cost
      ShipCost.new @browser
    end

    def company
      Company.new @browser
    end

    def service
      Service.new @browser
    end

    def reference_no
      ReferenceNo.new @browser
    end

    def cost_code
      CostCode.new @browser
    end

    def tracking
      Tracking.new @browser
    end

    def first_column
      FirstColumn.new @browser
    end

    def toolbar
      GridToolbar.new @browser
    end

    def wait_until_present *args
      grid_present_span = Label.new (@browser.div :css => "div[id=appContent]>div>div>div[id^=ordersGrid]")
      log "Order Grid is #{(grid_present_span.present?)?'present':'NOT present'}"
      grid_present_span.wait_until_present
      log "Order Grid is #{(grid_present_span.present?)?'present':'NOT present'}"
    end

  end
end