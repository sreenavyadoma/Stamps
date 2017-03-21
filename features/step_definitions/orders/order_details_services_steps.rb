
Then /^(?:S|s)et Order Details form service to (.*)$/ do |service|
  stamps.orders.order_details.service.select(service)
  15.times do
    step "On Order Details form, blur out"
    break if stamps.orders.order_details.service.cost > 0
    step "On Order Details form, blur out"
  end
  step "Save Order Details data"
end

Then /^(?:E|e)xpect Order Details form service is (.*)$/ do |expectation|
  if expectation.nil?
    selection_substr = ""
  else
    sel_arr = expectation.split(/\s+/)
    selection_substr = (sel_arr.size>=2?"#{sel_arr[0]} #{sel_arr[1]}":"#{sel_arr[0]}")
  end
  10.times do
    break if stamps.orders.order_details.service.text_box.text.include? selection_substr
  end
  expect(stamps.orders.order_details.service.text_box.text).to include(selection_substr)
end
