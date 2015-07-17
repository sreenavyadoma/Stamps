When /^Add new order$/ do
  log "Add new order"
  first_row_order_id = batch.grid.order_id 1
  5.times{
    @order_id = batch.toolbar.add
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id
  }
  batch.grid.edit_order @order_id
end


