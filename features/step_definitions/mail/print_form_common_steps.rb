# encoding: utf-8

# These browser elements exists on all forms (i.e. Stamps, Envelopes, Shipping Label and Certified Mail)
Then /^[Ss]elect Print On (.*)$/ do |media|
  parameter[:print_on] = media
  stamps.mail.print_on(parameter[:print_on])
end

Then /^[Ss]et Print form Mail-From to (.*)$/ do |value|
  parameter[:ship_from] = value
  stamps.mail.print_form.mail_from.select(parameter[:ship_from])
end

Then /^[Ss]et Print form [Pp]ounds to (\d+)$/ do |pounds|
  parameter[:pounds] = pounds
  stamps.mail.print_form.mail_weight.mail_pounds.set(parameter[:pounds])
end

Then /^[Ss]et Print form [Oo]unces to (\d+)$/ do |ounces|
  parameter[:ounces] = ounces
  stamps.mail.print_form.mail_weight.mail_ounces.set(parameter[:ounces])
end

Then /^[Ss]et Dimensions to length (\d+) width (\d+) height (\d+)$/ do |length, width, height|
  step "set Print form Length to #{length}"
  step "set Print form width to #{width}"
  step "set Print form height to #{height}"
end

# dimension expectations
Then /^[Ee]xpect Print form Length is (?:correct|(\d+))$/ do |length|
  length = parameter[:length] if length.nil?
  expect(stamps.mail.print_form.dimensions.length.text.to_i).to eql(length.to_i)
end

Then /^[Ee]xpect Print form width is (?:correct|(\d+))$/ do |width|
  width = parameter[:width] if width.nil?
  expect(stamps.mail.print_form.dimensions.width.text.to_i).to eql(width.to_i)
end

Then /^[Ee]xpect Print form height is (?:correct|(\d+))$/ do |height|
  height = parameter[:height] if height.nil?
  expect(stamps.mail.print_form.dimensions.height.text.to_i).to eql(height.to_i)
end

Then /^[Ss]elect Print form [Ss]ervice (.*)$/ do |service|
  parameter[:service] = service
  stamps.mail.print_form.mail_service.select(parameter[:service])
end

When /^[Pp]rint [Ll]abel$/ do
  stamps.mail.mail_toolbar.print_label
end

When /^[Cc]lick Print Sample button on Print form$/ do
  @print_window = stamps.mail.mail_toolbar.print_sample
end

Then /^[Cc]lick Search Contacts close button$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end

Then /^[Ss]et Print form [Mm]ail-[Tt]o [Cc]ountry to (.*)$/ do |country|
  parameter[:country] = country
  stamps.mail.print_form.mail_to.country((parameter[:country]))
end



