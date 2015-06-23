When /^Add a new order$/ do
  log "Add a new order"
  batch.toolbar.add
  batch.grid.edit_order Batch.order_id
end

When /^Print Sample on (.*)$/ do |printer|
  batch.toolbar.print(printer).print_sample
end
