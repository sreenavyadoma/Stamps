module Orders

  module Grid
    class Column < OrdersObject
      MONTH_ARRAY = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
      TIME_UNITS_ARRAY = ['minute','minutes','hour','hours','day','days']
      GRID_COLUMNS ||= {
          :check_box => " ",
          :store => "Store",
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

      def grid_text_by_id column, order_id
        scroll column
        row = row_number(order_id)
        log.info "Retrieving data for Column #{GRID_COLUMNS[column]} with Order ID #{order_id}...."
        data = grid_text column, row
        log.info "Column:  #{GRID_COLUMNS[column]}, Order ID #{order_id}, Row #{row}, Data #{data}"
        data
      end

      def row_count
        tables = @browser.tables :css => "div[id^=ordersGrid]>div>div>table"
        count = tables.size
        #log.info "Total Number of Orders on Grid:  #{count}"
        count.to_i
      end

      def scroll column
        field = StampsLabel.new column_name_field(column)
        field.scroll_into_view
        field
      end

      def column_name_field column
        @browser.span :text => GRID_COLUMNS[column]
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
        scroll column
        browser_helper.text grid_field(column, row), "Grid.#{column}.Row#{row}"
      end

      def grid_field column_number, row
        css = "div[id^=ordersGrid]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_number(column_number).to_s})>div"
        @browser.div :css => css
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
              #log.info "Grid:  #{column_str} is in column #{index+1}"
              return index+1
            end
          }
        rescue Exception => e
          log.info e
        end
      end

      def column_fields
        @column_fields = @browser.spans :css => "div[componentid^=gridcolumn]"
      end

      def row_number order_id
        row = 0
        column = column_number(:order_id)
        css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column})>div"
        #log.info "Order ID: #{order_id} CSS: #{css}"
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
        stop_test "row_div:  number can't be nil" if number.nil?
        div = @browser.div :css => "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div[class=x-grid-row-checker]"
        stop_test("Orders Grid Row number #{number} is not present")unless browser_helper.present? div
        div
      end
    end

    class ColumnMenu < Column

      class Columns < Column
        def initialize browser, column
          super browser
          @column = column
        end

        class ReferenceNoCheckbox < Column
          def initialize browser, column
            super browser
            @column = column
          end
          def check
            scroll @column
            column_field = column_name_field @column
            drop_down = StampsButton.new column_field.parent.parent.parent.parent.divs[3]
            menu_selection = StampsLabel.new @browser.span(text: "Columns")

            name_field = @browser.spans(text: "Reference No.").last
            checkbox_field = name_field.parent.div
            check_verify_field = name_field.parent.parent
            checkbox = StampsCheckbox.new checkbox_field, check_verify_field, "class", "checked"

            20.times do
              drop_down.safe_click unless menu_selection.present?
              menu_selection.safe_click
              menu_selection.hover
              checkbox.check if checkbox.present?
            end
          end

          def uncheck
            checkbox :cost_code

          end
        end

        def reference_no
          ReferenceNoCheckbox.new @browser, @column
        end

        def cost_code
        end
      end

      def initialize browser, column
        super browser
        @column = column
      end

      def columns
        Columns.new @browser, @column
      end

      def sort_order sort_order
        scroll @column
        column_field = column_name_field @column
        sort_verify_field = StampsLabel.new column_field.parent.parent.parent.parent.parent
        sort_drop_down = StampsButton.new column_field.parent.parent.parent.parent.divs[3]

        sort_field_id = (sort_order==:sort_ascending)?"Sort Ascending":"Sort Descending"
        verify_sort = (sort_order==:sort_ascending)?"ASC":"DESC"
        sort_field = StampsLabel.new @browser.span :text => sort_field_id

        15.times{
          sort_drop_down.scroll_into_view
          sort_drop_down.safe_click unless sort_field.present?
          sort_field.safe_click
          sleep 1
          return true if sort_verify_field.attribute_value("class").include? verify_sort
          sleep 1
          return true if sort_verify_field.attribute_value("class").include? verify_sort
        }
        false
      end

      def sort_ascending
        sort_order :sort_ascending
      end

      def sort_descending
        sort_order :sort_descending
      end

    end

    class OrderId < Column

      def exist? order_id
        row_number(order_id) > 0
      end

      def menu
        ColumnMenu.new @browser, :order_id
      end

      def scroll_into_view
        scroll :order_id
      end

      def row_num order_id
        row_number order_id
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
          grid_text :order_id, row
        rescue
          return ""
        end
      end

    end

    class Store < Column

      def menu
        ColumnMenu.new @browser, :store
      end

      def scroll_into_view
        scroll :store
      end

      def row row
        grid_text :store, row
      end

      def data order_id
        grid_text_by_id :store, order_id
      end
    end

    class Age < Column

      def menu
        ColumnMenu.new @browser, :age
      end

      def scroll_into_view
        scroll :age
      end

      def row row
        grid_text :age, row
      end

      def data order_id
        grid_text_by_id :age, order_id
      end
    end

    class OrderDate < Column

      def menu
        ColumnMenu.new @browser, :order_date
      end

      def scroll_into_view
        scroll :order_date
      end

      def row row
        grid_text :order_date, row
      end

      def data order_id
        grid_text_by_id :order_date, order_id
      end
    end

    class Recipient < Column

      def menu
        ColumnMenu.new @browser, :recipient
      end

      def scroll_into_view
        scroll :recipient
      end

      def data order_id
        grid_text_by_id :recipient, order_id
      end

      def row row
        grid_text :recipient, row
      end

    end

    class Company < Column

      def menu
        ColumnMenu.new @browser, :company
      end

      def scroll_into_view
        scroll :company
      end

      def row row
        grid_text :company, row
      end

      def data order_id
        grid_text_by_id :company, order_id
      end
    end

    class Address < Column

      def menu
        ColumnMenu.new @browser, :address
      end

      def scroll_into_view
        scroll :address
      end

      def row row
        grid_text :address, row
      end

      def data order_id
        grid_text_by_id :address, order_id
      end
    end

    class City < Column

      def menu
        ColumnMenu.new @browser, :city
      end

      def scroll_into_view
        scroll :city
      end

      def row row
        grid_text :city, row
      end

      def data order_id
        grid_text_by_id :city, order_id
      end
    end

    class State < Column

      def menu
        ColumnMenu.new @browser, :state
      end

      def scroll_into_view
        scroll :state
      end

      def row row
        grid_text :state, row
      end

      def data order_id
        grid_text_by_id :state, order_id
      end
    end

    class Zip < Column

      def menu
        ColumnMenu.new @browser, :zip
      end

      def scroll_into_view
        scroll :zip
      end

      def row row
        grid_text :zip, row
      end

      def data order_id
        grid_text_by_id :zip, order_id
      end
    end

    class Phone < Column

      def menu
        ColumnMenu.new @browser, :phone
      end

      def scroll_into_view
        scroll :phone
      end

      def row row
        grid_text :phone, row
      end

      def data order_id
        grid_text_by_id :phone, order_id
      end
    end

    class Email < Column

      def menu
        ColumnMenu.new @browser, :email
      end

      def scroll_into_view
        scroll :email
      end

      def row row
        grid_text :email, row
      end

      def data order_id
        grid_text_by_id :email, order_id
      end
    end

    class Qty < Column

      def menu
        ColumnMenu.new @browser, :qty
      end

      def scroll_into_view
        scroll :qty
      end

      def row row
        grid_text :qty, row
      end

      def data order_id
        grid_text_by_id :qty, order_id
      end
    end

    class ItemSKU < Column

      def menu
        ColumnMenu.new @browser, :item_sku
      end

      def scroll_into_view
        scroll :item_sku
      end

      def row row
        grid_text :item_sku, row
      end

      def data order_id
        grid_text_by_id :item_sku, order_id
      end
    end

    class ItemName < Column

      def menu
        ColumnMenu.new @browser, :item_name
      end

      def scroll_into_view
        scroll :item_name
      end

      def row row
        grid_text :item_name, row
      end

      def data order_id
        grid_text_by_id :item_name, order_id
      end
    end

    class Weight < Column

      def menu
        ColumnMenu.new @browser, :weight
      end

      def scroll_into_view
        scroll :weight
      end

      def row row
        grid_text :weight, row
      end

      def data order_id
        grid_text_by_id :weight, order_id
      end

      def lbs order_id
        data(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
      end

      def oz order_id
        data(order_id).scan(/\d+ oz./).first.scan(/\d/).first
      end
    end

    class InsuredValue < Column

      def menu
        ColumnMenu.new @browser, :insured_value
      end

      def scroll_into_view
        scroll :insured_value
      end

      def row row
        grid_text :insured_value, row
      end

      def data order_id
        test_helper.remove_dollar_sign grid_text_by_id(:insured_value, order_id)
      end
    end

    class OrderStatus < Column

      def menu
        ColumnMenu.new @browser, :order_status
      end

      def scroll_into_view
        scroll :order_status
      end

      def row row
        grid_text :order_status, row
      end

      def data order_id
        grid_text_by_id :order_status, order_id
      end
    end

    class ShipDate < Column

      def menu
        ColumnMenu.new @browser, :ship_date
      end

      def scroll_into_view
        scroll :ship_date
      end

      def row row
        grid_text :ship_date, row
      end

      def data order_id
        grid_text_by_id :ship_date, order_id
      end
    end

    class ShipFrom < Column

      def menu
        ColumnMenu.new @browser, :ship_from
      end

      def scroll_into_view
        scroll :ship_from
      end

      def row row
        grid_text :ship_from, row
      end

      def data order_id
        grid_text_by_id :ship_from, order_id
      end
    end

    class OrderTotal < Column

      def menu
        ColumnMenu.new @browser, :order_total
      end

      def scroll_into_view
        scroll :order_total
      end

      def row row
        grid_text :order_total, row
      end

      def data order_id
        grid_text_by_id :order_total, order_id
      end
    end

    class Country < Column

      def menu
        ColumnMenu.new @browser, :country
      end

      def scroll_into_view
        scroll :country
      end

      def row row
        grid_text :country, row
      end

      def data order_id
        grid_text_by_id :country, order_id
      end
    end

    class ShipCost < Column

      def menu
        ColumnMenu.new @browser, :ship_cost
      end

      def scroll_into_view
        scroll :ship_cost
      end

      def row row
        grid_text :ship_cost, row
      end

      def data order_id
        cost = grid_text_by_id :ship_cost, order_id
        (cost.include? "$")?test_helper.remove_dollar_sign(cost):cost
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

      def menu
        ColumnMenu.new @browser, :company
      end

      def scroll_into_view
        scroll :company
      end

      def row row
        grid_text :company, row
      end

      def data order_id
        grid_text_by_id :company, order_id
      end
    end

    class Service < Column

      def menu
        ColumnMenu.new @browser, :service
      end

      def scroll_into_view
        scroll :service
      end

      def row row
        grid_text :service, row
      end

      def data order_id
        grid_text_by_id :service, order_id
      end
    end

    class ReferenceNo < Column

      def menu
        ColumnMenu.new @browser, :reference_no
      end

      def scroll_into_view
        scroll :reference_no
      end

      def row row
        grid_text :reference_no, row
      end

      def data order_id
        grid_text_by_id :reference_no, order_id
      end
    end

    class CostCode < Column

      def menu
        ColumnMenu.new @browser, :cost_code
      end

      def scroll_into_view
        scroll :cost_code
      end

      def row row
        grid_text :cost_code, row
      end

      def data order_id
        grid_text_by_id :cost_code, order_id
      end
    end

    class Tracking < Column

      def menu
        ColumnMenu.new @browser, :tracking_no
      end

      def scroll_into_view
        scroll :tracking_no
      end

      def row row
        grid_text :tracking_no, row
      end

      def data order_id
        grid_text_by_id :tracking_no, order_id
      end
    end

    class DatePrinted < Column

      def menu
        ColumnMenu.new @browser, :date_printed
      end

      def scroll_into_view
        scroll :date_printed
      end

      def data_at_row row
        grid_field_column_name :date_printed, row
      end

      def data order_id
        grid_text_by_id :date_printed, order_id
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
        Stamps::Browser::StampsCheckbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
      end

      public

      def scroll_into_view
        field = StampsLabel.new((@browser.spans :css => "div[componentid^=gridcolumn]").first)
        field.scroll_into_view
        field
      end

      def row row
        grid_text :check_box, row
      end

      def edit order_id
        check row_number order_id
      end

      def edit_order_id order_id
        edit order_id
      end

      def check_order_id order_id
        check row_number(order_id)
      end

      def uncheck_order_id order_id
        uncheck row_number(order_id)
      end

      def check number
        scroll_into_view
        if size > 0
          checkbox_field = row_div number
          verify_field = @browser.table :css => "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
          checkbox = StampsCheckbox.new checkbox_field, verify_field, "class", "grid-item-selected"
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
          checkbox = StampsCheckbox.new checkbox_field, verify_field, "class", "grid-item-selected"
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
        checkbox = StampsCheckbox.new checkbox_field, verify_field, "class", "grid-item-selected"
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
            stop_test "Invalid parameter exception.  This method expects a Hash of Web Elements."
          end

          rows.each do |hash_element|
            row_number = hash_element[0]
            checked = hash_element[1]
            if checked
              check row_number
              log.info "Row #{row_number} #{checked? row_number}"
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
        cache_count = 5
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

    class GridColumns < Column
      def is_next_to? left, right
        left_column_sym = GRID_COLUMNS.key left
        right_column_sym = GRID_COLUMNS.key right
        raise "#{left_column_sym} is not a valid grid column!  Valid columns are: \n #{GRID_COLUMNS.values}" if left_column_sym.nil?
        raise "#{right_column_sym} is not a valid grid column!  Valid columns are: \n #{GRID_COLUMNS.values}" if right_column_sym.nil?

        left_column_num = column_number left_column_sym
        right_column_num = column_number right_column_sym
        left_column_num + 1 == right_column_num
      end
    end

    # Orders Grid
    class OrdersGrid < OrdersObject

      def column
        GridColumns.new @browser
      end

      def wait_until_present
        browser_helper.wait_until_present @browser.div Orders::Locators::OrdersGrid::present
      end

      def present?
        browser_helper.present? @browser.div Orders::Locators::OrdersGrid::present
      end

      def checkbox
        Grid::CheckBox.new @browser
      end

      def store
        Grid::Store.new @browser
      end

      def order_id
        Grid::OrderId.new @browser
      end

      def ship_cost
        Grid::ShipCost.new @browser
      end

      def age
        Grid::Age.new @browser
      end

      def order_date
        Grid::OrderDate.new @browser
      end

      def recipient
        Grid::Recipient.new @browser
      end

      def company
        Grid::Company.new @browser
      end

      def address
        Grid::Address.new @browser
      end

      def city
       Grid::City.new @browser
      end

      def state
        Grid::State.new @browser
      end

      def zip
        Grid::Zip.new @browser
      end

      def country
        Grid::Country.new @browser
      end

      def phone
        Grid::Phone.new @browser
      end

      def email
        Grid::Email.new @browser
      end

      def qty
        Grid::Qty.new @browser
      end

      def item_sku
       Grid::ItemSKU.new @browser
      end

      def item_name
        Grid::ItemName.new @browser
      end

      def ship_from
        Grid::ShipFrom.new @browser
      end

      def service
        Grid::Service.new @browser
      end

      def weight
        Grid::Weight.new @browser
      end

      def insured_value
        Grid::InsuredValue.new @browser
      end

      def reference_no
        Grid::ReferenceNo.new @browser
      end

      def cost_code
        Grid::CostCode.new @browser
      end

      def order_status
        Grid::OrderStatus.new @browser
      end

      def date_printed
        Grid::DatePrinted.new @browser
      end

      def ship_date
        Grid::ShipDate.new @browser
      end

      def tracking_no
        Grid::Tracking.new @browser
      end

      def order_total
        Grid::OrderTotal.new @browser
      end

      def toolbar
        Orders::Toolbar::Toolbar.new @browser
      end

      def wait_until_present *args
        grid_present_span = StampsLabel.new (@browser.div :css => "div[id=appContent]>div>div>div[id^=ordersGrid]")
        grid_present_span.wait_until_present
      end

    end
  end

end