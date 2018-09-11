module SdcContacts

  class ContactsGridColumnBase < SdcPage
    @@column_number = {}

    def self.set(property, value)
      @@column_number[property] = value
    end

    def self.get(property)
      @@column_number[property]
    end

    #def self.column_names
    def self.contacts_column_names
      @@contacts_column_names ||= {
          checkbox: ' ',
          name: 'Name',
          prefix: 'Prefix',
          first_name: 'First Name',
          middle: 'Middle',
          last_name: 'Last Name',
          suffix: 'Suffix',
          company: 'Company',
          title: 'Title',
          department: 'Department',
          country: 'Country',
          email: 'Email',
          phone: 'Phone',
          phone_ext: 'Ext.',
          city: 'City',
          state_prv: 'State/Prv',
          street_address: 'Street Address',
          postal_code: 'Postal Code',
          cost_code: 'Cost Code',
          reference_no: 'Reference #',
          groups: 'Groups'
      }
    end

    def contacts_grid_container
      '//div[@class="x-grid-item-container"]'
    end

    def contacts_column_xpath(column)
      column = column_names[column] if column.class.eql?(Symbol)
      "*//span[text()='#{column}']"
    end

    def contacts_header_element(column)
      if column.eql? :checkbox
        xpath = '*//div[contains(@class, "x-column-header-checkbox")]'
        page_object(:checkbox_header) { { xpath: xpath } }
      else
        xpath = contacts_column_xpath(column)
        page_object("header_element_#{column}") { { xpath: xpath } }
      end
    end

    def contacts_scroll_to(column)
      field = contacts_header_element(column)
      field.scroll_into_view
    end

    #def text_for_id(column, order_id)
     # row = row_num(order_id)
      #text_at(column, row)
    #end

    def count
      xpath = "#{contacts_grid_container}//table"
      grid_row_ct = page_object(:contacts_grid_row_ct) { { xpath: xpath } }
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

    def text_at(column, row)
      contacts_scroll_to(column)
      element = element_at_row(column, row)
      element.text_value
    end

    def element_at_row(column, row)
      column_num = contacts_column_number(column).to_s
      xpath = "#{contacts_grid_container}//table[#{row.to_s}]//tbody//td[#{column_num}]//div"
      coordinates = "col#{column}xrow#{row}"
      element = page_object(coordinates.to_sym) { { xpath: xpath } }
      element.scroll_into_view
      element
    end

   # def contacts_element_for_id(column,order_id)
      #row = contacts_row_num(order_id)
      #contacts_element_at_row(column, row)
   # end

    def contacts_grid_field_column_name(column, row)
      col = contacts_column_number(column)
      text_at(col, row)
    end

    def contacts_column_number(name)
      col_num = get(name)
      if col_num
        return col_num
      else
        xpath = '//span[@class="x-column-header-text-inner"]'
        columns = page_objects(:contact_columns) { { xpath: xpath } }
        columns.each_with_index do |field, index|
          element = ::SdcElement.new(field)
          element.scroll_into_view
          text = element.text_value
          key = if index.zero?
                  :checkbox
                else
                  column_names.key(text)
                end
          set(key, index + 1)

          if key.eql?(name)
            contacts_scroll_to(name)
            col_num = get(name)
            return col_num
          end
        end
      end
      error_message = "Cannot find column number for #{name} in the Contacts grid"
      raise ArgumentError, error_message
    end

    def contacts_row_num(order_id)
      scroll_to(:order_id)
      col_num = contacts_column_number(:order_id)
      xpath = "#{contacts_grid_container}//tbody//td[#{col_num}]//div"
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

    def get(property)
      self.class.get(property)
    end

    def set(property, value)
      self.class.set(property, value)
    end

    def column_names
      self.class.contacts_column_names
    end
  end

  class SdcContactsGridCheckBox < ContactsGridColumnBase
    #sdc_param(:chooser_xpath) { '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' }
    page_object(:chooser) { { xpath: '//div[contains(@class, "x-column-header-text")]//span' } }
    page_object(:verify) { { xpath: '//div[contains(@class, "x-column-header-text")]' } }
    SdcPage.chooser(:checkbox_header, :chooser, :verify, :class, 'checker-on')

    def contacts_scroll_into_view
      contacts_scroll_to(:checkbox)
    end

    def contacts_checkbox_row(row)
      #contacts_scroll_into_view
      chooser_xpath = "//table[#{row}]//div[@class='x-grid-row-checker']"
      chooser_name = "grid_chooser_#{row}"
      page_object(chooser_name) { { xpath: chooser_xpath } }
      verify_xpath = "#{contacts_grid_container}//table[#{row}]"
      verify_name = "grid_verify_#{row}"
      page_object(verify_name) { { xpath: verify_xpath } }
      grid_checkbox_name = "grid_checkbox_#{row}"
      SdcPage.chooser(grid_checkbox_name, chooser_name, verify_name, :class, 'selected')
      instance_eval(grid_checkbox_name)
    end
  end

  class SdcContactsGridColumn < ContactsGridColumnBase
    def initialize(column)
      @column = column
    end

    def contacts_header_text
      element = contacts_scroll_into_view
      element.text_value
    end

    def present?
      element = contacts_scroll_into_view
      element.present?
    end

    def contacts_scroll_into_view
      contacts_scroll_to(@column)
    end

    def contacts_text_at_row(row)
      text_at(@column, row)
    end

    #def data(order_id)
      #text_for_id(@column, order_id)
    #end

    def contacts_element(row)
      contacts_element_at_row(@column, row)
    end

    #def element_for_id(order_id)
      #super(@column, order_id)
    #end

    def contacts_sort_ascending
      sort_order(@column, :sort_ascending)
    end

    def contacts_sort_descending
      sort_order(@column, :sort_descending)
    end
  end

  def contacts_body
  xpath = '//div[starts-with(@id, "contactsGrid-")][contains(@id, "-normal-body")]'
  klass = Class.new(SdcPage) do
    page_object(:body) { { xpath: xpath } }
  end
  klass.new.body
end
  module_function :contacts_body

   def contacts_grid_column(column)
    contacts_body.wait_until_present(timeout: 15)

    unless ContactsGridColumnBase.contacts_column_names.keys.include? column
      raise ArgumentError, "Invalid grid column: #{column}"
    end

    case column
    when :checkbox
      SdcContactsGridCheckBox.new
    else
      SdcContactsGridColumn.new(column)
    end
  end
  module_function :contacts_grid_column

end
