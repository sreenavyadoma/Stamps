When /^Add new order$/ do
  log "Add new order"
  batch.toolbar.add
  batch.grid.edit_order Batch.order_id
end

When /^Print on (.*)$/ do |printer|
  batch.toolbar.print(printer).print.should be_printed
end

When /^Print$/ do
  batch.toolbar.print.print.should be_printed
end

When /^Print raises a Printing Error/ do
  expect{batch.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

When /^Print Sample on (.*)$/ do |printer|
  batch.toolbar.print(printer).print_sample.should be_printed
end

When /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  expect{batch.toolbar.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

When /^Print Sample$/ do
  batch.toolbar.print.print_sample.should be_printed
end

When /^Print Sample raises a Printing Error/ do
  expect{batch.toolbar.print.print_sample_expecting_error}.to raise_error(PrintingError)
end
