
module SdcGrid

  class GridItem < SdcPage
    @@columns = {}

    def self.set(property, value)
      @@columns[property] = value
    end

    def self.get(property)
      @@columns[property]
    end

    def grid_container
      '//div[@class="x-grid-item-container"]'
    end

    def scroll_to_column(column)
      method_name = "scroll_to_#{column.to_s}"
      column_name = column_text[column]
      xpath = "//span[text()='#{column_name}']"
      field = if column.eql? :checkbox
                xpath = '//div[contains(@class, "x-column-header-checkbox")]'
                page_object(:checkbox) { { xpath: xpath } }
              else
                page_object(method_name.to_sym, tag: :span) { { xpath: xpath } }
              end
      field.scroll_into_view
      field
    end

    def grid_text_by_id(column, order_id)
      row = row_number(order_id)
      grid_text(column, row)
    end

    def count
      xpath = "#{grid_container}//table"
      grid_row_ct = page_object(:grid_row_ct) { { xpath: xpath } }
      begin
        ct = grid_row_ct.size.to_i
        return ct if ct > 0
      rescue
        # ignore
      end
      0
    end
    alias_method :size, :count

    def empty?
      size.zero?
    end

    def grid_text(column, row)
      scroll_to_column(column)
      element = grid_field(column, row)
      element.text_value
    end

    def grid_field(column, row)
      column_num = column_number(column).to_s
      xpath = "#{grid_container}//table[#{row.to_s}]//tbody//td[#{column_num}]//div"
      coordinates = "col#{column}xrow#{row}"
      page_object(coordinates.to_sym) { { xpath: xpath } }
    end

    def grid_field_column_name(column, row)
      col = column_number(column)
      grid_text(col, row)
    end

    def column_number(name)
      column = get(name)
      if column
        return column
      else
        xpath = '//span[@class="x-column-header-text-inner"]'
        columns = page_objects(:columns) { { xpath: xpath } }
        columns.each_with_index do |field, index|
          element = ::SdcElement.new(field)
          element.scroll_into_view
          text = element.text_value
          key = if index.zero?
                  :checkbox
                else
                  column_text.key(text)
                end
          set(key, index + 1)

          return get(name) if key.eql?(name)
        end
      end

      raise ArgumentError, "#{name} is not a valid column"
    end

    def row_number(order_id)
      scroll_to_column(:order_id)
      col_num = column_number(:order_id)
      xpath = "#{grid_container}//tbody//td[#{col_num}]//div"
      divs = page_objects(:row_number_divs) { { xpath: xpath } }
      divs.each_with_index do |field, index|
        return index + 1 if field.text.include?(order_id)
      end

      raise ArgumentError, "Cannot locate Order ID #{order_id}"
    end

    def sort_order(column, sort_order)
      # scroll_to_column(column)
      #
      # span = driver.span(text: column_text[column])
      # column = StampsField.new(span)
      # sort_order = sort_order == :sort_ascending ? "ASC" : "DESC"
      # sort_order_span = span.parent.parent.parent.parent.parent
      #
      # 10.times do
      #   column.scroll_into_view
      #   5.times do
      #     sleep(1)
      #     if sort_order_span.attribute_value('class').include?(sort_order)
      #       break;
      #     else
      #       column.click
      #     end
      #   end
      # end
      # return "ASC" if  sort_order_span.attribute_value('class').include?("ASC")
      # return "DESC" if  sort_order_span.attribute_value('class').include?("DESC")
      # nil
    end

    protected

    def get(property)
      self.class.get(property)
    end

    def set(property, value)
      self.class.set(property, value)
    end

    def column_text
      @column_text ||= {
        checkbox: ' ',
        store: 'Store',
        ship_cost: 'Ship Cost',
        age: 'Age',
        order_id: 'Order ID',
        order_date: 'Order Date',
        recipient: 'Recipient',
        company: 'Company',
        address: 'Address',
        city: 'City',
        state: 'State',
        zip: 'Zip',
        country: 'Country',
        phone: 'Phone',
        email: 'Email',
        qty: 'Qty.',
        item_sku: 'Item SKU',
        item_name: 'Item Name',
        ship_from: 'Ship From',
        service: 'Service',
        requested_service: 'Requested Service',
        weight: 'Weight',
        insured_value: 'Insured Value',
        tracking_service: 'Tracking Service',
        reference_no: 'Reference No.',
        order_status: 'Order Status',
        date_printed: 'Date Printed',
        ship_date: 'Ship Date',
        tracking_no: 'Tracking #',
        order_total: 'Order Total',
        source: 'Source'
      }
    end
  end

  class SdcGridCheckBox < GridItem
    sdc_param(:chooser_xpath) { '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' }
    page_object(:chooser) { { xpath: '//div[contains(@class, "x-column-header-checkbox")]//span' } }
    page_object(:verify) { { xpath: '//div[contains(@class, "x-column-header-checkbox")]' } }
    chooser(:checkbox_header, :chooser, :verify, :class, 'checker-on')

    def scroll_into_view
      scroll_to_column(:checkbox)
    end

    def checkbox_row(row)
      scroll_into_view
      chooser_xpath = "//table[#{row}]//div[@class='x-grid-row-checker']"
      chooser_name = "grid_chooser_#{row}"
      page_object(chooser_name) { { xpath: chooser_xpath } }
      verify_xpath = "#{grid_container}//table[#{row}]"
      verify_name = "grid_verify_#{row}"
      page_object(verify_name) { { xpath: verify_xpath } }
      grid_checkbox_name = "grid_checkbox_#{row}"
      SdcPage.chooser(grid_checkbox_name, chooser_name, verify_name, :class, 'selected')
      instance_eval(grid_checkbox_name)
    end

  end

  class SdcStore < GridItem

    def scroll_into_view
      scroll_to_column(:hash)
    end

    def row(row)
      grid_text(:hash, row)
    end

    def data(order_id)
      grid_text_by_id(:hash, order_id)
    end

    def sort_ascending
      sort_order(:hash, :sort_ascending)
    end

    def sort_descending
      sort_order(:hash, :sort_descending)
    end
  end

  class SdcOrderId < GridItem

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
      #browser.wait_until(timeout: 20) { !size.zero? }
      grid_text(:order_id, row)
    end

  end

  class SdcAge < GridItem

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

  class SdcOrderDate < GridItem

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

  class SdcRecipient < GridItem

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
      #scroll_into_view
      #sleep(0.35)
      grid_text_by_id(:recipient, order_id)
    end

    def row(row)
      grid_text(:recipient, row)
    end

  end

  class SdcCompany < GridItem

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

  class SdcAddress < GridItem

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

  class SdcCity < GridItem

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

  class SdcState < GridItem

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

  class SdcZip < GridItem

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

  class SdcPhone < GridItem

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

  class SdcEmail < GridItem

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

  class SdcQty < GridItem

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

  class SdcItemSKU < GridItem
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

  class SdcItemName < GridItem
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

  class SdcWeight < GridItem
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

  class SdcInsuredValue < GridItem
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
      grid_text_by_id(:insured_value, order_id).dollar_amount_str.to_f.round(2)
    end
  end

  class SdcOrderStatus < GridItem
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

  class SdcShipDate < GridItem
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

  class SdcShipFrom < GridItem
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

  class SdcCountry < GridItem
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

  class SdcShipCost < GridItem
    def scroll_into_view
      scroll_to_column(:ship_cost)
    end

    def row(row)
      grid_text(:ship_cost, row)
    end

    def data(order_id)
      grid_text_by_id(:ship_cost, order_id).dollar_amount_str
    end

    def ship_cost_error(order_id)
      scroll_into_view
      begin
        div = grid_field(:ship_cost, row_number(order_id)).div
        data_error = div.attribute_value("data-qtip")
      rescue
        data_error = ""
      end

      log.info "#{order_id} data-qtip error:  #{data_error.length.zero? ? "None" : data_error}"
      data_error
    end

  end

  class SdcCompany < GridItem
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

  class SdcGridService < GridItem
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

  class SdcRequestedService < GridItem

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

  class SdcReferenceNo < GridItem

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

  class SdcTracking < GridItem

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

  class SdcDatePrinted < GridItem

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

  class SdcTrackingService < GridItem

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

  class SdcOrderTotal < GridItem

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

  class SdcGridSource < GridItem

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


  def body
    xpath = '//div[starts-with(@id, "ordersGrid-")][contains(@id, "-normal-body")]'
    klass = Class.new(SdcPage) do
      page_object(:body) { { xpath: xpath } }
    end

    klass.new.body
  end
  module_function :body

  def grid_column(name)
    body.wait_until_present(timeout: 15)
    case(name)
    when :checkbox
      SdcGridCheckBox.new
    when :hash
      SdcStore.new
    when :order_id
      SdcOrderId.new
    when :ship_cost
      SdcShipCost.new
    when :age
      SdcAge.new
    when :order_date
      SdcOrderDate.new
    when :recipient
      SdcRecipient.new
    when :company
      SdcCompany.new
    when :country
      SdcCountry.new
    when :address
      SdcAddress.new
    when :city
      SdcCity.new
    when :state
      SdcState.new
    when :zip
      SdcZip.new
    when :phone
      SdcPhone.new
    when :email
      SdcEmail.new
    when :qty
      SdcQty.new
    when :item_sku
      SdcItemSKU.new
    when :item_name
      SdcItemName.new
    when :ship_from
      SdcShipFrom.new
    when :service
      SdcGridService.new
    when :requested_service
      SdcRequestedService.new
    when :weight
      SdcWeight.new
    when :insured_value
      SdcInsuredValue.new
    when :tracking_service
      SdcTrackingService.new
    when :order_status
      SdcOrderStatus.new
    when :date_printed
      SdcDatePrinted.new
    when :ship_date
      SdcShipDate.new
    when :tracking_no
      SdcTracking.new
    when :order_total
      SdcOrderTotal.new
    when :source
      SdcGridSource.new
    when :reference_no
      SdcReferenceNo.new
    else
      raise "Invalid column #{name}"
    end
  end
  module_function :grid_column

end