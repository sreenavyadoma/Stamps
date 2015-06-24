When /^Add a new order$/ do
  log "Add a new order"
  batch.add
  batch.grid.edit_order Batch.order_id
end

When /^Print Sample on (.*)$/ do |printer|
  expect{batch.print(printer).print_sample}.to raise_error(PrintingError)
end

When /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  expect{batch.print(printer).print_sample}.to raise_error(PrintingError)
end

When /^Print Sample$/ do
  expect{batch.print.print_sample}.to raise_error(PrintingError)
end

When /^Print Sample raises a PrintingError/ do
  expect{batch.print.print_sample}.to raise_error(PrintingError)
end
