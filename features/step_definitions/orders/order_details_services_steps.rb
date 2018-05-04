
Then /^[Ss]et [Oo]rder [Dd]etails [Ss]ervice to (.*)$/ do |str|
  step 'expect Order Details is present'
  TestData.hash[:service] = str
  if SdcEnv.new_framework
    service = SdcOrders.order_details.service
    service.selection(str)
    service.drop_down.click unless service.selection_obj.present?
    service.selection_obj.click unless service.selection_obj.class_disabled?
    expect('expect Order Details service is correct')

    service.cost.text_value.dollar_amount_str.to_f.round(2) > 0

  else
    TestData.hash[:service] = stamps.orders.order_details.service.select(str).parse_service_name
    expect(TestData.hash[:service]).to eql(str)
    20.times do
      step 'blur out on Order Details form'
      sleep(0.015)
      break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
    end
  end
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |str|
  service = str || TestData.hash[:service]
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.service.text_field.text_value).to include(service)
  else
    expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((service.nil?) ? TestData.hash[:service] : service)
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]ervice to (.*)$/ do |str|
  step 'expect Order Details is present'
  TestData.hash[:int_service] = stamps.orders.order_details.service.select(str).parse_service_name
  20.times do
    step 'blur out on Order Details form'
    sleep(0.015)
    break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
  end
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nternational [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step 'expect Order Details is present'
  expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((expectation.nil?) ? TestData.hash[:int_service] : expectation)
end
