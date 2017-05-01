
Then /^[Ee]xpect Order Details form Total label is (.*)$/ do |expectation|
  15.times do
    break if stamps.orders.order_details.footer.label.text == expectation
  end
  expect(stamps.orders.order_details.footer.label.text).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship Cost Total is correct$/ do
  test_param[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost
  test_param[:service_cost] = stamps.orders.order_details.service.cost
  test_param[:tracking_cost] = stamps.orders.order_details.tracking.cost
  test_param[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
  expect(test_param[:total_ship_cost].to_f.round(2)).to eql (test_param[:service_cost].to_f + test_param[:insure_for_cost].to_f + test_param[:tracking_cost].to_f).round(2)
end

Then /^[Ee]xpect Order Details form Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  test_param[:total_ship_cost] = stamps.orders.order_details.footer.multiple_order_cost
  expect(test_param[:total_ship_cost]).to eql expectation
end

Then /^[Ee]xpect Ship Cost equals Total amount$/ do
  10.times {
    begin
      break if stamps.orders.orders_grid.column.ship_cost.data(test_param[:order_id][0]).eql?(stamps.orders.order_details.footer.total_ship_cost)
    rescue
      #ignore
    end
  }
  expect(stamps.orders.orders_grid.column.ship_cost.data(test_param[:order_id][0])).to eql(stamps.orders.order_details.footer.total_ship_cost)
end

Then /^[Ee]xpect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  if @printing_error
    expect(stamps.navigation_bar.balance.amount.to_f).to eql test_param[:old_balance].to_f
  else
    expect((stamps.navigation_bar.balance.amount.to_f + expected.to_f)).to eql test_param[:old_balance].to_f
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  if @printing_error.length > 0
    expect(stamps.navigation_bar.balance.amount.to_f).to eql test_param[:old_balance].to_f
  else
    expect(test_param[:total_ship_cost].to_f.round(2)).to eql (test_param[:service_cost].to_f + test_param[:insure_for_cost].to_f + test_param[:tracking_cost].to_f).round(2)
    expect(stamps.navigation_bar.balance.new_balance(test_param[:old_balance]).to_f.round(2)).to eql (test_param[:old_balance].to_f - (test_param[:service_cost].to_f + test_param[:tracking_cost].to_f)).round(2)
  end
end

Then /^[Ee]xpect Print modal Total Cost is \$([0-9.]*)$/ do |expectation|
  begin
    print_window = stamps.orders.orders_toolbar.print_btn.print_modal
    actual_value = print_window.total_cost
    10.times { |counter|
      #log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    expect(actual_value).to eql expectation
  end unless expectation.length == 0
end