module Batch
  class Column < BatchObject



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
    def address
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

    def click_sort_option sort_order

      ascending_array = @browser.spans(:text => "Sort Ascending")
      descending_array = @browser.spans(:text => "Sort Descending")

      if sort_order.eql? "ascending"
        ascending_array.each_with_index do |name, index|
          if name.visible?
            browser_helper.click ascending_array[index]
          end
        end

      elsif sort_order.eql? "descending"
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

  end



  class OrderId < Column
    def sort_order order

      id = get_header_id "Order ID"
      log "Sorting Order ID in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order ID for #{order} sort order"
      batch.grid.check_sorted_column("Order ID", order)
    end
  end

  class Age < Column
    def sort_order order

      id = get_header_id "Age"
      log "Sorting Age in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Age for #{order} sort order"
      batch.grid.check_sorted_column("Age", order)
    end
  end

  class OrderDate < Column
    def sort_order order

      id = get_header_id "Order Date"
      log "Sorting Order Date in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order Date for #{order} sort order"
      batch.grid.check_sorted_column("Order Date", order)
    end
  end

  class Recipient < Column
    def sort_order order

      id = get_header_id "Recipient"
      log "Sorting Recipient in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Recipient for #{order} sort order"
      batch.grid.check_sorted_column('Recipient', order)
    end
  end

  class Company < Column
    def sort_order order

      id = get_header_id "Company"
      log "Sorting Company in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Company for #{order} sort order"
      batch.grid.check_sorted_column('Company', order)
    end
  end

  class Address < Column
    def sort_order order

      id = get_header_id "Address"
      log "Sorting Address in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Address for #{order} sort order"
      batch.grid.check_sorted_column('Address', order)
    end
  end

  class City < Column
    def sort_order order

      id = get_header_id "City"
      log "Sorting City in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking City for #{order} sort order"
      batch.grid.check_sorted_column('City', order)
    end
  end

  class State < Column
    def sort_order order

      id = get_header_id "State"
      log "Sorting State in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking State for #{order} sort order"
      batch.grid.check_sorted_column('State', order)
    end
  end

  class Zip < Column
    def sort_order order

      id = get_header_id "Zip"
      log "Sorting Zip in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Zip for #{order} sort order"
      batch.grid.check_sorted_column('Zip', order)
    end
  end

  class Phone < Column
    def sort_order order

      id = get_header_id "Phone"
      log "Sorting Phone in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Phone for #{order} sort order"
      batch.grid.check_sorted_column('Phone', order)
    end
  end

  class Email < Column
    def sort_order order

      id = get_header_id "Email"
      log "Sorting Email in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Email for #{order} sort order"
      batch.grid.check_sorted_column('Email', order)
    end
  end

  class Qty < Column
    def sort_order order

      id = get_header_id "Qty."
      log "Sorting Qty in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Qty for #{order} sort order"
      batch.grid.check_sorted_column('Qty.', order)
    end
  end

  class ItemSKU < Column
    def sort_order order

      id = get_header_id "Item SKU"
      log "Sorting Item SKU in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Item SKU for #{order} sort order"
      batch.grid.check_sorted_column('Item SKU', order)
    end
  end

  class ItemName < Column
    def sort_order order

      id = get_header_id "Item Name"
      log "Sorting Item Name in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Item Name for #{order} sort order"
      batch.grid.check_sorted_column('Item Name', order)
    end
  end

  class Weight < Column
    def sort_order order

      id = get_header_id "Weight"
      log "Sorting Weight in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Weight for #{order} sort order"
      batch.grid.check_sorted_column('Weight', order)
    end
  end

  class InsuredValue < Column
    def sort_order order

      id = get_header_id "Insured Value"
      log "Sorting Insured Value in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Insured Value for #{order} sort order"
      batch.grid.check_sorted_column('Insured Value', order)
    end
  end

  class OrderStatus < Column
    def sort_order order

      id = get_header_id "Order Status"
      log "Sorting Order Status in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order Status for #{order} sort order"
      batch.grid.check_sorted_column('Order Status', order)
    end
  end

  class OrderTotal < Column
    def sort_order order

      id = get_header_id "Order Total"
      log "Sorting Order Total in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Order Total for #{order} sort order"
      batch.grid.check_sorted_column('Order Total', order)
    end
  end

  class Country < Column
    def sort_order order

      id = get_header_id "Country"
      log "Sorting Country in #{order} order"
      click_sort_drop_down id
      click_sort_option order
      log "Checking Country for #{order} sort order"
      batch.grid.check_sorted_column('Country', order)
    end
  end

end