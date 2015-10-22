module Batch
  class GridBase < BatchObject
    GRID_COLUMNS ||= {
        :check_all => " ",
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
      text = test_helper.remove_dollar_sign(browser_helper.text grid_field(column, row), "Grid.#{column}.Row#{row}")
      log text
      text
    end

    def grid_field column, row
      column_str = GRID_COLUMNS[column]
      column_index = column_number(column_str).to_s
      css = "div[id^=ordersGrid]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_index})>div"
      log "#{column_str}, row #{row} CSS: #{css}"
      field = @browser.div :css => css
      log "#{column_str}, row #{row} field.present? #{browser_helper.present? field}"
      begin
        @browser.execute_script('arguments[0].scrollIntoView();', field)
      rescue
        #log "Unable to focus on #{column}, row #{row}"
      end
      begin
        log "Column: #{column}, Row: #{row} = #{browser_helper.text field}"
      rescue
        #ignore
      end
      field
    end

    def column_number name
      if Batch.grid_columns.nil?
        Batch.grid_columns Hash.new
        Batch.grid_column_fields @browser.spans :css => "div[componentid^=gridcolumn]"
        log "Number of Grid Columns is #{Batch.grid_column_fields.size}"
        Batch.grid_column_fields.each_with_index { |field, index|
          begin
            @browser.execute_script('arguments[0].scrollIntoView();', field)
            log "#{name} : Column #{index}"
          rescue
            #log "Unable to focus on #{column}, row #{row}}"
          end
          column_name = browser_helper.text field
          log "#{column_name} is column #{index} on Order Grid."
          Batch.grid_columns[column_name] = (index+1).to_s

        }
        log Batch.grid_columns
      end
      log "#{name} => #{Batch.grid_columns[name]}"
      index = Batch.grid_columns[name]
      log "#{index}, #{index.class}"
      begin
        column_field = Batch.grid_column_fields[index.to_i]
        @browser.execute_script('arguments[0].scrollIntoView();', column_field)
        log "Grid #{name} Column visible? #{browser_helper.present? column_field}"
      rescue
        #log "Failed to scroll column #{index} into view"
      end
      index
    end

    def row_number order_id
      row = 1
      column = column_number(GRID_COLUMNS[:order_id])
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
      8.times{
        break if row_count > 0
        sleep 1
      }

      if row_count == 0
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
      div = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div"
      present = browser_helper.present? div
      raise("Order Grid Row number #{number} is not present")unless browser_helper.present? div
      div
    end

    def edit_order(order_id)
      check_row(row_number order_id)
    end

    def uncheck_row(number)
      div = row_div number
      5.times do
        browser_helper.click div, "Row#{number}"
        break unless row_checked?(number)
      end
      log "Row #{number} checked."
    end

    def check_row(number)
      5.times do
        if row_checked?(number)
          break
        else
          div = row_div number
          browser_helper.click div, "Row#{number}"
        end
      end
      log "Row #{number} checked."
    end

    def select_all_checkbox
      spans = @browser.spans :css => "span[class=x-column-header-text-inner]"
      checkbox_field = spans.first
      check_verify_field = @browser.div :css => "div[class*=x-column-header-checkbox]"
      attribute = "class"
      attrib_value_check = "checker-on"
      Stamps::Browser::Checkbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
    end

    def select_all
      select_all_checkbox.check
    end

    def unselect_all
      select_all_checkbox.uncheck
    end

    def order_checked?(order_number)
      row_checked? row_number order_number
    end

    def row_checked?(row)
      table = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{row})"
      class_attribute = browser_helper.attribute_value table, "class"
      selected = class_attribute.include? "selected"
      log "Row #{row} checked? #{selected}"
      selected
    end

    def check(row_number)
      # is row checked?
    end

    # no?, check it.
  end

  #
  # Orders Grid
  #
  class Grid < GridBase
    public

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
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_cost, row)
    end


    def ship_cost_error order_id
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
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:age, row)
    end

    def order_date order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_date, row)
    end

    def recipient order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:recipient, row)
    end

    def company order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:company, row)
    end

    def address order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:address, row)
    end

    def city order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:city, row)
    end

    def state order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:state, row)
    end

    def zip order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:zip, row)
    end


    def country order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:country, row)
    end

    def phone order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:phone, row)
    end

    def email order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:email, row)
    end

    def qty order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:qty, row)
    end

    def item_sku order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:item_sku, row)
    end

    def item_name order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:description, row)
    end

    def ship_from order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_from, row)
    end

    def service order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:service, row)
    end

    def weight order_id
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
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:reference_no, row)
    end

    def cost_code order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:cost_code, row)
    end

    def order_status order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_status, row)
    end

    def ship_date order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:ship_date, row)
    end

    def tracking order_id
      grid_text :tracking, row_number(order_id)
    end

    def order_total order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      grid_text(:order_total, row)
    end

    def insured_value order_id
      row = row_number(order_id)
      log "Order ID: #{order_id} = Row #{row}"
      test_helper.remove_dollar_sign grid_text(:insured_value, row)
    end

    def row_count
      @browser.tables(:css=>"div[id^=ordersGrid]>div>div>table").size
    end

  end

end