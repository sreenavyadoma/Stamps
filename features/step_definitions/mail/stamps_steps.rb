# encoding: utf-8

Then /^[Ss]et Print form Serial Number to (.*)$/ do |str|
  if str.include?('random')
    case str.upcase
      when /A/
        serial="A#{Random.rand(10000..99999)}"
      when /B/
        serial="B#{Random.rand(10000..99999)}"
      when /C/
        serial="c#{Random.rand(10000..99999)}"
      when /D/
        serial="D#{Random.rand(10000..99999)}"
      when /K/
        serial="K#{Random.rand(10000..99999)}"
      when /L/
        serial="L#{Random.rand(10000..99999)}"
      when /ML/
        serial="ML#{Random.rand(10000..99999)}"
      when /P/
        serial="P#{Random.rand(10000..99999)}"
      when /R/
        serial="R#{Random.rand(10000..99999)}"
      when /S/
        serial="S#{Random.rand(10000..99999)}"
      when /V/
        serial="V#{Random.rand(10000..99999)}"
      when /WN/
        serial="WN#{Random.rand(10000..99999)}"
      else
        expect(['a', 'b', 'c', 'd', 'k', 'l', 'ml', 'p', 'r', 's', 'v', 'wn']).to include(str.downcase.scan( / (.*) /).last.first)
    end
  else
    serial=str
  end
  stamps.mail.print_form.serial_number.set(serial)
end

Then /^[Ss]et Print form Amount to (\d*.?\d+)$/ do |value|
  test_param[:stamp_amount]=value
  stamps.mail.print_form.stamp_amount.set(test_param[:stamp_amount])
end

Then /^[Ss]et Print form Quantity to (\d+)$/ do |value|
  test_param[:quantity]=value
  stamps.mail.print_form.quantity.set(test_param[:quantity])
end


Then /^[Ee]xpect Print form Domestic Address field displays last printed contact$/ do
  20.times do
    stamps.mail.print_form.mail_to.blur_out  #blurs out domestic address field to make sure it can be read correctly
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    reformatted_address = (stamps.mail.print_form.mail_to.dom_mail_address.textarea.text).gsub(/ \n/,"\n").gsub(",","")  #remove commas and unnecessary spaces from address that appears iin domestic address field
    uncleansed_address = reformatted_address.slice(0..-6) #remove last 4 digits from zip code
    break if uncleansed_address==test_param[:address].gsub(/ \n/,"\n")  #compare reformatted address from domestic address field to the last address used for printing postage
  end
  reformatted_address = (stamps.mail.print_form.mail_to.dom_mail_address.textarea.text).gsub(/ \n/,"\n").gsub(",","")
  uncleansed_address = reformatted_address.slice(0..-6)
  expect(uncleansed_address).to eql test_param[:address].gsub(/ \n/,"\n")
  test_config.logger.step 'Address Match Confirmed'
end

Then /^[Ee]xpect Print form Domestic Address field displays (.*)$/ do |value|
   20.times do
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    break if (stamps.mail.print_form.mail_to.mail_address.textarea.text).gsub(/ \n/,", ").gsub(/\n/,", ")==value
  end
  expect((stamps.mail.print_form.mail_to.mail_address.textarea.text).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
  test_config.logger.step 'Address Cleansed -- Expected Result Confirmed'
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect Print form Domestic Address field is empty$/ do
  expect(stamps.mail.print_form.mail_to.mail_address.textarea.text).to eql("")
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]ounds [Ff]ield is (\d+)$/ do |weight_lb|
  expect(stamps.mail.print_form.mail_weight.mail_pounds.text).to eql(weight_lb), "Pound field isn't equal to #{weight_lb}"
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect [Pp]rint [Ff]orm [Oo]unces [Ff]ield is (\d+)$/ do |weight_oz|
  expect(stamps.mail.print_form.mail_weight.mail_ounces.text).to eql(weight_oz), "Ounces field isn't equal to #{weight_oz}"
end

#AB_ORDERSAUTO_3516
Then /^[Cc]lick [Rr]eset [Bb]utton$/ do
  step 'expect print form Toolbar Menu Reset Button is present'
  toolbar.reset.click
end

#AB_ORDERSAUTO_3516
Then /^[Cc]lick Mail toolbar menu reset button$/ do
  stamps.mail.toolbar_menu.reset_fields.click
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect mail fields are reset$/ do
  step "expect Print form Domestic Address field is empty"
  step "expect Print form Pounds Field is 0"
  step "expect Print form Ounces Field is 0"
  step "expect Print form service is empty"
end




