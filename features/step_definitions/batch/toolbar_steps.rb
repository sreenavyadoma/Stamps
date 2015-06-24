When /^Add a new order$/ do
  log "Add a new order"
  batch.add
  batch.grid.edit_order Batch.order_id
end

When /^Print Sample on (.*)$/ do |printer|
  batch.print(printer).print_sample
end
