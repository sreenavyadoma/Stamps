# encoding: utf-8

Then /^set Stamps Serial Number to (.*)$/ do |str|
  if str.include?('random')
    case str.downcase
      when /a/
        str = "A#{Random.rand(10000..99999)}"
      when /b/
        str = "B#{Random.rand(10000..99999)}"
      when /c/
        str = "c#{Random.rand(10000..99999)}"
      when /d/
        str = "D#{Random.rand(10000..99999)}"
      when /k/
        str = "K#{Random.rand(10000..99999)}"
      when /l/
        str = "L#{Random.rand(10000..99999)}"
      when /ml/
        str = "ML#{Random.rand(10000..99999)}"
      when /p/
        str = "P#{Random.rand(10000..99999)}"
      when /r/
        str = "R#{Random.rand(10000..99999)}"
      when /s/
        str = "S#{Random.rand(10000..99999)}"
      when /v/
        str = "V#{Random.rand(10000..99999)}"
      when /wn/
        str = "WN#{Random.rand(10000..99999)}"
      else
        expect(['a', 'b', 'c', 'd', 'k', 'l', 'ml', 'p', 'r', 'v', 'wn']).to include(str.downcase)
    end
  end
  stamps.mail.print_form.serial.set str
end

Then /^Mail Stamps: Set Ounces to (.*)$/ do |ounces|
  stamps.mail.netstamps.weight.oz.set ounces
end

Then /^Mail Stamps: Set Pounds to (.*)$/ do |pounds|
  stamps.mail.netstamps.weight.lb.set pounds
end

Then /^Mail Stamps: Set Quantity to (.*)$/ do |qty|
  stamps.mail.netstamps.form_view.quantity.set qty
end

Then /^Mail Stamps: Set Print All to Checked$/ do
  stamps.mail.netstamps.form_view.print_all.check
end

Then /^Mail Stamps: Set Print All to Unchecked$/ do
  stamps.mail.netstamps.form_view.print_all.uncheck
end

Then /^Mail Stamps: Set Reference Number to (.*)$/ do |ref_no|
  stamps.mail.netstamps.form_view.reference_number.set ref_no
end

Then /^Mail Stamps: Set Cost Code to (.*)$/ do |code|
  stamps.mail.netstamps.form_view.cost_code.select(code)
end

Then /^select Stamps Specify Postage Amount/ do
  stamps.mail.print_form.specify_postage_amount
end

Then /^set Stamps Amount to (.*)$/ do |value|
  stamps.mail.print_form.specify_postage_amount.stamp_amount.set(value)
end


Then /^Mail Stamps: Select Calculate Mail Amount/ do
  stamps.mail.netstamps.calculate_postage_amount
end

Then /^Mail Stamps: Set Weight (\d+) lb (\d+) oz$/ do |lb, oz|
  weight = stamps.mail.netstamps.calculate_postage_amount.weight
  weight.lb.set lb
  weight.oz.set oz
end

Then /^Mail Stamps: Open Extra Services$/ do

end


Then /^expect Label form Domestic Address field displays (.*)$/ do |value|
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



