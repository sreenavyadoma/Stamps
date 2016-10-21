
Then /^Details: Expect Total label is (.*)$/ do |expectation|
  logger.step "Details: Expect Total Ship Cost exist and is in Bold letters"
  15.times do
    break if web_apps.orders.details.footer.label.text == expectation
  end
  web_apps.orders.details.footer.label.text.should eql expectation
end

Then /^Details: Expect Ship Cost Total is correct$/ do
  logger.step "Details: Expect Ship Cost Total is correct"
  test_data[:total_ship_cost] = web_apps.orders.details.footer.total_ship_cost
  test_data[:service_cost] = web_apps.orders.details.service.cost
  test_data[:tracking_cost] = web_apps.orders.details.tracking.cost
  test_data[:insure_for_cost] = web_apps.orders.details.insure_for.cost
  test_data[:total_ship_cost].to_f.round(2).should eql (test_data[:service_cost].to_f + test_data[:insure_for_cost].to_f + test_data[:tracking_cost].to_f).round(2)
end

Then /^Details: Expect Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Details: Expect Ship Cost Total is $#{expectation}"
  test_data[:total_ship_cost] = web_apps.orders.details.footer.multiple_order_cost
  test_data[:total_ship_cost].should eql expectation
end

Then /^Expect Ship Cost equals Total amount$/ do
  logger.step "Expect Ship Cost equals Total amount"
  10.times {
    begin
      break if web_apps.orders.grid.ship_cost.data(test_data[:order_id]).eql? web_apps.orders.details.footer.total_ship_cost
    rescue
      #ignore
    end
  }
  web_apps.orders.grid.ship_cost.data(test_data[:order_id]).should eql web_apps.orders.details.footer.total_ship_cost
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  logger.step "Expect \$#{expected} is deducted from customer balance if printing is successful"
  logger.step "Old Balance: #{test_data[:old_balance]}"
  if @printing_error
    web_apps.navigation_bar.balance.amount.to_f.should eql test_data[:old_balance].to_f
  else
    (web_apps.navigation_bar.balance.amount.to_f + expected.to_f).should eql test_data[:old_balance].to_f
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  logger.step "NavBar: Expect Customer Balance is deducted the Printing Cost"
  logger.step "Printing Error:  #{@printing_error}"
  logger.step "Old Balance: #{test_data[:old_balance]}"
  if @printing_error.length > 0
    web_apps.navigation_bar.balance.amount.to_f.should eql test_data[:old_balance].to_f
  else
    test_data[:total_ship_cost].to_f.round(2).should eql (test_data[:service_cost].to_f + test_data[:insure_for_cost].to_f + test_data[:tracking_cost].to_f).round(2)
    web_apps.navigation_bar.balance.new_balance(test_data[:old_balance]).to_f.round(2).should eql (test_data[:old_balance].to_f - (test_data[:service_cost].to_f + test_data[:tracking_cost].to_f)).round(2)
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