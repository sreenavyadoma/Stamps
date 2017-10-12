module Stamps
  module Orders
    module Grid
      module GridColumnCommon
        def column_number_cache
          @column_number_cache |= {}
        end
        
        def column_names
          @column_names |= {
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
          
        end

        def sort_order(column, sort_order)
          scroll_to_column(column)

          span = browser.span(text: column_names[column])
          column = StampsElement.new(span)
          sort_order = (sort_order==:sort_ascending)?"ASC":"DESC"
          sort_order_span = span.parent.parent.parent.parent.parent

          10.times do
            column.scroll_into_view
            5.times do
              sleep(1)
              if sort_order_span.attribute_value("class").include?(sort_order)
                break;
              else
                column.click
              end
            end
          end
          return "ASC" if  sort_order_span.attribute_value("class").include?("ASC")
          return "DESC" if  sort_order_span.attribute_value("class").include?("DESC")
          "Something went wrong."
        end

        def grid_text_by_id(column, order_id)
          scroll_to_column(column)
          grid_text(column, row_number(order_id))
        end

        def row_count
          browser.tables(css: "div[id^=ordersGrid-][id$=-body]>div>div>table").size.to_i
        end

        def scroll_to_column(name)
          expect(name).to be_truthy
          case name
            when Symbol
              StampsElement.new(browser.span(text: column_names[name])).scroll_into_view
            when String
              StampsElement.new(browser.span(text: name)).scroll_into_view
            when Watir::Element
              StampsElement.new(name).scroll_into_view
            else
              expect(name).to be_a(String).or(eq(Symbol)).or(eq(Watir::Element))
          end
        end

        def empty?
          size == 0
        end

        def size
          30.times do break if browser.tables(:css=>"div[id^=ordersGrid-][id$=-body]>div>div>table").size > 0 end
          browser.tables(:css=>"div[id^=ordersGrid-][id$=-body]>div>div>table").size
        end

        def parameter_helper
          helper
        end

        def grid_text(column, row)
          scroll_to_column(column)
          StampsElement.new(grid_element(column, row)).text
        end

        def grid_element(column_number, row)
          browser.div(css: "div[id^=ordersGrid-][id$=-body]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_number(column_number).to_s})>div")
        end

        def grid_field_column_name(column_name, row)
          grid_text(column_number(column_name), row)
        end

        def column_number(column)
          if column_number_cache[column].nil?
            columns = browser.spans(css: "div[id^=gridcolumn-][id$=-textEl]>span")
            columns.each_with_index do |element, index|
              scroll_to_column(element) #scroll unless element is visible
              column_number_cache[column_names.key(StampsElement.new(element).text)] = index+1
            end

          end
          column_number_cache[column]
        end

        # locate row location for order_id
        def row_number(order_id)
          5.times do
            column_num = column_number(:order_id)
            fields = browser.divs(css: "div[id^=ordersGrid-][id$=-body]>div>div>table>tbody>tr>td:nth-child(#{column_num})>div")
            fields.each_with_index do |element, index|
              scroll_to_column(element)
              if StampsElement.new(element).text.include?(order_id)
                logger.info "Order ID #{order_id}, Row #{index+1}"
                sleep(0.35)
                return index + 1
              end
            end
          end
          #"Unable to obtain row number for Order ID #{order_id}").to eql "" if row == 0
        end
      end

      class OrderId < Browser::StampsModal
        include GridColumnCommon
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
          return "" if size == 0
          grid_text(:order_id, row)
        end

      end

      class Store < Browser::StampsModal
        include GridColumnCommon
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

      class Age < Browser::StampsModal
        include GridColumnCommon
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

      class OrderDate < Browser::StampsModal
        include GridColumnCommon
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

      class Recipient < Browser::StampsModal
        include GridColumnCommon
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

      class Company < Browser::StampsModal
        include GridColumnCommon
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

      class Address < Browser::StampsModal
        include GridColumnCommon
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

      class City < Browser::StampsModal
        include GridColumnCommon
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

      class State < Browser::StampsModal
        include GridColumnCommon
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

      class Zip < Browser::StampsModal
        include GridColumnCommon
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

      class Phone < Browser::StampsModal
        include GridColumnCommon
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

      class Email < Browser::StampsModal
        include GridColumnCommon
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

      class Qty < Browser::StampsModal
        include GridColumnCommon
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

      class ItemSKU < Browser::StampsModal
        include GridColumnCommon
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

      class ItemName < Browser::StampsModal
        include GridColumnCommon
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

      class Weight < Browser::StampsModal
        include GridColumnCommon
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

      class InsuredValue < Browser::StampsModal
        include GridColumnCommon
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
          test_helper.dollar_amount_str(grid_text_by_id(:insured_value, order_id)).to_f.round(2)
        end
      end

      class OrderStatus < Browser::StampsModal
        include GridColumnCommon
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

      class ShipDate < Browser::StampsModal
        include GridColumnCommon
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

      class ShipFrom < Browser::StampsModal
        include GridColumnCommon
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

      class Country < Browser::StampsModal
        include GridColumnCommon
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

      class ShipCost < Browser::StampsModal
        include GridColumnCommon
        def scroll_into_view
          scroll_to_column(:ship_cost)
        end

        def row(row)
          grid_text(:ship_cost, row)
        end

        def data(order_id)
          cost = grid_text_by_id(:ship_cost, order_id)
          (cost.include? "$")?test_helper.dollar_amount_str(cost).to_f.round(2):cost
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

      class Company < Browser::StampsModal
        include GridColumnCommon
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

      class GridService < Browser::StampsModal
        include GridColumnCommon
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

      class RequestedService < Browser::StampsModal
        include GridColumnCommon
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

      class ReferenceNo < Browser::StampsModal
        include GridColumnCommon
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

      class CostCode < Browser::StampsModal
        include GridColumnCommon
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

      class Tracking < Browser::StampsModal
        include GridColumnCommon
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

      class DatePrinted < Browser::StampsModal
        include GridColumnCommon
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

      class GridCheckBox < Browser::StampsModal
        include GridColumnCommon
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
          Stamps::Browser::StampsCheckBox.new checkbox_field, check_verify_field, attribute, attrib_value_check
        end

        def check_all(*args)
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
          check(row_number(order_id))
        end

        def uncheck_order_id(order_id)
          uncheck(row_number(order_id))
        end

        def checkbox_element(row)
          div = browser.div(css: "div[id^=ordersGrid-][id$=-body]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td>div>div[class=x-grid-row-checker]")
          verify_field = browser.table(css: "div[id^=ordersGrid-][id$=-body]>div>div>table:nth-child(#{row.to_s})")
          StampsCheckBox.new(div, verify_field, "class", "selected")
        end

        def check(row)
          begin
            scroll_into_view
            expect(size).to be > 0, "Grid is empty, there's no Order ID to check."
            checkbox_element(row).check
            expect(checked?(row)).to be(true), "Unable to check checkbox row #{row}"
          end unless checked?(row)
        end

        def uncheck(row)
          if checked?(row)
            scroll_into_view
            if size > 0
              checkbox_element(row).uncheck
              expect(checked?(row)).to be(false), "Unable to uncheck checkbox row #{row}"
            end
          end
        end

        def checked?(row)
          scroll_into_view
          checkbox_element(row).checked?
        end

        def order_id_checked?(order_number)
          scroll_into_view
          checked?(row_number(order_number))
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

      class TrackingService < Browser::StampsModal
        include GridColumnCommon
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

      class OrderTotal < Browser::StampsModal
        include GridColumnCommon
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

      class GridSource < Browser::StampsModal
        include GridColumnCommon
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

      # Orders Grid
      class OrdersGrid < Browser::StampsModal
        def present?
          grid_element.present?
        end

        def wait_until_present(*args)
          grid_element.wait_until_present(*args)
        end

        def grid_column(name)
          case(name)
            when :checkbox
              grid_hash[:checkbox] = GridCheckBox.new(param) if !grid_hash.has_key?(:checkbox) || !grid_hash[:checkbox].present?
              return grid_hash[:checkbox]
            when :store_column
              grid_hash[:store] = Store.new(param) if !grid_hash.has_key?(:store) || !grid_hash[:store].present?
              return grid_hash[:store]
            when :order_id
              grid_hash[:order_id] = OrderId.new(param) if !grid_hash.has_key?(:order_id) || !grid_hash[:order_id].present?
              return grid_hash[:order_id]
            when :ship_cost
              grid_hash[:ship_cost] = ShipCost.new(param) if !grid_hash.has_key?(:ship_cost) || !grid_hash[:ship_cost].present?
              return grid_hash[:ship_cost]
            when :age
              grid_hash[:age] = Age.new(param) if !grid_hash.has_key?(:age) || !grid_hash[:age].present?
              return grid_hash[:age]
            when :order_date
              grid_hash[:order_date] = OrderDate.new(param) if !grid_hash.has_key?(:order_date) || !grid_hash[:order_date].present?
              return grid_hash[:order_date]
            when :recipient
              grid_hash[:recipient] = Recipient.new(param) if !grid_hash.has_key?(:recipient) || !grid_hash[:recipient].present?
              return grid_hash[:recipient]
            when :company
              grid_hash[:company] = Company.new(param) if !grid_hash.has_key?(:company) || !grid_hash[:company].present?
              return grid_hash[:company]
            when :country
              grid_hash[:country] = Country.new(param) if !grid_hash.has_key?(:country) || !grid_hash[:country].present?
              return grid_hash[:country]
            when :address
              grid_hash[:address] = Address.new(param) if !grid_hash.has_key?(:address) || !grid_hash[:address].present?
              return grid_hash[:address]
            when :city
              grid_hash[:city] = City.new(param) if !grid_hash.has_key?(:city) || !grid_hash[:city].present?
              return grid_hash[:city]
            when :state
              grid_hash[:state] = State.new(param) if !grid_hash.has_key?(:state) || !grid_hash[:state].present?
              return grid_hash[:state]
            when :zip
              grid_hash[:zip] = Zip.new(param) if !grid_hash.has_key?(:zip) || !grid_hash[:zip].present?
              return grid_hash[:zip]
            when :phone
              grid_hash[:phone] = Phone.new(param) if !grid_hash.has_key?(:phone) || !grid_hash[:phone].present?
              return grid_hash[:phone]
            when :email
              grid_hash[:email] = Email.new(param) if !grid_hash.has_key?(:email) || !grid_hash[:email].present?
              return grid_hash[:email]
            when :qty
              grid_hash[:qty] = Qty.new(param) if !grid_hash.has_key?(:qty) || !grid_hash[:qty].present?
              return grid_hash[:qty]
            when :item_sku
              grid_hash[:item_sku] = ItemSKU.new(param) if !grid_hash.has_key?(:item_sku) || !grid_hash[:item_sku].present?
              return grid_hash[:item_sku]
            when :item_name
              grid_hash[:item_name] = ItemName.new(param) if !grid_hash.has_key?(:item_name) || !grid_hash[:item_name].present?
              return grid_hash[:item_name]
            when :ship_from
              grid_hash[:ship_from] = ShipFrom.new(param) if !grid_hash.has_key?(:ship_from) || !grid_hash[:ship_from].present?
              return grid_hash[:ship_from]
            when :service
              grid_hash[:service] = GridService.new(param) if !grid_hash.has_key?(:service) || !grid_hash[:service].present?
              return grid_hash[:service]
            when :requested_service
              grid_hash[:requested_service] = RequestedService.new(param) if !grid_hash.has_key?(:requested_service) || !grid_hash[:requested_service].present?
              return grid_hash[:requested_service]
            when :weight
              grid_hash[:weight] = Weight.new(param) if !grid_hash.has_key?(:weight) || !grid_hash[:weight].present?
              return grid_hash[:weight]
            when :insured_value
              grid_hash[:insured_value] = InsuredValue.new(param) if !grid_hash.has_key?(:insured_value) || !grid_hash[:insured_value].present?
              return grid_hash[:insured_value]
            when :tracking_service
              grid_hash[:tracking_service] = TrackingService.new(param) if !grid_hash.has_key?(:tracking_service) || !grid_hash[:tracking_service].present?
              return grid_hash[:tracking_service]
            when :order_status
              grid_hash[:order_status] = OrderStatus.new(param) if !grid_hash.has_key?(:order_status) || !grid_hash[:order_status].present?
              return grid_hash[:order_status]
            when :date_printed
              grid_hash[:date_printed] = DatePrinted.new(param) if !grid_hash.has_key?(:date_printed) || !grid_hash[:date_printed].present?
              return grid_hash[:date_printed]
            when :ship_date
              grid_hash[:ship_date] = ShipDate.new(param) if !grid_hash.has_key?(:ship_date) || !grid_hash[:ship_date].present?
              return grid_hash[:ship_date]
            when :tracking_no
              grid_hash[:tracking_no] = Tracking.new(param) if !grid_hash.has_key?(:tracking_no) || !grid_hash[:tracking_no].present?
              return grid_hash[:tracking_no]
            when :order_total
              grid_hash[:order_total] = OrderTotal.new(param) if !grid_hash.has_key?(:order_total) || !grid_hash[:order_total].present?
              return grid_hash[:order_total]
            when :source
              grid_hash[:source] = GridSource.new(param) if !grid_hash.has_key?(:source) || !grid_hash[:source].present?
              return grid_hash[:source]
            when :reference_no
              grid_hash[:reference_no] = ReferenceNo.new(param) if !grid_hash.has_key?(:reference_no) || !grid_hash[:reference_no].present?
              return grid_hash[:reference_no]
            else
              raise "#{name} is not a valid column. Check your test."
          end
        end

        private
        def grid_hash
          @grid_hash |= {}
        end
        
        def grid_element
          StampsElement.new(browser.div(css: "div[id=appContent]>div>div>div[id^=ordersGrid-][id$=-body]"))
        end
      end
    end
  end
end

