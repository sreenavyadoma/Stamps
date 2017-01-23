
Then /^Order Details: Expect Total label is (.*)$/ do |expectation|
  logger.step "Order Details: Expect Total Ship Cost exist and is in Bold letters"
  15.times do
    break if stamps.orders.order_details.footer.label.text == expectation
  end
  stamps.orders.order_details.footer.label.text.should eql expectation
end

Then /^Order Details: Expect Ship Cost Total is correct$/ do
  logger.step "Order Details: Expect Ship Cost Total is correct"
  test_data[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost
  test_data[:service_cost] = stamps.orders.order_details.service.cost
  test_data[:tracking_cost] = stamps.orders.order_details.tracking.cost
  test_data[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
  test_data[:total_ship_cost].to_f.round(2).should eql (test_data[:service_cost].to_f + test_data[:insure_for_cost].to_f + test_data[:tracking_cost].to_f).round(2)
end

Then /^Order Details: Expect Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Order Details: Expect Ship Cost Total is $#{expectation}"
  test_data[:total_ship_cost] = stamps.orders.order_details.footer.multiple_order_cost
  test_data[:total_ship_cost].should eql expectation
end

Then /^Expect Ship Cost equals Total amount$/ do
  logger.step "Expect Ship Cost equals Total amount"
  10.times {
    begin
      break if stamps.orders.orders_grid.column.ship_cost.data(test_data[:order_id]).eql? stamps.orders.order_details.footer.total_ship_cost
    rescue
      #ignore
    end
  }
  stamps.orders.orders_grid.column.ship_cost.data(test_data[:order_id]).should eql stamps.orders.order_details.footer.total_ship_cost
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  logger.step "Expect \$#{expected} is deducted from customer balance if printing is successful"
  logger.step "Old Balance: #{test_data[:old_balance]}"
  if @printing_error
    stamps.navigation_bar.balance.amount.to_f.should eql test_data[:old_balance].to_f
  else
    (stamps.navigation_bar.balance.amount.to_f + expected.to_f).should eql test_data[:old_balance].to_f
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  logger.step "NavBar: Expect Customer Balance is deducted the Printing Cost"
  logger.step "Printing Error:  #{@printing_error}"
  logger.step "Old Balance: #{test_data[:old_balance]}"
  if @printing_error.length > 0
    stamps.navigation_bar.balance.amount.to_f.should eql test_data[:old_balance].to_f
  else
    test_data[:total_ship_cost].to_f.round(2).should eql (test_data[:service_cost].to_f + test_data[:insure_for_cost].to_f + test_data[:tracking_cost].to_f).round(2)
    stamps.navigation_bar.balance.new_balance(test_data[:old_balance]).to_f.round(2).should eql (test_data[:old_balance].to_f - (test_data[:service_cost].to_f + test_data[:tracking_cost].to_f)).round(2)
  end
end

Then /^Print Modal: Expect Total Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Print Modal: Expect Total Cost is #{expectation}"
  begin
    print_window = stamps.orders.toolbar.print_btn.print_modal
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