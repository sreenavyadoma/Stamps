# encoding: utf-8

Then /^[Ss]et Print form Serial Number to (.*)$/ do |str|
  if str.include?('random')
    case str.upcase
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
        expect(['a', 'b', 'c', 'd', 'k', 'l', 'ml', 'p', 'r', 's', 'v', 'wn']).to include(str.downcase.scan( / (.*) /).last.first)
    end
  else
    serial = str
  end
  stamps.mail.print_form.serial_number.set(serial)
end

Then /^[Ss]et Print form Amount to (\d*.?\d+)$/ do |value|
  test_parameter[:stamp_amount] = value
  stamps.mail.print_form.stamp_amount.set(test_parameter[:stamp_amount])
end

Then /^[Ss]et Print form Quantity to (\d+)$/ do |value|
  test_parameter[:quantity] = value
  stamps.mail.print_form.quantity.set(test_parameter[:quantity])
end

Then /^[Ee]xpect Print form Domestic Address field displays (.*)$/ do |value|
  20.times do
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    break if (stamps.mail.print_form.mail_to.address.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ") == value
  end
  expect((stamps.mail.print_form.mail_to.address.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
  config.logger.step 'Address Cleansed -- Expected Result Confirmed'
end



