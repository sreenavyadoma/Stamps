
Then /^[Ss]et Extra Services COD to (\d*.?\d+)$/ do |amount|
  expect(stamps.mail.print_form.advanced_options.extra_services.cod).to be_present
  stamps.mail.print_form.advanced_options.extra_services.cod.set(amount)
end

Then /^[Ee]xpect Extra Services COD Price to be (\d*.?\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.cod_price_element).to be_present
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.cod_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.cod_price).to eql(expectation.to_f.round(2))
end

Then /^[Ss]ave Extra Services$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.save_element).to be_present
  stamps.mail.print_form.advanced_options.extra_services.save
end

Then /^[Ee]xpect Extra Services is present$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services).to be_present
end

Then /^[Cc]lose Extra Services$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.save_element).to be_present
  stamps.mail.print_form.advanced_options.extra_services.close
end

Then /^[Ss]et Extra Services Security to (.*)$/ do |str|
  expect(stamps.mail.print_form.advanced_options.extra_services.security).to be_present
  stamps.mail.print_form.advanced_options.extra_services.security.select(str)
end

Then /^[Ee]xpect Extra Services Security Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.security_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.security_price).to eql(expectation.to_f.round(2))
end

Then /^[Ss]et Extra Services Value to (\d*.?\d+)$/ do |value|
  stamps.mail.print_form.advanced_options.extra_services.value.set(value)
end

Then /^[Ss]et Extra Services Handling to (.*)$/ do |str|
  stamps.mail.print_form.advanced_options.extra_services.handling.select(str)
end

Then /^[Cc]heck Extra Services Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.return_receipt.check
end

Then /^[Ee]xpect Extra Services Return Receipt Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.return_receipt_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_price).to eql(expectation.to_f.round(2))
end

Then /^[Uu]ncheck Extra Services Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.return_receipt.uncheck
end

Then /^[Cc]heck Extra Services Electronic Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.check
end

Then /^[Uu]ncheck Extra Services Electronic Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.uncheck
end

Then /^[Cc]heck Extra Services Restricted Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.check
end

Then /^[Ee]xpect Extra Services Restricted Delivery Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price).to eql(expectation.to_f.round(2))
end

Then /^[Uu]ncheck Extra Services Restricted Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.uncheck
end

Then /^[Cc]heck Extra Services Notice of Non-Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.check
end

Then /^[Ee]xpect Extra Services Notice of Non-Delivery Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price).to eql(expectation.to_f.round(2))
end

Then /^[Uu]ncheck Extra Services Notice of Non-Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.uncheck
end

Then /^[Cc]heck Extra Services Fragile$/ do
  stamps.mail.print_form.advanced_options.extra_services.fragile.check
end

Then /^[Uu]ncheck Extra Services Fragile$/ do
  stamps.mail.print_form.advanced_options.extra_services.fragile.uncheck
end

Then /^[Cc]heck Extra Services Return Receipt for Merchandise$/ do
  stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.check
end

Then /^[Uu]ncheck Extra Services Return Receipt for Merchandise$/ do
  stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.uncheck
end

Then /^[Cc]heck Extra Services Non-Rectangular$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.check
end

Then /^[Uu]ncheck Extra Services Non-Rectangular$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.uncheck
end

Then /^[Ee]xpect Extra Services Total Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.total_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.total_price).to eql(expectation.to_f.round(2))
end
