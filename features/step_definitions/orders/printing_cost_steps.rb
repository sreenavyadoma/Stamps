
Then /^[Ee]xpect [Oo]rder [Dd]etails Total label is (.*)$/ do |expectation|
  15.times do
    break if stamps.orders.order_details.footer.label.text == expectation
  end
  expect(stamps.orders.order_details.footer.label.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship Cost Total is correct$/ do
  calculated_cost = 0
  calculated_cost += stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)
  calculated_cost += stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)
  calculated_cost += stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)
  expect(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2)).to eql (calculated_cost)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Multiple Order Total Cost is \$([0-9.]*)$/ do |expectation|
  TestData.store[:total_ship_cost] = stamps.orders.order_details.footer.multiple_order_cost
  expect(TestData.store[:total_ship_cost]).to eql(expectation)
end

Then /^[Ee]xpect Ship Cost equals Total amount$/ do
  10.times do
    begin
      break if stamps.orders.orders_grid.grid_column(:ship_cost).data(TestData.store[:order_id].values.last).eql?(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2))
    rescue
      # ignore
    end
  end
  expect(stamps.orders.orders_grid.grid_column(:ship_cost).data(TestData.store[:order_id].values.last)).to eql(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2))
end

Then /^[Ee]xpect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  if @printing_error
    expect(stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f).to eql TestData.store[:old_balance].to_f
  else
    expect((stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f + expected.to_f)).to eql TestData.store[:old_balance].to_f
  end
end

Then /^NavBar: Expect Customer Balance is deducted the Printing Cost$/ do
  if @printing_error.length > 0
    expect(stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f).to eql TestData.store[:old_balance].to_f
  else
    expect(TestData.store[:total_ship_cost].to_f.round(2)).to eql (TestData.store[:service_cost].to_f + TestData.store[:insure_for_cost].to_f + TestData.store[:tracking_cost].to_f).round(2)
    expect(stamps.navigation_bar.balance.new_balance(TestData.store[:old_balance]).to_f.round(2)).to eql (TestData.store[:old_balance].to_f - (TestData.store[:service_cost].to_f + TestData.store[:tracking_cost].to_f)).round(2)
  end
end

Then /^[Ee]xpect Print modal Total Cost is \$([0-9.]*)$/ do |expectation|
  begin
    print_window = stamps.orders.orders_toolbar.toolbar_print.click
    actual_value = print_window.total_cost
    10.times { |counter|
      #log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    expect(actual_value).to eql expectation
  end unless expectation.length.zero?
end