
Then /^(?:O|o)n Order Details form, expect Total label is (.*)$/ do |expectation|
  15.times do
    break if stamps.orders.order_details.footer.label.text == expectation
  end
  expect(stamps.orders.order_details.footer.label.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Ship Cost Total is correct$/ do
  test_parameter[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost
  test_parameter[:service_cost] = stamps.orders.order_details.service.cost
  test_parameter[:tracking_cost] = stamps.orders.order_details.tracking.cost
  test_parameter[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
  expect(test_parameter[:total_ship_cost].to_f.round(2)).to eql (test_parameter[:service_cost].to_f + test_parameter[:insure_for_cost].to_f + test_parameter[:tracking_cost].to_f).round(2)
end

Then /^(?:O|o)n Order Details form, expect Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  test_parameter[:total_ship_cost] = stamps.orders.order_details.footer.multiple_order_cost
  expect(test_parameter[:total_ship_cost]).to eql expectation
end

Then /^Expect Ship Cost equals Total amount$/ do
  10.times {
    begin
      break if stamps.orders.orders_grid.column.ship_cost.data(test_parameter[:order_id]).eql?(stamps.orders.order_details.footer.total_ship_cost)
    rescue
      #ignore
    end
  }
  expect(stamps.orders.orders_grid.column.ship_cost.data(test_parameter[:order_id])).to eql(stamps.orders.order_details.footer.total_ship_cost)
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  if @printing_error
    expect(stamps.navigation_bar.balance.amount.to_f).to eql test_parameter[:old_balance].to_f
  else
    expect((stamps.navigation_bar.balance.amount.to_f + expected.to_f)).to eql test_parameter[:old_balance].to_f
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  if @printing_error.length > 0
    expect(stamps.navigation_bar.balance.amount.to_f).to eql test_parameter[:old_balance].to_f
  else
    expect(test_parameter[:total_ship_cost].to_f.round(2)).to eql (test_parameter[:service_cost].to_f + test_parameter[:insure_for_cost].to_f + test_parameter[:tracking_cost].to_f).round(2)
    expect(stamps.navigation_bar.balance.new_balance(test_parameter[:old_balance]).to_f.round(2)).to eql (test_parameter[:old_balance].to_f - (test_parameter[:service_cost].to_f + test_parameter[:tracking_cost].to_f)).round(2)
  end
end

Then /^(?:I|i)n Print modal, expect Total Cost is \$([0-9.]*)$/ do |expectation|
  begin
    print_window = stamps.orders.toolbar.print_btn.print_modal
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