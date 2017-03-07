
Then /^(?:S|s)elect Extra Services$/ do
  stamps.mail.print_form.advanced_options.show
  stamps.mail.print_form.advanced_options.extra_services
end

Then /^(?:S|s)et Extra Services COD to (\d*.\d+)$/ do |amount|
  expect(stamps.mail.print_form.advanced_options.extra_services.cod.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.cod.set(amount)
end

Then /^(?:E|e)xpect Extra Services COD Price to be (\d*.\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.cod_price_element.present?).to be(true)
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.cod_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.cod_price).to eql(expectation.to_f.round(2))
end

Then /^(?:S|s)ave Extra Services/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.save_element.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.save
end

Then /^(?:S|s)et Extra Services Security to (.*)$/ do |str|
  expect(stamps.mail.print_form.advanced_options.extra_services.security.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.security.select(str)
end

Then /^(?:E|e)xpect Extra Services Security Price to be (\d*.\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.security_price_element.present?).to be(true)
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.security_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.security_price).to eql(expectation.to_f.round(2))
end

Then /^(?:S|s)et Extra Services Value to (\d*.\d+)$/ do |value|
  expect(stamps.mail.print_form.advanced_options.extra_services.security.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.value.set(value)
end

Then /^(?:S|s)et Extra Services Handling to (.*)$/ do |str|
  expect(stamps.mail.print_form.advanced_options.extra_services.handling.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.handling.select(str)
end

Then /^(?:C|c)heck Extra Services Return Receipt$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.return_receipt.check
end

Then /^(?:E|e)xpect Extra Services Return Receipt Price to be (\d*.\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_price_element.present?).to be(true)
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.return_receipt_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_price).to eql(expectation.to_f.round(2))
end

Then /^(?:U|u)ncheck Extra Services Return Receipt$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.return_receipt.uncheck
end

Then /^(?:C|c)heck Extra Services Electronic Return Receipt$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.check
end

Then /^(?:U|u)ncheck Extra Services Electronic Return Receipt$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.uncheck
end

Then /^(?:C|c)heck Extra Services Restricted Delivery$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.check
end

Then /^(?:E|e)xpect Extra Services Restricted Delivery Price to be (\d*.\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price_element.present?).to be(true)
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price).to eql(expectation.to_f.round(2))
end

Then /^(?:U|u)ncheck Extra Services Restricted Delivery$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.uncheck
end

Then /^(?:C|c)heck Extra Services Notice of Non-Delivery$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.check
end

Then /^(?:E|e)xpect Extra Services Notice of Non-Delivery Price to be (\d*.\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price_element.present?).to be(true)
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price).to eql(expectation.to_f.round(2))
end

Then /^(?:U|u)ncheck Extra Services Notice of Non-Delivery$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.uncheck
end

Then /^(?:C|c)heck Extra Services Fragile$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.fragile.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.fragile.check
end

Then /^(?:U|u)ncheck Extra Services Fragile$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.fragile.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.fragile.uncheck
end

Then /^(?:C|c)heck Extra Services Return Receipt for Merchandise$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.check
end

Then /^(?:U|u)ncheck Extra Services Return Receipt for Merchandise$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.uncheck
end

Then /^(?:C|c)heck Extra Services Non-Rectangular$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.non_rectangular.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.check
end

Then /^(?:U|u)ncheck Extra Services Non-Rectangular$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.non_rectangular.present?).to be(true)
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.uncheck
end

Then /^(?:E|e)xpect Extra Services Total Price to be (\d*.\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.total_price_element.present?).to be(true)
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.total_price == expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.total_price).to eql(expectation.to_f.round(2))
end



