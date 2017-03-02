module Stamps
  module Orders
    module Grid
      class Column < Browser::StampsHtmlField
        MONTH_ARRAY = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
        TIME_UNITS_ARRAY = ['minute','minutes','hour','hours','day','days']
        GRID_COLUMNS = {
            check_box: " ",
            store: "Store",
            ship_cost: "Ship Cost",
            age: "Age",
            order_id: "Order ID",
            order_date: "Order Date",
            recipient: "Recipient",
            company: "Company",
            address: "Address",
            city: "City",
            state: "State",
            zip: "Zip",
            country: "Country",
            phone: "Phone",
            email: "Email",
            qty: "Qty.",
            item_sku: "Item SKU",
            item_name: "Item Name",
            ship_from: "Ship From",
            service: "Service",
            requested_service: "Requested Service",
            weight: "Weight",
            insured_value: "Insured Value",
            tracking_service: "Tracking Service",
            reference_no: "Reference No.",
            cost_code: "Cost Code",
            order_status: "Order Status",
            date_printed: "Date Printed",
            ship_date: "Ship Date",
            tracking_no: "Tracking #",
            order_total: "Order Total",
            source: "Source"
        }

        def sort_order(column, sort_order)
          scroll_to_column(column)

          span = browser.span(text: GRID_COLUMNS[column])
          column = StampsElement.new(span)
          sort_order = (sort_order==:sort_ascending)?"ASC":"DESC"

          10.times do
            column.scroll_into_view
            column.safe_click
            5.times do
              sleep(1)
              return sort_order if span.parent.parent.parent.parent.parent.attribute_value("class").include?(sort_order)
            end
          end
          sort_order
        end

        def grid_text_by_id(column, order_id)
          scroll_to_column(column)
          grid_text(column, row_number(order_id))
        end

        def row_count
          browser.tables(css: "div[id^=ordersGrid]>div>div>table").size.to_i
        end

        def scroll_to_column(name)
          expect(name).to be_truthy
          case name
            when Symbol
              element_helper.scroll_into_view(browser, browser.span(text: GRID_COLUMNS[name]))
            when String
              element_helper.scroll_into_view(browser, browser.span(text: name))
            when Watir::Element
              element_helper.scroll_into_view(browser, name)
            else
              expect(name).to be_a(String).or(eq(Symbol)).or(eq(Watir::Element))
          end
        end

        def empty?
          size == 0
        end

        def size
          30.times {break if browser.tables(:css=>"div[id^=ordersGrid]>div>div>table").size > 0}
          browser.tables(:css=>"div[id^=ordersGrid]>div>div>table").size
        end

        def parameter_helper
          ParameterHelper
        end

        def grid_text(column, row)
          scroll_to_column(column)
          element_helper.text(grid_element(column, row))
        end

        def grid_element(column_number, row)
          browser.div(css: "div[id^=ordersGrid]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_number(column_number).to_s})>div")
        end

        def grid_field_column_name(column_name, row)
          grid_text(column_number(column_name), row)
        end

        def column_number(column)
          5.times do
            begin
              columns = browser.spans(css: "div[id^=gridcolumn-][id$=-textEl]>span")
              columns.each_with_index do |element, index|
                scroll_to_column element
                if element_helper.text(element) == GRID_COLUMNS[column]
                  #logger.message "In Orders Grid, -- #{GRID_COLUMNS[column]} is in column #{index+1}"
                  return index+1
                end
              end
            rescue => e
              expect(e.backtrace.join("\n")).to eql "#{e.message}"
              expect(e.message).to eql "Grid error. Unable to find column number for #{column}"
            end
          end
          #"Column Name: #{column_name}").to eql "Unable to get column number for #{column_name}"
        end

        def row_number(order_id)
          5.times do
            column_num = column_number(:order_id)
            fields = browser.divs(css: "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column_num})>div")
            fields.each_with_index do |element, index|
              scroll_to_column element
              row_text = element_helper.text element
              if row_text.include? order_id
                logger.info "Order ID #{order_id}, Row #{index+1}"
                sleep(0.35)
                return index + 1
              end
            end
          end
          #"Unable to obtain row number for Order ID #{order_id}").to eql "" if row == 0
        end

        def row_div(number)
          expect(number).to be_truthy
          browser.div(css: "div[id^=ordersGrid]>div>div>table:nth-child("+(number.to_s)+")>tbody>tr>td>div>div[class=x-grid-row-checker]")
        end
      end

      class OrderId < Column
        def exist? order_id
          row_number(order_id) > 0
        end

        def scroll_into_view
          scroll_to_column(:order_id)
        end

        def sort_ascending
          sort_order(:order_id, :sort_ascending)
        end

        def sort_descending
          sort_order(:order_id, :sort_descending)
        end

        def row_num(order_id)
          row_number(order_id)
        end

        def row(row)
          scroll_into_view
          8.times{
            break if size > 0
            sleep(0.35)
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

      class Store < Column
        def scroll_into_view
          scroll_to_column(:store)
        end

        def row(row)
          grid_text(:store, row)
        end

        def data(order_id)
          grid_text_by_id(:store, order_id)
        end

        def sort_ascending
          sort_order(:store, :sort_ascending)
        end

        def sort_descending
          sort_order(:store, :sort_descending)
        end
      end

      class Age < Column

        def scroll_into_view
          scroll_to_column(:age)
        end

        def sort_ascending
          sort_order(:age, :sort_ascending)
        end

        def sort_descending
          sort_order(:age, :sort_descending)
        end

        def row(row)
          grid_text(:age, row)
        end

        def data(order_id)
          grid_text_by_id(:age, order_id)
        end
      end

      class OrderDate < Column
        def scroll_into_view
          scroll_to_column(:order_date)
        end

        def sort_ascending
          sort_order(:order_date, :sort_ascending)
        end

        def sort_descending
          sort_order(:order_date, :sort_descending)
        end

        def row(row)
          grid_text(:order_date, row)
        end

        def data(order_id)
          grid_text_by_id(:order_date, order_id)
        end
      end

      class Recipient < Column
        def scroll_into_view
          scroll_to_column(:recipient)
        end

        def sort_ascending
          sort_order(:recipient, :sort_ascending)
        end

        def sort_descending
          sort_order(:recipient, :sort_descending)
        end

        def data(order_id)
          scroll_into_view
          sleep(0.35)
          grid_text_by_id(:recipient, order_id)
        end

        def row(row)
          grid_text(:recipient, row)
        end

      end

      class Company < Column
        def scroll_into_view
          scroll_to_column(:company)
        end

        def sort_ascending
          sort_order(:company, :sort_ascending)
        end

        def sort_descending
          sort_order(:company, :sort_descending)
        end

        def row(row)
          grid_text(:company, row)
        end

        def data(order_id)
          grid_text_by_id(:company, order_id)
        end
      end

      class Address < Column
        def scroll_into_view
          scroll_to_column(:address)
        end

        def sort_ascending
          sort_order(:address, :sort_ascending)
        end

        def sort_descending
          sort_order(:address, :sort_descending)
        end

        def row(row)
          grid_text(:address, row)
        end

        def data(order_id)
          grid_text_by_id(:address, order_id)
        end
      end

      class City < Column
        def scroll_into_view
          scroll_to_column(:city)
        end

        def sort_ascending
          sort_order(:city, :sort_ascending)
        end

        def sort_descending
          sort_order(:city, :sort_descending)
        end

        def row(row)
          grid_text(:city, row)
        end

        def data(order_id)
          grid_text_by_id(:city, order_id)
        end
      end

      class State < Column
        def scroll_into_view
          scroll_to_column(:state)
        end

        def sort_ascending
          sort_order(:state, :sort_ascending)
        end

        def sort_descending
          sort_order(:state, :sort_descending)
        end

        def row(row)
          grid_text(:state, row)
        end

        def data(order_id)
          grid_text_by_id :state, order_id
        end
      end

      class Zip < Column
        def scroll_into_view
          scroll_to_column(:zip)
        end

        def sort_ascending
          sort_order(:zip, :sort_ascending)
        end

        def sort_descending
          sort_order(:zip, :sort_descending)
        end

        def row(row)
          grid_text :zip, row
        end

        def data(order_id)
          grid_text_by_id :zip, order_id
        end
      end

      class Phone < Column
        def scroll_into_view
          scroll_to_column(:phone)
        end

        def sort_ascending
          sort_order(:phone, :sort_ascending)
        end

        def sort_descending
          sort_order(:phone, :sort_descending)
        end

        def row(row)
          grid_text :phone, row
        end

        def data(order_id)
          grid_text_by_id(:phone, order_id)
        end
      end

      class Email < Column
        def scroll_into_view
          scroll_to_column(:email)
        end

        def sort_ascending
          sort_order(:email, :sort_ascending)
        end

        def sort_descending
          sort_order(:email, :sort_descending)
        end

        def row(row)
          grid_text(:email, row)
        end

        def data(order_id)
          grid_text_by_id :email, order_id
        end
      end

      class Qty < Column
        def scroll_into_view
          scroll_to_column(:qty)
        end

        def sort_ascending
          sort_order(:qty, :sort_ascending)
        end

        def sort_descending
          sort_order(:qty, :sort_descending)
        end

        def row(row)
          grid_text(:qty, row)
        end

        def data(order_id)
          grid_text_by_id(:qty, order_id).to_i
        end
      end

      class ItemSKU < Column
        def scroll_into_view
          scroll_to_column(:item_sku)
        end

        def sort_ascending
          sort_order(:item_sku, :sort_ascending)
        end

        def sort_descending
          sort_order(:item_sku, :sort_descending)
        end

        def row(row)
          grid_text(:item_sku, row)
        end

        def data(order_id)
          grid_text_by_id(:item_sku, order_id)
        end
      end

      class ItemName < Column
        def scroll_into_view
          scroll_to_column(:item_name)
        end

        def sort_ascending
          sort_order(:item_name, :sort_ascending)
        end

        def sort_descending
          sort_order(:item_name, :sort_descending)
        end

        def row(row)
          grid_text(:item_name, row)
        end

        def data(order_id)
          grid_text_by_id(:item_name, order_id)
        end
      end

      class Weight < Column
        def scroll_into_view
          scroll_to_column(:weight)
        end

        def sort_ascending
          sort_order(:weight, :sort_ascending)
        end

        def sort_descending
          sort_order(:weight, :sort_descending)
        end

        def row(row)
          grid_text(:weight, row)
        end

        def data(order_id)
          grid_text_by_id(:weight, order_id)
        end

        def lb order_id
          data(order_id).scan(/\d+ lb./).first.scan(/\d/).first.to_i
        end

        def oz order_id
          data(order_id).scan(/\d+ oz./).first.scan(/\d/).first.to_i
        end
      end

      class InsuredValue < Column
        def scroll_into_view
          scroll_to_column(:insured_value)
        end

        def sort_ascending
          sort_order(:insured_value, :sort_ascending)
        end

        def sort_descending
          sort_order(:insured_value, :sort_descending)
        end

        def row(row)
          grid_text(:insured_value, row)
        end

        def data(order_id)
          ParameterHelper.remove_dollar_sign(grid_text_by_id(:insured_value, order_id)).to_f.round(2)
        end
      end

      class OrderStatus < Column
        def scroll_into_view
          scroll_to_column(:order_status)
        end

        def sort_ascending
          sort_order(:order_status, :sort_ascending)
        end

        def sort_descending
          sort_order(:order_status, :sort_descending)
        end

        def row(row)
          grid_text(:order_status, row)
        end

        def data(order_id)
          grid_text_by_id(:order_status, order_id)
        end
      end

      class ShipDate < Column
        def scroll_into_view
          scroll_to_column(:ship_date)
        end

        def sort_ascending
          sort_order(:ship_date, :sort_ascending)
        end

        def sort_descending
          sort_order(:ship_date, :sort_descending)
        end

        def row(row)
          grid_text(:ship_date, row)
        end

        def data(order_id)
          grid_text_by_id(:ship_date, order_id)
        end
      end

      class ShipFrom < Column
        def scroll_into_view
          scroll_to_column(:ship_from)
        end

        def row(row)
          grid_text(:ship_from, row)
        end

        def data(order_id)
          grid_text_by_id(:ship_from, order_id)
        end
      end

      class Country < Column
        def scroll_into_view
          scroll_to_column(:country)
        end

        def sort_ascending
          sort_order(:country, :sort_ascending)
        end

        def sort_descending
          sort_order(:country, :sort_descending)
        end

        def row(row)
          grid_text(:country, row)
        end

        def data(order_id)
          grid_text_by_id(:country, order_id)
        end
      end

      class ShipCost < Column
        def scroll_into_view
          scroll_to_column(:ship_cost)
        end

        def row(row)
          grid_text(:ship_cost, row)
        end

        def data(order_id)
          cost = grid_text_by_id(:ship_cost, order_id)
          (cost.include? "$")?ParameterHelper.remove_dollar_sign(cost).to_f.round(2):cost
        end

        def ship_cost_error(order_id)
          scroll_into_view
          begin
            div = grid_element(:ship_cost, row_number(order_id)).div
            data_error = div.attribute_value("data-qtip")
          rescue
            data_error = ""
          end

          logger.info "#{order_id} data-qtip error:  #{(data_error.length==0)?"None":data_error}"
          data_error
        end

      end

      class Company < Column
        def scroll_into_view
          scroll_to_column(:company)
        end

        def row(row)
          grid_text(:company, row)
        end

        def data(order_id)
          grid_text_by_id(:company, order_id)
        end
      end

      class GridService < Column
        def scroll_into_view
          scroll_to_column(:service)
        end

        def sort_ascending
          sort_order(:service, :sort_ascending)
        end

        def sort_descending
          sort_order(:service, :sort_descending)
        end

        def row(row)
          grid_text(:service, row)
        end

        def data(order_id)
          grid_text_by_id(:service, order_id)
        end
      end

      class RequestedService < Column
        def scroll_into_view
          scroll_to_column(:requested_service)
        end

        def row(row)
          grid_text(:requested_service, row)
        end

        def data(order_id)
          grid_text_by_id(:requested_service, order_id)
        end
      end

      class ReferenceNo < Column
        def scroll_into_view
          scroll_to_column(:reference_no)
        end

        def row(row)
          grid_text(:reference_no, row)
        end

        def data(order_id)
          grid_text_by_id(:reference_no, order_id)
        end
      end

      class CostCode < Column
        def scroll_into_view
          scroll_to_column(:cost_code)
        end

        def row(row)
          grid_text(:cost_code, row)
        end

        def data(order_id)
          grid_text_by_id(:cost_code, order_id)
        end
      end

      class Tracking < Column
        def scroll_into_view
          scroll_to_column(:tracking_no)
        end

        def row(row)
          grid_text(:tracking_no, row)
        end

        def data(order_id)
          grid_text_by_id(:tracking_no, order_id)
        end
      end

      class DatePrinted < Column
        def scroll_into_view
          scroll_to_column(:date_printed)
        end

        def sort_ascending
          sort_order(:date_printed, :sort_ascending)
        end

        def sort_descending
          sort_order(:date_printed, :sort_descending)
        end

        def data_at_row(row)
          grid_field_column_name(:date_printed, row)
        end

        def data(order_id)
          grid_text_by_id(:date_printed, order_id)
        end
      end

      class GridCheckBox < Column

        def scroll_into_view
          field = StampsElement.new((browser.spans css: "div[componentid^=gridcolumn]").first)
          field.scroll_into_view
          field
        end

        def checkbox_header
          scroll_into_view

          checkbox_field = (browser.spans css: "div[componentid^=gridcolumn]").first
          check_verify_field = browser.div css: "div[class*=x-column-header-checkbox]"
          attribute = "class"
          attrib_value_check = "checker-on"
          Stamps::Browser::StampsCheckbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
        end

        def check_all *args
          scroll_into_view
          if args.length==1
            if args[0].is_a? Hash
              rows = args[0]
              logger.info "Restoring #{} checked orders..."
            else
              expect("Invalid parameter exception.  This method expects a Hash of Web Elements.").to eql ""
            end
            rows.each do |hash_element|
              row_number = hash_element[0]
              checked = hash_element[1]
              if checked
                check(row_number)
                logger.info "Row #{row_number} #{checked?(row_number)}"
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

        def row(row)
          grid_text(:check_box, row)
        end

        def edit(order_id)
          check row_number(order_id)
        end

        def edit_order(order_id)
          edit(order_id)
        end

        def check_order_id(order_id)
          check row_number(order_id)
        end

        def uncheck_order_id(order_id)
          uncheck row_number(order_id)
        end

        def checkbox_element(number)
          div = row_div(number)
          verify_field = div.parent.parent.parent.parent.parent #browser.table(css: "div[id^=ordersGrid]>div>div>table:nth-child(#{number})")
          StampsCheckbox.new(div, verify_field, "class", "selected")
        end

        def check(number)
          scroll_into_view
          if size > 0
            checkbox_element(number).check
            expect(checked?(number)).to be(true)
          else
            expect("Unable to check order number #{number}").to eql "Grid is empty"
          end
        end

        def uncheck(number)
          scroll_into_view
          if size > 0
            checkbox_element(number).uncheck
            expect(checked?(number)).to be(false)
          end
        end

        def checked?(number)
          scroll_into_view
          checkbox_element(number).checked?
        end

        def order_id_checked?(order_number)
          scroll_into_view
          checked? row_number(order_number)
        end

        def checked_rows(*args)
          cache_count = 5
          if args.length == 1
            cache_count = args[0]
          end

          logger.info "Caching checked rows..."
          checked_rows = Hash.new
          grid_total = row_count
          if cache_count > 2 && cache_count < grid_total
            cache_item_count = cache_count
          elsif cache_count > grid_total
            cache_item_count = grid_total
          else
            cache_item_count = cache_count
          end
          logger.info "Number of rows to check:  #{cache_item_count}"
          1.upto(cache_item_count) { |row|
            checked = checked?(row)
            if checked
              checked_rows[row] = checked
            end
            logger.info "Row #{row} Checked? #{checked}.  Stored:  #{checked_rows[row]}"
          }
          logger.info "Checked rows cached."
          checked_rows
        end

      end

      class TrackingService < Column
        def scroll_into_view
          scroll_to_column(:tracking_service)
        end

        def sort_ascending
          sort_order(:tracking_service, :sort_ascending)
        end

        def sort_descending
          sort_order(:tracking_service, :sort_descending)
        end

        def row(row)
          grid_text(:tracking_service, row)
        end

        def data(order_id)
          grid_text_by_id(:tracking_service, order_id)
        end
      end

      class OrderTotal < Column
        def scroll_into_view
          scroll_to_column(:order_total)
        end

        def sort_ascending
          sort_order(:order_total, :sort_ascending)
        end

        def sort_descending
          sort_order(:order_total, :sort_descending)
        end

        def row(row)
          grid_text(:order_total, row)
        end

        def data(order_id)
          grid_text_by_id(:order_total, order_id)
        end
      end

      class GridSource < Column
        def scroll_into_view
          scroll_to_column(:source)
        end

        def sort_ascending
          sort_order(:source, :sort_ascending)
        end

        def sort_descending
          sort_order(:source, :sort_descending)
        end

        def row(row)
          grid_text(:source, row)
        end

        def data(order_id)
          grid_text_by_id(:source, order_id)
        end
      end

      class GridColumns < Browser::StampsHtmlField
        attr_reader :checkbox, :store, :order_id, :ship_cost, :order_date, :age, :recipient, :company,
                    :address, :city, :state, :zip, :country, :phone, :email, :qty, :item_sku, :item_name,
                    :service, :weight, :insured_value, :reference_no, :cost_code, :order_status, :date_printed,
                    :tracking_service, :ship_date, :tracking_no, :requested_service, :source, :ship_from, :order_total

        def initialize(param)
          @checkbox = GridCheckBox.new(param)
          @store = Store.new(param)
          @order_id = OrderId.new(param)
          @ship_cost = ShipCost.new(param)
          @age = Age.new(param)
          @order_date = OrderDate.new(param)
          @recipient = Recipient.new(param)
          @company = Company.new(param)
          @country = Country.new(param)
          @address = Address.new(param)
          @city = City.new(param)
          @state = State.new(param)
          @zip = Zip.new(param)
          @phone = Phone.new(param)
          @email = Email.new(param)
          @qty = Qty.new(param)
          @item_sku = ItemSKU.new(param)
          @item_name = ItemName.new(param)
          @ship_from = ShipFrom.new(param)
          @service = GridService.new(param)
          @requested_service = RequestedService.new(param)
          @weight = Weight.new(param)
          @insured_value = InsuredValue.new(param)
          @tracking_service = TrackingService.new(param)
          @order_status = OrderStatus.new(param)
          @date_printed = DatePrinted.new(param)
          @ship_date = ShipDate.new(param)
          @tracking_no = Tracking.new(param)
          @order_total = OrderTotal.new(param)
          @source = GridSource.new(param)
          # todo-rob These two are no longer a column in orders grid
          @reference_no = ReferenceNo.new(param)
          @cost_code = CostCode.new(param)
        end

        def is_next_to?(left, right)
          left_column_sym = GRID_COLUMNS.key left
          right_column_sym = GRID_COLUMNS.key right

          expect(left_column_sym).to be_truthy
          expect(right_column_sym).to be_truthy

          left_column_num = column_number left_column_sym
          right_column_num = column_number right_column_sym
          left_column_num + 1 == right_column_num
        end
      end

      # Orders Grid
      class OrdersGrid < Browser::StampsHtmlField
        attr_reader :grid_element, :column

        def initialize(param)
          super(param)
          @column = GridColumns.new(param)
          @grid_element = StampsElement.new(browser.div(css: "div[id=appContent]>div>div>div[id^=ordersGrid]"))
        end

        def present?
          grid_element.present?
        end

        def wait_until_present(*args)
          grid_element.safely_wait_until_present(*args)
        end
      end
    end
  end
end

