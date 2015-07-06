Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.pounds_max_value
  log_expectation_eql "Maximum Pounds", expected_value, actual_value
  expected_value.should eql actual_value
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.ounces_max_value
  log_expectation_eql "Maximum Pounds", expected_value, actual_value
  expected_value.should eql actual_value
end

Then /^Expect Service Rate to be \$([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.service_price
  log_expectation_eql "Rate", expected_value, actual_value
  expected_value.should eql actual_value
end

Then /^Expect Service Rate to be greater than \$([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.service_price
  log_expectation "Single Order Form Rate", expected_value, actual_value, (actual_value.to_f >= expected_value.to_f)
  actual_value.to_f.should be >= expected_value.to_f
end

Then /^Expect Service in-line rate for ([a-zA-Z -\/]+) to be greater than \$([0-9.]+)$/ do |service, expected_value|
  actual_value = batch.single_order.service service
  log_expectation "#{service} Rate", expected_value, actual_value, (actual_value.to_f >= expected_value.to_f)
  actual_value.to_f.should be >= expected_value.to_f
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  #expect(address_validation_form.exact_address_not_found?).to be true
  batch.single_order.partial_address.should be_exact_address_not_found
  #expect(address_validation_form).to be_exact_address_not_found
end
