When /^Add new order$/ do
  log "Add new order"
  batch.toolbar.add
  batch.grid.edit_order Batch.order_id
end
