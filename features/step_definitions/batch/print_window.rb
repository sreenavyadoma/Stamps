When /^Print on (.*)$/ do |printer|
  batch.toolbar.print(printer).print
end

When /^Print$/ do
  step "Open Print Window"
  @print_window.print
  log "Printing Error:  #{@printing_error}"
end

When /^Open Print Window$/ do
  log "Open Print Window"
  @service_cost = batch.single_order.service_cost
  @insurance_cost = batch.single_order.insurance_cost
  @tracking_cost = batch.single_order.tracking_cost
  @postage_total = batch.single_order.total
  @old_balance = batch.navigation_bar.balance
  @print_window = batch.toolbar.print_window
end

Then /^Expect Printing cost is deducted from customer balance$/ do
  log_param "Old Balance", @old_balance
  if @printing_error
    @new_balance = batch.navigation_bar.balance
    balance_deduction = @old_balance.to_f == @new_balance.to_f
    log "Printing error detected."
    log "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(balance_deduction)?"Passed":"Failed"}"
    expect(balance_deduction).to be true
  else
    @new_balance = batch.navigation_bar.wait_until_balance_updated(@old_balance).balance
    postage_total_calculation = @postage_total.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
    log "Postage total Calculation:  #{(postage_total_calculation)?'Passed':'Failed'}.  #{@postage_total} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
    expect(postage_total_calculation).to be true
    balance_deduction = @new_balance.to_f.round(2) == (@old_balance.to_f - @service_cost.to_f + @tracking_cost.to_f).round(2)
    log "Customer Balance:  #{(balance_deduction)?'Passed':'Failed'}.  (New Balance)#{@new_balance} == (Old balance) #{@old_balance} - ((Service) #{@service_cost} + (Tracking) #{@tracking_cost})"
   expect(balance_deduction).to be true
  end
end

Then /^Close Print Window$/ do
  (@print_window.close if @print_window.present?) unless @print_window.nil?
end

Then /^Print expecting invalid address error$/ do
  error_window = batch.toolbar.print_expecting_invalid_address
  error_window.OK
end

Then /^Print expecting indicium error$/ do
  error_window = batch.toolbar.print_expecting_indicium_error
  actual_error_message = error_window.error_message
  error_window.OK
  expect(actual_error_message.include? 'createLabelIndicium Error').to be true
end

When /^Print expecting rating error$/ do
  error_window = batch.toolbar.print.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.OK
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end

When /^Print expecting some orders can not be printed$/ do
  error_window = batch.toolbar.print_expecting_errors
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Expect Print Window label to be "You have (\d+) labels ready to print"$/ do |expectation|
  log "Expect Print Window label to be \"You have #{expectation} labels ready to print\""
  print_window = batch.toolbar.print
  actual = print_window.labels_ready_to_print
  print_window.close
  actual.should eql expectation
end

Then /^Expect Print Window Total Cost to be \$([0-9.]*)$/ do |expectation|
  begin
    print_window = batch.toolbar.print
    actual_value = print_window.total_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    actual_value.should eql expectation
  end unless expectation.length == 0
end

Then /^Print raises a Printing Error/ do
  expect{batch.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample on (.*)$/ do |printer|
  batch.toolbar.print(printer).print_sample
end

Then /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  expect{batch.toolbar.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample$/ do
  batch.toolbar.print.print_sample
end

Then /^Print Sample raises a Printing Error/ do
  expect{batch.toolbar.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end

Then /^Print Postage$/ do

end



