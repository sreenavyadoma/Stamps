# encoding: utf-8

# These browser elements exists on all forms (i.e. Stamps, Envelopes, Shipping Label and Certified Mail)
Then /^(?:S|s)elect Print On (.*)$/ do |media|
  test_parameter[:print_on] = media
  stamps.mail.print_on(test_parameter[:print_on])
end

Then /^(?:S|s)et Print form Mail-From to (.*)$/ do |value|
  test_parameter[:ship_from] = value
  stamps.mail.print_form.mail_from.select(test_parameter[:ship_from])
end

Then /^(?:S|s)et Print form Pounds to (\d+)$/ do |pounds|
  test_parameter[:pounds] = pounds
  stamps.mail.print_form.mail_weight.mail_pounds.set(test_parameter[:pounds])
end

Then /^(?:S|s)et Print form Ounces to (\d+)$/ do |ounces|
  test_parameter[:ounces] = ounces
  stamps.mail.print_form.mail_weight.mail_ounces.set(test_parameter[:ounces])
end

Then /^(?:S|s)et Dimensions to length (\d+) width (\d+) height (\d+)$/ do |length, width, height|
  step "set Print form Length to #{length}"
  step "set Print form width to #{width}"
  step "set Print form height to #{height}"
end

# dimension expectations
Then /^(?:E|e)xpect Print form Length is (?:correct|(\d+))$/ do |length|
  length = test_parameter[:length] if length.nil?
  expect(stamps.mail.print_form.dimensions.length.text.to_i).to eql(length.to_i)
end

Then /^(?:E|e)xpect Print form width is (?:correct|(\d+))$/ do |width|
  width = test_parameter[:width] if width.nil?
  expect(stamps.mail.print_form.dimensions.width.text.to_i).to eql(width.to_i)
end

Then /^(?:E|e)xpect Print form height is (?:correct|(\d+))$/ do |height|
  height = test_parameter[:height] if height.nil?
  expect(stamps.mail.print_form.dimensions.height.text.to_i).to eql(height.to_i)
end

Then /^(?:S|s)elect Print form (?:S|s)ervice (.*)$/ do |service|
  test_parameter[:service] = service
  stamps.mail.print_form.mail_service.select(test_parameter[:service])
end

When /^(?:P|p)rint (?:L|l)abel$/ do
  stamps.mail.mail_toolbar.print_label
end

When /^(?:C|c)lick Print Sample button on Print form$/ do
  @print_window = stamps.mail.mail_toolbar.print_sample
end

Then /^(?:C|c)lick Search Contacts close button$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end

Then /^(?:S|s)et Print form (?:M|m)ail-(?:T|t)o (?:C|c)ountry to (.*)$/ do |country|
  test_parameter[:country] = country
  stamps.mail.print_form.mail_to.country((test_parameter[:country]))
end



