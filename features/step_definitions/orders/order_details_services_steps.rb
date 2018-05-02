
Then /^[Ss]et [Oo]rder [Dd]etails [Ss]ervice to (.*)$/ do |str|
  step 'expect Order Details is present'
  if SdcEnv.new_framework
    SdcOrders.order_details.service.selection(str)
    5.times do
      SdcOrders.order_details.service.drop_down.click unless SdcOrders.order_details.service.selection_obj.present?
      SdcOrders.order_details.service.selection_obj.safe_click unless SdcOrders.order_details.service.selection_obj.class_disabled?
      if SdcOrders.order_details.service.text_field.text_value && SdcOrders.order_details.service.text_field.text_value.include?(str)
        TestData.hash[:service] = SdcOrders.order_details.service.text_field.text_value.parse_service_name
        break
      end
      TestData.hash[:service] ||= ''
    end
    expect(TestData.hash[:service]).to eql(str)
    20.times do
      step 'blur out on Order Details form'
      sleep(0.015)
      break if SdcOrders.order_details.service.cost.text_value.dollar_amount_str.to_f.round(2) > 0
    end
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

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step 'expect Order Details is present'
  expectation='' if expectation.eql?('an empty string')
  expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((expectation.nil?) ? TestData.hash[:service] : expectation)
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
