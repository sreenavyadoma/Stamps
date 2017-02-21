# encoding: utf-8

Then /^(?:S|s)elect Print On (.*)$/ do |media|
  test_parameter[:print_on] = media
  stamps.mail.print_on(test_parameter[:print_on])
end

Then /^(?:S|s)et Print form Mail From to (.*)$/ do |value|
  test_parameter[:ship_from] = value
  stamps.mail.print_form.mail_from.select(test_parameter[:ship_from])
end

Then /^(?:S|s)et Print form Pounds to (\d+)$/ do |pounds|
  stamps.mail.print_form.mail_weight.mail_pounds.set(pounds)
end

Then /^(?:S|s)et Print form Ounces to (\d+)$/ do |ounces|
  stamps.mail.print_form.mail_weight.mail_ounces.set(ounces)
end

Then /^(?:S|s)elect Print form (?:S|s)ervice (.*)$/ do |service|
  stamps.mail.print_form.mail_service.select(service)
end

When /^(?:C|c)lick Print form Print button$/ do
  stamps.mail.mail_toolbar.print
end

When /^(?:C|c)lick Print Sample button on Print form$/ do
  @print_window = stamps.mail.mail_toolbar.print_sample
end
