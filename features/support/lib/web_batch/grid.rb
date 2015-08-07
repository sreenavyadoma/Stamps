module Batch

  class GridBase < BrowserObject
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
        :service_input_text => [18, 'Service'],
        :weight => [19, 'Weight'],
        :insured_value => [20, 'Insured Value'],
        :reference_no => [21, 'Reference No.'],
        :cost_code => [22, 'Cost Code'],
        :order_status => [23, 'Order Status'],
        :ship_date => [24, 'Ship Date'],
        :tracking => [25, 'Tracking #'],
        :order_total => [26, 'Order Total']
    }

    def browser_helper
      BrowserHelper.instance
    end

    def test_helper
      TestHelper.instance
    end

    def grid_text(column, row)
      test_helper.remove_dollar_sign(browser_helper.text grid_field(column, row), "Grid.#{column}.Row#{row}")
    end

    def grid_field(column, row)
      @browser.div(:css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (row.to_s) +")>tbody>tr>td:nth-child("+GRID_COLUMNS[column].first.to_s+")>div")
    end

    def order_id(row)
      begin
        grid_field(:order_id, row).wait_until_present
      rescue
        log "OrderID column on order grid is not present"
      end
      begin
        grid_text(:order_id, row)
      rescue
        return '0000'
      end
    end

    def row_number(order_id)
      elements = @browser.divs :css => "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{GRID_COLUMNS[:order_id].first})>div"
      elements.each_with_index { |div, index|
        if div.text.casecmp order_id
          return index + 1 #row offset
        end
      }
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

    def row_div number
      raise "row_div:  number can't be nil" if number.nil?
      div = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div"
      present = browser_helper.present? div
      raise("Order Grid Row number #{number} is not present")unless browser_helper.present? div
      div
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

    def order_checked?(order_number)
      row_checked? row_number order_number
    end

    def row_checked?(row)
      table = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{row})"
      class_attribute = browser_helper.attribute_value table, "class"
      selected = class_attribute.include? "selected"
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
    def checked_orders
      checked_orders_set = Set.new
      grid_order_count = total_grid_count
      row_count = (grid_order_count>20)?20:grid_order_count
      1.upto(row_count) { |row|
        checked = row_checked? row
        if checked
          row_entry = row_div row
          checked_orders_set.add row_entry
        end
      }
      checked_orders_set
    end

    def check_orders orders_set
      begin
        orders_set.each do |row|
          present = browser_helper.present? row
          browser_helper.click row if present
        end
      end unless orders_set.nil?
    end

    def total_grid_count
      tables = @browser.tables :css => "div[id^=ordersGrid]>div>div>table"
      count = tables.length
      log "Total Number of Orders on Grid:  #{count}"
      count.to_i
    end

    def ship_cost(order_id)
      grid_text(:ship_cost, row_number(order_id))
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
      grid_text(:service_input_text, row_number(order_id))
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
      test_helper.remove_dollar_sign grid_text(:insured_value, row_number(order_id))
    end

    def list_all_fields(order_id)
      GRID_COLUMNS.keys.each {|key| send(key, row_number(order_id))}
    end

  end

end