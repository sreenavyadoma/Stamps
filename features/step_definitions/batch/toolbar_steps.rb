When /^Add new order$/ do
  log "Add new order"
  @old_balance = batch.navigation_bar.balance
  batch.toolbar.add
  batch.grid.edit_order Batch.order_id
end


