Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.single_order.pounds_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.single_order.ounces_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Service Cost to be greater than \$([0-9.]+)$/ do |expected|
  actual = batch.single_order.service_cost
  10.times { |counter|
    log_expectation "#{counter}. Single Order Form Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.single_order.service_cost
  }
  actual.to_f.should be >= expected.to_f
end

Then /^Expect inline Service Cost for ([a-zA-Z -\/]+) to be greater than \$([0-9.]+)$/ do |service, expected|
  actual = batch.single_order.service = service
  10.times { |counter|
    log_expectation "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.single_order.service = service
  }
  actual.to_f.should be >= expected.to_f
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  batch.single_order.partial_address.should be_exact_address_not_found
end

Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  actual = batch.single_order.service_cost
  begin
    10.times { |counter|
      log_expectation_eql "#{counter}. Service Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order.service_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.single_order.tracking_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order.tracking_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Verify Single Order Form Total Amount$/ do
  batch.single_order.total_amount_calculation.should be_correct
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.single_order.insurance_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Insurance Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order.insurance_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Service to be (.*)$/ do |expected|
  begin
    actual = batch.single_order.service
    10.times { |counter|
      included = actual.include? expected
      break if included
      actual = batch.single_order.service
    }
    expect(actual.include? expected).to be true
  end unless expected.length == 0
end

Then /^Expect Tracking to be ([\w\s]*)$/ do |expected|
  begin
    actual = batch.single_order.tracking
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Selected", expected, actual
      break if actual.eql? expected
      actual = batch.single_order.tracking
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Total to be \$(.*)$/ do |expected|
  begin
    actual = batch.single_order.total
    10.times { |counter|
      log_expectation_eql "#{counter}. Total Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order.total
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expected|
  batch.multi_order.order_count.should eql expected
end



