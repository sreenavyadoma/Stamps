

When /^Print (.*) new orders with Address set to (.*) and Service set to (.*)$/ do |count,address,service|

  count=count.to_i
  for i in (1..count)

    #ADDING A NEW ORDER
    log "Add order #{i}"
    @old_balance = batch.navigation_bar.balance
    first_row_order_id = batch.grid.order_id 1
    5.times{
      @order_id = batch.toolbar.add
      if first_row_order_id.include? @order_id
        sleep(3)
      end
      break unless first_row_order_id.include? @order_id
    }
    log "Order Id:  #{@order_id}"
    batch.grid.edit_order @order_id

    #SETTING RECIPIENT ADDRESS
    log "Set Ship-To address to \"#{address}\""
    batch.single_order_form.address = log_param "Address", address

    #SETTING SERVICE
    batch.single_order_form.service log_param "Service", service

    #PRINTING
    step "Click Toolbar Print Button"
    @print_window.print
    log "Printing Error:  #{@printing_error}"



  end
end