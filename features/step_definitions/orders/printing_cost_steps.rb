
Then /^Details: Expect Total label is (.*)$/ do |expectation|
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
  @details_form_data[:total_ship_cost] = web_apps.orders.details.footer.total_ship_cost
  @details_form_data[:service_cost] = web_apps.orders.details.service.cost
  @details_form_data[:tracking_cost] = web_apps.orders.details.tracking.cost
  @details_form_data[:insure_for_cost] = web_apps.orders.details.insure_for.cost
  total_amount_correct = @details_form_data[:total_ship_cost].to_f.round(2) == (@details_form_data[:service_cost].to_f + @details_form_data[:insure_for_cost].to_f + @details_form_data[:tracking_cost].to_f).round(2)
  logger.step "Total Amount:  #{(total_amount_correct)?'Passed':'Failed'}.  #{@details_form_data[:total_ship_cost]} == #{@details_form_data[:service_cost]} + #{@details_form_data[:insure_for_cost]} + #{@details_form_data[:tracking_cost]}"
  @details_form_data[:total_ship_cost].to_f.round(2).should eql (@details_form_data[:service_cost].to_f + @details_form_data[:insure_for_cost].to_f + @details_form_data[:tracking_cost].to_f).round(2)
end

Then /^Details: Expect Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Details: Expect Ship Cost Total is $#{expectation}"
  @details_form_data[:total_ship_cost] = web_apps.orders.details.footer.multiple_order_cost
  total_amount_correct = @details_form_data[:total_ship_cost] == expectation
  logger.step "Total Amount:  #{(total_amount_correct)?'Passed':'Failed'}.  #{@details_form_data[:total_ship_cost]} == #{expectation}"
  @details_form_data[:total_ship_cost].should eql expectation
end

Then /^Expect Ship Cost equals Total amount$/ do
  logger.step "Expect Ship Cost equals Total amount"
  total_amount = web_apps.orders.details.footer.total_ship_cost
  ship_cost = web_apps.orders.grid.ship_cost.data @details_form_data[:order_id]
  10.times {
    begin
      sleep 1
      break if ship_cost.eql? total_amount
      total_amount = web_apps.orders.details.footer.total_ship_cost
      ship_cost = web_apps.orders.grid.ship_cost.data @details_form_data[:order_id]
    rescue
      #ignore
    end
  }
  logger.step "Test #{(ship_cost==total_amount)?"Passed":"Failed"}"
  ship_cost.should eql total_amount
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  logger.step "Expect \$#{expected} is deducted from customer balance if printing is successful"
  logger.step "Old Balance: #{@details_form_data[:old_balance]}"
  if @printing_error
    @new_balance = web_apps.navigation_bar.balance.amount
    test_result = @details_form_data[:old_balance].to_f == @new_balance.to_f
    logger.step "Printing error detected."
    logger.step "Account balance should be the same.  Old balance: #{@details_form_data[:old_balance]}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).is true
  else
    @new_balance = web_apps.navigation_bar.balance.amount
    test_result = @details_form_data[:old_balance].to_f == @new_balance.to_f + expected.to_f
    logger.step "Account balance should be the same.  Old balance: #{@details_form_data[:old_balance]}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).is true
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  logger.step "NavBar: Expect Customer Balance is deducted the Printing Cost"
  logger.step "Printing Error:  #{@printing_error}"
  logger.step "Old Balance: #{@details_form_data[:old_balance]}"
  if @printing_error.length > 0
    @new_balance = web_apps.navigation_bar.balance.amount
    balance_deduction = @details_form_data[:old_balance].to_f == @new_balance.to_f
    logger.step "Printing error detected."
    logger.step "Account balance should be the same.  Old balance: #{@details_form_data[:old_balance]}, New balance: #{@new_balance} ##{(balance_deduction)?"Passed":"Failed"}"
    balance_deduction.should be true
  else
    @new_balance = web_apps.navigation_bar.balance.new_balance(@details_form_data[:old_balance])
    postage_total_calculation = @details_form_data[:total_ship_cost].to_f.round(2) == (@details_form_data[:service_cost].to_f + @details_form_data[:insure_for_cost].to_f + @details_form_data[:tracking_cost].to_f).round(2)
    logger.step "Mail total Calculation:  #{(postage_total_calculation)?'Passed':'Failed'}.  #{@details_form_data[:total_ship_cost]} == #{@details_form_data[:service_cost]} + #{@details_form_data[:insure_for_cost]} + #{@details_form_data[:tracking_cost]}"
    postage_total_calculation.should be true
    new = @new_balance.to_f.round(2)
    calculated = (@details_form_data[:old_balance].to_f - (@details_form_data[:service_cost].to_f + @details_form_data[:tracking_cost].to_f)).round(2)
    balance_deduction = new == calculated
    logger.step "Customer Balance:  #{(balance_deduction)?'Passed':'Failed'}.  (New Balance)#{@new_balance} == (Old balance) #{@details_form_data[:old_balance]} - ((Service) #{@details_form_data[:service_cost]} + (Tracking) #{@details_form_data[:tracking_cost]})"
    balance_deduction.should be true
  end
end

Then /^Print: Expect Total Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Print: Expect Total Cost is #{expectation}"
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