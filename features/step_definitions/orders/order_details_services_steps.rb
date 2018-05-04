
Then /^[Ss]et [Oo]rder [Dd]etails [Ss]ervice to (.*)$/ do |str|
  step 'expect Order Details is present'
  if SdcEnv.new_framework
    service = SdcOrders.order_details.service
    service.selection(str)
    service.drop_down.click unless service.selection_obj.present?
    service.selection_obj.click unless service.selection_obj.class_disabled?


    5.times do

      if service.text_field.text_value && service.text_field.text_value.include?(str)
        TestData.hash[:service] = service.text_field.text_value.parse_service_name
        break
      end
      TestData.hash[:service] ||= ''
    end
    expect(TestData.hash[:service]).to eql(str)
    20.times do
      step 'blur out on Order Details form'
      sleep(0.015)
      break if service.cost.text_value.dollar_amount_str.to_f.round(2) > 0
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

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |str|
  step 'expect Order Details is present'
  str = '' if str.eql?('an empty string')
  if SdcEnv.new_framework
    expect()
  else
    expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((str.nil?) ? TestData.hash[:service] : str)
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
