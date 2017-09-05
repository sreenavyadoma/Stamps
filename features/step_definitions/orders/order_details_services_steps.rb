
Then /^[Ss]et [Oo]rder [Dd]etails form service to (.*)$/ do |service|
  stamps.orders.order_details.service.select(service)
  50.times do
    step "blur out on Order Details form"
    sleep(0.015)
    break if stamps.orders.order_details.service.cost > 0
  end
  step "Save Order Details data"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form service is (?:an empty string|(.*))$/ do |expectation|
  if expectation.nil?
    selection_substr = ""
  else
    sel_arr = expectation.split(/\s+/)
    selection_substr = (sel_arr.size>=2?"#{sel_arr[0]} #{sel_arr[1]}":"#{sel_arr[0]}")
  end
  10.times do
    break if stamps.orders.order_details.service.textbox.text.include? selection_substr
  end
  expect(stamps.orders.order_details.service.textbox.text).to include(selection_substr)
end
