module Stamps
  module Orders
    module Grid
      module GridColumnCommon
        def column_cache
          @column_cache ||= {}
        end

        def column_text
          @column_text ||= {
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

          span=browser.span(text: column_text[column])
          column=StampsField.new(span)
          sort_order=(sort_order==:sort_ascending)?"ASC":"DESC"
          sort_order_span=span.parent.parent.parent.parent.parent

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
              StampsField.new(browser.span(text: column_text[name])).scroll_into_view
            when String
              StampsField.new(browser.span(text: name)).scroll_into_view
            when Watir::Element
              StampsField.new(name).scroll_into_view
            else
              raise "#{name} is not a recognized type in scroll_to_column(name). Check your tests."
          end
        end

        def empty?
          size==0
        end

        def size
          15.times do
            begin
              sleep(0.05)
              if (count=browser.tables(:css=>"div[id^=ordersGrid-][id$=-body] table").size) > 0
                browser.tables(:css=>"div[id^=ordersGrid-][id$=-body] table")[0].flash
                return count
              end
            rescue
              #ignore
            end
          end
          0
        end

        def parameter_helper
          helper
        end

        def grid_text(column, row)
          scroll_to_column(column)
          StampsField.new(grid_field(column, row)).text
        end

        def grid_field(column_number, row)
          browser.div(css: "div[id^=ordersGrid-][id$=-body]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td:nth-child(#{column_number(column_number).to_s})>div")
        end

        def grid_field_column_name(column_name, row)
          grid_text(column_number(column_name), row)
        end

        def column_number(column)
          if column_cache[column].nil?
            columns=browser.spans(css: "div[id^=gridcolumn-][id$=-textEl]>span")
            columns.each_with_index do |field, index|
              scroll_to_column(field) #scroll unless field is visible
              column_cache[column_text.key(StampsField.new(field).text)]=index+1
            end
          end
          column_cache[column]
        end

        # locate row location for order_id
        def row_number(order_id)
          5.times do
            column_num=column_number(:order_id)
            fields=browser.divs(css: "div[id^=ordersGrid-][id$=-body]>div>div>table>tbody>tr>td:nth-child(#{column_num})>div")
            fields.each_with_index do |field, index|
              scroll_to_column(field)
              if StampsField.new(field).text.include?(order_id)
                logger.info "Order ID #{order_id}, Row #{index+1}"
                sleep(0.35)
                return index + 1
              end
            end
          end
          nil
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
          return "" if size==0
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
          cost=grid_text_by_id(:ship_cost, order_id)
          (cost.include? "$")?test_helper.dollar_amount_str(cost).to_f.round(2):cost
        end

        def ship_cost_error(order_id)
          scroll_into_view
          begin
            div=grid_field(:ship_cost, row_number(order_id)).div
            data_error=div.attribute_value("data-qtip")
          rescue
            data_error=""
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
          field=StampsField.new((browser.spans css: "div[componentid^=gridcolumn]").first)
          field.scroll_into_view
          field
        end

        def checkbox_header
          scroll_into_view

          checkbox_field=(browser.spans css: "div[componentid^=gridcolumn]").first
          check_verify_field=browser.div css: "div[class*=x-column-header-checkbox]"
          attribute="class"
          attrib_value_check="checker-on"
          Stamps::Browser::StampsCheckbox.new checkbox_field, check_verify_field, attribute, attrib_value_check
        end

        def check_all(*args)
          scroll_into_view
          if args.length==1
            if args[0].is_a? Hash
              rows=args[0]
              logger.info "Restoring #{} checked orders..."
            else
              expect("Invalid parameter exception.  This method expects a Hash of Web Elements.").to eql ""
            end
            rows.each do |hash_field|
              row_number=hash_field[0]
              checked=hash_field[1]
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

        def checkbox_field(row)
          div=browser.div(css: "div[id^=ordersGrid-][id$=-body]>div>div>table:nth-child(#{row.to_s})>tbody>tr>td>div>div[class=x-grid-row-checker]")
          verify_field=browser.table(css: "div[id^=ordersGrid-][id$=-body]>div>div>table:nth-child(#{row.to_s})")
          StampsCheckbox.new(div, verify_field, "class", "selected")
        end

        def check(row)
          begin
            scroll_into_view
            expect(size).to be > 0, "Grid is empty, there's no Order ID to check."
            checkbox_field(row).check
            expect(checked?(row)).to be(true), "Unable to check checkbox row #{row}"
          end unless checked?(row)
          checked?(row)
        end

        def uncheck(row)
          if checked?(row)
            scroll_into_view
            if size > 0
              checkbox_field(row).uncheck
              expect(checked?(row)).to be(false), "Unable to uncheck checkbox row #{row}"
            end
          end
          checked?(row)
        end

        def checked?(row)
          scroll_into_view
          checkbox_field(row).checked?
        end

        def order_id_checked?(order_number)
          scroll_into_view
          checked?(row_number(order_number))
        end

        def checked_rows(*args)
          cache_count=5
          if args.length==1
            cache_count=args[0]
          end

          logger.info "Caching checked rows..."
          checked_rows=Hash.new
          grid_total=row_count
          if cache_count > 2 && cache_count < grid_total
            cache_item_count=cache_count
          elsif cache_count > grid_total
            cache_item_count=grid_total
          else
            cache_item_count=cache_count
          end
          logger.info "Number of rows to check:  #{cache_item_count}"
          1.upto(cache_item_count) { |row|
            checked=checked?(row)
            if checked
              checked_rows[row]=checked
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
        @column = {}
        def present?
          grid_field.present?
        end

        def wait_until_present(*args)
          grid_field.wait_until_present(*args)
        end

        def grid_column(name)
          wait_until_present(5)
          case(name)
            when :checkbox
              (!column.has_key?(:checkbox)||!column[:checkbox].present?)?column[:checkbox]=GridCheckBox.new(param):column[:checkbox]
            when :store
              (!column.has_key?(:store)||!column[:store].present?)?column[:store]=Store.new(param):column[:store]
            when :order_id
              (!column.has_key?(:order_id)||!column[:order_id].present?)?column[:order_id]=OrderId.new(param):column[:order_id]
            when :ship_cost
              (!column.has_key?(:ship_cost)||!column[:ship_cost].present?)?column[:ship_cost]=ShipCost.new(param):column[:ship_cost]
            when :age
              (!column.has_key?(:age)||!column[:age].present?)?column[:age]=Age.new(param):column[:age]
            when :order_date
              (!column.has_key?(:order_date)||!column[:order_date].present?)?column[:order_date]=OrderDate.new(param):column[:order_date]
            when :recipient
              (!column.has_key?(:recipient)||!column[:recipient].present?)?column[:recipient]=Recipient.new(param):column[:recipient]
            when :company
              (!column.has_key?(:company)||!column[:company].present?)?column[:company]=Company.new(param):column[:company]
            when :country
              (!column.has_key?(:country)||!column[:country].present?)?column[:country]=Country.new(param):column[:country]
            when :address
              (!column.has_key?(:address)||!column[:address].present?)?column[:address]=Address.new(param):column[:address]
            when :city
              (!column.has_key?(:city)||!column[:city].present?)?column[:city]=City.new(param):column[:city]
            when :state
              (!column.has_key?(:state)||!column[:state].present?)?column[:state]=State.new(param):column[:state]
            when :zip
              (!column.has_key?(:zip)||!column[:zip].present?)?column[:zip]=Zip.new(param):column[:zip]
            when :phone
              (!column.has_key?(:phone)||!column[:phone].present?)?column[:phone]=Phone.new(param):column[:phone]
            when :email
              (!column.has_key?(:email)||!column[:email].present?)?column[:email]=Email.new(param):column[:email]
            when :qty
              (!column.has_key?(:qty)||!column[:qty].present?)?column[:qty]=Qty.new(param):column[:qty]
            when :item_sku
              (!column.has_key?(:item_sku)||!column[:item_sku].present?)?column[:item_sku]=ItemSKU.new(param):column[:item_sku]
            when :item_name
              (!column.has_key?(:item_name)||!column[:item_name].present?)?column[:item_name]=ItemName.new(param):column[:item_name]
            when :ship_from
              (!column.has_key?(:ship_from)||!column[:ship_from].present?)?column[:ship_from]=ShipFrom.new(param):column[:ship_from]
            when :service
              (!column.has_key?(:service)||!column[:service].present?)?column[:service]=GridService.new(param):column[:service]
            when :requested_service
              (!column.has_key?(:requested_service)||!column[:requested_service].present?)?column[:requested_service]=RequestedService.new(param):column[:requested_service]
            when :weight
              (!column.has_key?(:weight)||!column[:weight].present?)?column[:weight]=Weight.new(param):column[:weight]
            when :insured_value
              (!column.has_key?(:insured_value)||!column[:insured_value].present?)?column[:insured_value]=InsuredValue.new(param):column[:insured_value]
            when :tracking_service
              (!column.has_key?(:tracking_service)||!column[:tracking_service].present?)?column[:tracking_service]=TrackingService.new(param):column[:tracking_service]
            when :order_status
              (!column.has_key?(:order_status)||!column[:order_status].present?)?column[:order_status]=OrderStatus.new(param):column[:order_status]
            when :date_printed
              (!column.has_key?(:date_printed)||!column[:date_printed].present?)?column[:date_printed]=DatePrinted.new(param):column[:date_printed]
            when :ship_date
              (!column.has_key?(:ship_date)||!column[:ship_date].present?)?column[:ship_date]=ShipDate.new(param):column[:ship_date]
            when :tracking_no
              (!column.has_key?(:tracking_no)||!column[:tracking_no].present?)?column[:tracking_no]=Tracking.new(param):column[:tracking_no]
            when :order_total
              (!column.has_key?(:order_total)||!column[:order_total].present?)?column[:order_total]=OrderTotal.new(param):column[:order_total]
            when :source
              (!column.has_key?(:source)||!column[:source].present?)?column[:source]=GridSource.new(param):column[:source]
            when :reference_no
              (!column.has_key?(:reference_no)||!column[:reference_no].present?)?column[:reference_no]=ReferenceNo.new(param):column[:reference_no]
            else
              raise "#{name} is not a valid column. Check your test."
          end
        end

        def grid_field
          (!column.has_key?(:grid_field)||!column[:grid_field].present?)?column[:grid_field]=StampsField.new(browser.div(css: "[id^=ordersGrid-][class*=orders-grid]")):column[:grid_field]
        end

        def self.column
          @column
        end

        def column
          self.class.column
        end

      end
    end
  end
end

