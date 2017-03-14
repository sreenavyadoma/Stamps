# encoding: utf-8

Then /^set Stamps Serial Number to (.*)$/ do |str|
  if str.include?('random')
    case str
      when /A/
        serial = "A#{Random.rand(10000..99999)}"
      when /B/
        serial = "B#{Random.rand(10000..99999)}"
      when /C/
        serial = "c#{Random.rand(10000..99999)}"
      when /D/
        serial = "D#{Random.rand(10000..99999)}"
      when /K/
        serial = "K#{Random.rand(10000..99999)}"
      when /L/
        serial = "L#{Random.rand(10000..99999)}"
      when /ML/
        serial = "ML#{Random.rand(10000..99999)}"
      when /P/
        serial = "P#{Random.rand(10000..99999)}"
      when /R/
        serial = "R#{Random.rand(10000..99999)}"
      when /S/
        serial = "S#{Random.rand(10000..99999)}"
      when /V/
        serial = "V#{Random.rand(10000..99999)}"
      when /WN/
        serial = "WN#{Random.rand(10000..99999)}"
      else
        #do nothing
    end
  else
    serial = str
  end
  expect(['a', 'b', 'c', 'd', 'k', 'l', 'ml', 'p', 'r', 's', 'v', 'wn']).to include(serial.downcase[0])
  stamps.mail.print_form.serial_number.set(serial)
end

Then /^show Advanced Options$/ do
  stamps.mail.print_form.advanced_options.show
end

Then /^hide Advanced Options$/ do
  stamps.mail.print_form.advanced_options.hide
end

Then /^select Stamps Specify Postage Amount$/ do
  step "show Advanced Options"
  stamps.mail.print_form.advanced_options.specify_postage_amount.select
end

Then /^(?:E|e)xpect Stamps Specify Postage Amount is selected$/ do
  step "show Advanced Options"
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount.selected?).to be(true)
end

Then /^select Stamps Calculate Postage Amount$/ do
  step "show Advanced Options"
  stamps.mail.print_form.advanced_options.calculate_postage_amount.select
end

Then /^(?:E|e)xpect Stamps Calculate Postage Amount is selected$/ do
  step "show Advanced Options"
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount.selected?).to be(true)
end

Then /^set Stamps Reference Number to (.*)$/ do |str|
  test_parameter[:reference_number] = str
  step "show Advanced Options"
  stamps.mail.print_form.advanced_options.reference_number.set(test_parameter[:reference_number])
end

Then /^set Stamps Amount to (\d*.?\d+)$/ do |value|
  test_parameter[:stamp_amount] = value
  stamps.mail.print_form.stamp_amount.set(test_parameter[:stamp_amount])
end

Then /^set Stamps Quantity to (\d+)$/ do |value|
  test_parameter[:quantity] = value
  stamps.mail.print_form.quantity.set(test_parameter[:quantity])
end






Then /^Mail Stamps: Set Print All to Checked$/ do
  stamps.mail.netstamps.form_view.print_all.check # todo rework
end

Then /^Mail Stamps: Set Print All to Unchecked$/ do
  stamps.mail.netstamps.form_view.print_all.uncheck # todo rework
end

Then /^Mail Stamps: Set Cost Code to (.*)$/ do |code|
  stamps.mail.netstamps.form_view.cost_code.select(code) # todo rework
end






Then /^(?:E|e)xpect Label form Domestic Address field displays (.*)$/ do |value|
  20.times do
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    break if (stamps.mail.print_form.mail_to.address.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ") == value
  end
  expect((stamps.mail.print_form.mail_to.address.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
  logger.step 'Address Cleansed -- Expected Result Confirmed'
end



