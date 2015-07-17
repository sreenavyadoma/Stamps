module Batch
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
        :service_Input_text => [18, 'Service'],
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
      grid_text(:order_id, row)
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

    def check_row(number)
      field = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div"
      unless browser_helper.field_present?  field
        raise("Order Grid Row number #{number} does not exist.")
      end
      5.times do
        if row_checked?(number)
          break
        else
          browser_helper.click field, "Row#{number}"
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
end
