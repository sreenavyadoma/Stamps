When /^Add a new order$/ do
  log "Add a new order"
  batch.toolbar.add
  batch.grid.edit_order Batch.order_id
end

When /^Click toolbar Print button$/ do
  batch.toolbar.print
end