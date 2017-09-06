
Then /^[Ss]et [Oo]rder [Dd]etails form service to (.*)$/ do |service|
  step "expect order details form is present"
  stamps.orders.order_details.service.select(service)
  50.times do
    step "blur out on Order Details form"
    sleep(0.015)
    break if stamps.orders.order_details.service.cost > 0
  end
  step "Save Order Details data"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step "expect order details form is present"
  if expectation.nil?
    expect(stamps.orders.order_details.service.textbox.text).to eql(test_param[:service])
  elsif expectation.downcase.include?('empty string')
    expect(stamps.orders.order_details.service.textbox.text).to eql("")
  else
    expect(stamps.orders.order_details.service.textbox.text).to include(expectation)
  end
end
