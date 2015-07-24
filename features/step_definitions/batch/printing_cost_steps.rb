Then /^Save Shipping Costs Data$/ do
  @service_cost = batch.single_order_form.service_cost
  @insurance_cost = batch.single_order_form.insurance_cost
  @tracking_cost = batch.single_order_form.tracking_cost
  @postage_total = batch.single_order_form.total
  @old_balance = batch.navigation_bar.balance
end

Then /^Expect Ship Cost equals Total amount$/ do
  begin
    10.times { |counter|
      actual = batch.grid.ship_cost(@order_id)
      sleep(2)
      log_expectation_eql "#{counter}. Ship Cost", expected, actual
      break if actual.eql? expected
      actual = batch.grid.ship_cost(@order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  log_param "Old Balance", @old_balance
  if @printing_error
    @new_balance = batch.navigation_bar.balance
    test_result = @old_balance.to_f == @new_balance.to_f
    log "Printing error detected."
    log "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  else
    @new_balance = batch.navigation_bar.balance
    test_result = @old_balance.to_f == @new_balance.to_f + expected.to_f
    log "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  end
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