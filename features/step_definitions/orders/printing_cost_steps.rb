Then /^Save Shipping Costs Data$/ do
  logger.step "Save Shipping Costs Data"
  @service_cost = web_apps.orders.details.service.cost
  @insurance_cost = web_apps.orders.details.insure_for.cost
  @tracking_cost = web_apps.orders.details.tracking.cost
  @total_amount = web_apps.orders.details.footer.total_ship_cost
  @old_balance = web_apps.navigation_bar.balance.amount

  @details_form_data[:total_ship_cost] = @tracking_cost
  @details_form_data[:insure_for_cost] = @service_cost
  @details_form_data[:tracking_cost] = @tracking_cost
  @details_form_data[:insure_for_cost] = @insurance_cost
end

Then /^Details: Expect Total label to be (.*)$/ do |expectation|
  logger.step "Details: Expect Total Ship Cost exist and is in Bold letters"
  15.times do
    actual_value = web_apps.orders.details.footer.label.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.footer.label.text
  logger.step "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship Cost Total is correct$/ do
  logger.step "Details: Expect Ship Cost Total is correct"
  @total_amount = web_apps.orders.details.footer.total_ship_cost
  @service_cost = web_apps.orders.details.service.cost
  @tracking_cost = web_apps.orders.details.tracking.cost
  @insurance_cost = web_apps.orders.details.insure_for.cost
  total_amount_correct = @total_amount.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
  logger.step "Total Amount:  #{(total_amount_correct)?'Passed':'Failed'}.  #{@total_amount} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
  @total_amount.to_f.round(2).should eql (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
end

Then /^Details: Expect Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Details: Expect Ship Cost Total is $#{expectation}"
  @total_amount = web_apps.orders.details.footer.multiple_order_cost
  total_amount_correct = @total_amount == expectation
  logger.step "Total Amount:  #{(total_amount_correct)?'Passed':'Failed'}.  #{@total_amount} == #{expectation}"
  @total_amount.should eql expectation
end

Then /^Expect Ship Cost equals Total amount$/ do
  logger.step "Expect Ship Cost equals Total amount"
  total_amount = web_apps.orders.details.footer.total_ship_cost
  ship_cost = web_apps.orders.grid.ship_cost.data @order_id
  10.times {
    begin
      sleep 1
      break if ship_cost.eql? total_amount
      total_amount = web_apps.orders.details.footer.total_ship_cost
      ship_cost = web_apps.orders.grid.ship_cost.data @order_id
    rescue
      #ignore
    end
  }
  logger.step "Test #{(ship_cost==total_amount)?"Passed":"Failed"}"
  ship_cost.should eql total_amount
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  logger.step "Expect \$#{expected} is deducted from customer balance if printing is successful"
  logger.step "Old Balance: #{@old_balance}"
  if @printing_error
    @new_balance = web_apps.navigation_bar.balance.amount
    test_result = @old_balance.to_f == @new_balance.to_f
    logger.step "Printing error detected."
    logger.step "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  else
    @new_balance = web_apps.navigation_bar.balance.amount
    test_result = @old_balance.to_f == @new_balance.to_f + expected.to_f
    logger.step "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  logger.step "NavBar: Expect Customer Balance is deducted the Printing Cost"
  logger.step "Printing Error:  #{@printing_error}"
  logger.step "Old Balance: #{@old_balance}"
  if @printing_error.length > 0
    @new_balance = web_apps.navigation_bar.balance.amount
    balance_deduction = @old_balance.to_f == @new_balance.to_f
    logger.step "Printing error detected."
    logger.step "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(balance_deduction)?"Passed":"Failed"}"
    balance_deduction.should be true
  else
    @new_balance = web_apps.navigation_bar.balance.new_balance(@old_balance)
    postage_total_calculation = @total_amount.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
    logger.step "Mail total Calculation:  #{(postage_total_calculation)?'Passed':'Failed'}.  #{@total_amount} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
    postage_total_calculation.should be true
    new = @new_balance.to_f.round(2)
    calculated = (@old_balance.to_f - (@service_cost.to_f + @tracking_cost.to_f)).round(2)
    balance_deduction = new == calculated
    logger.step "Customer Balance:  #{(balance_deduction)?'Passed':'Failed'}.  (New Balance)#{@new_balance} == (Old balance) #{@old_balance} - ((Service) #{@service_cost} + (Tracking) #{@tracking_cost})"
    balance_deduction.should be true
  end
end

Then /^Print: Expect Total Cost to be \$([0-9.]*)$/ do |expectation|
  logger.step "Print: Expect Total Cost to be #{expectation}"
  begin
    print_window = web_apps.orders.toolbar.print_btn.print_modal
    actual_value = print_window.total_cost
    10.times { |counter|
      #log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    actual_value.should eql expectation
  end unless expectation.length == 0
end