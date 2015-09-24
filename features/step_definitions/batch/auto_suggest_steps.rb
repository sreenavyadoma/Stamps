Then /^Expect Auto Suggest name shows (.*) for entry (.*)$/ do |value, entry|
  actual =  batch.single_order_form.get_auto_suggest_name entry
  log_expectation_eql "Auto Suggest Name", value, actual
  actual.should eql value

end

Then /^Expect Auto Suggest location shows (.*) for entry (.*)$/ do |value, entry|
  actual =  batch.single_order_form.get_auto_suggest_location entry
  log_expectation_eql "Auto Suggest Name", value, actual
  actual.should eql value

end

Then /^Select entry (.*)$/ do |entry|
  batch.single_order_form.click_auto_suggest_name entry
end

Then /^Expect Domestic Address field displays (.*)$/ do |value|
  5.times{
  begin
    actual =  batch.single_order_form.get_address_text
    actual_stripped = actual.gsub(/\n/,", ")
    break if actual_stripped == value
    sleep 2
  end}
  actual =  batch.single_order_form.get_address_text
  actual_stripped = actual.gsub(/\n/,", ")
  log_expectation_eql "Address text", value, actual_stripped
  actual_stripped.should eql value
end

Then /^Expect Domestic Phone field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_phone_text
  log_expectation_eql "Phone text", value, actual
  actual.should eql value
end

Then /^Expect Domestic Email field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Email text", value, actual
  actual.should eql value
end

Then /^Expect International Name field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_phone_text
  log_expectation_eql "Name text", value, actual
  actual.should eql value
end

Then /^Expect International Company field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_phone_text
  log_expectation_eql "Company text", value, actual
  actual.should eql value
end

Then /^Expect International Address 1 field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Address 1 text", value, actual
  actual.should eql value
end

Then /^Expect International Address 2 field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Address 2 text", value, actual
  actual.should eql value
end

Then /^Expect International City field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "City text", value, actual
  actual.should eql value
end

Then /^Expect International Province field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Province text", value, actual
  actual.should eql value
end

Then /^Expect International Postal Code field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Postal Code text", value, actual
  actual.should eql value
end

Then /^Expect International Phone field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Phone text", value, actual
  actual.should eql value
end

Then /^Expect International Email field displays (.*)$/ do |value|
  actual =  batch.single_order_form.get_email_text
  log_expectation_eql "Email text", value, actual
  actual.should eql value
end
