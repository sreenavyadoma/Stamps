


Then /^(?:E|e)xpect Print form Print Media Tooltip is (.*)$/ do |selection|
  stamps.mail.print_on.tooltip selection
end

Then /^(?:E|e)xpect Print form Print Media (.*) is disabled$/ do |selection|
  stamps.mail.print_on.disabled? selection
end

Then /^(?:E|e)xpect Print form Print Media (.*) is enabled$/ do |selection|
  stamps.mail.print_on.enabled? selection
end

Then /^(?:E|e)xpect Print form Ship-To address is (.*)$/ do |address|

end
#todo major rework here
Then /^(?:E|e)xpect Print form Print On Field is present$/ do
  print_on = PrintOn.new(param)
  expect(print_on.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Ship From Field is present$/ do
  expect(stamps.mail.print_form.ship_from.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Ship To Link is present$/ do
  expect(stamps.mail.print_form.mail_to.contacts.link.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Ship To Country Field is present$/ do
  expect(stamps.mail.print_form.mail_to.country.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Email Check Box is present$/ do
  expect(stamps.mail.print_form.mail_to.email.checkbox.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Email Field is present$/ do
  expect(stamps.mail.print_form.mail_to.email.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Pounds Field is present$/ do
  expect(stamps.mail.print_form.weight.oz.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Ounces Field is present$/ do
  expect(stamps.mail.print_form.weight.lb.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Weigh Button is present$/ do
  expect(stamps.mail.weight.weigh_button.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Auto Weigh check box is present$/ do
  expect(stamps.mail.weight.auto_weigh.present?).to be(true)
end

Then /^(?:E|e)xpect Print form service Field is present$/ do
  expect(stamps.mail.print_form.service.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form service Price is present$/ do
  expect(stamps.mail.print_form.service.price.present?).to be(true)
end























Then /^(?:E|e)xpect Print form Insure For Field is present$/ do
  expect(stamps.mail.shipping_labels.insure_for.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Insure For Price is present$/ do
  expect(stamps.mail.shipping_labels.insure_for.price.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Tracking Field is present$/ do
  expect(stamps.mail.shipping_labels.tracking.text_box.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Tracking Price is present$/ do
  expect(stamps.mail.shipping_labels.tracking.price.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Label Image Preview is present$/ do
  expect(stamps.mail.shipping_labels.form_view.starting_label.left_label.present?).to be(true)
  expect(stamps.mail.shipping_labels.form_view.starting_label.right_label.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Hide Mail Value check box is present$/ do
  expect(stamps.mail.shipping_labels.form_view.hide_postage_value.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Print Receipt check box is present$/ do
  expect(stamps.mail.shipping_labels.form_view.print_receipt.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Reset Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.reset.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Settings Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.settings.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Help Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.help.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Reprint Banner is present$/ do

end

Then /^(?:E|e)xpect Print form System Notification Banner is present$/ do

end

Then /^(?:E|e)xpect Print form Feedback Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.feedback.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Classic Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.classic.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Mail Total is present$/ do
  expect(stamps.mail.mail_toolbar.total.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Print Sample Button is present$/ do
  expect(stamps.mail.mail_toolbar.print_button.present?).to be(true)
end

Then /^(?:E|e)xpect Print form Print Button is present$/ do
  expect(stamps.mail.mail_toolbar.sample_button.present?).to be(true)
end


