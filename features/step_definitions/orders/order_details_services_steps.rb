
Then /^[Ss]et [Oo]rder [Dd]etails [Ff]orm [Ss]ervice to (.*)$/ do |service|
  step "expect order details form is present"
  test_param[:service] = test_helper.parse_service(stamps.orders.single_order_details.service.select(service))
  20.times do
    step "blur out on Order Details form"
    sleep(0.015)
    break if stamps.orders.single_order_details.service.cost > 0
  end
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ff]orm [Ii]nternational [Ss]ervice to (.*)$/ do |service|
  step "expect order details form is present"
  test_param[:int_service] = test_helper.parse_service(stamps.orders.single_order_details.service.select(service))
  20.times do
    step "blur out on Order Details form"
    sleep(0.015)
    break if stamps.orders.single_order_details.service.cost > 0
  end
  step "Save Order Details data"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ff]orm [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step "expect order details form is present"
  expect(test_helper.parse_service(stamps.orders.single_order_details.service.textbox.text)).to eql((expectation.nil?)?test_param[:service]:expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ff]orm [Ii]nternational [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step "expect order details form is present"
  expect(test_helper.parse_service(stamps.orders.single_order_details.service.textbox.text)).to eql((expectation.nil?)?test_param[:int_service]:expectation)
end




