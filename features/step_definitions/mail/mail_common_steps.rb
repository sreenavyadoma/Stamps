


Then /^on Print form, expect Print Media Tooltip is (.*)$/ do |selection|
  stamps.mail.print_on.tooltip selection
end

Then /^on Print form, expect Print Media (.*) is disabled$/ do |selection|
  stamps.mail.print_on.disabled? selection
end

Then /^on Print form, expect Print Media (.*) is enabled$/ do |selection|
  stamps.mail.print_on.enabled? selection
end

Then /^on Print form, expect Ship-To address is (.*)$/ do |address|

end
#todo major rework here
Then /^on Print form, expect Print On Field is present$/ do
  print_on = PrintOn.new(param)
  expect(print_on.text_box.present?).to be true
end

Then /^on Print form, expect Ship From Field is present$/ do
  expect(stamps.mail.print_form.ship_from.text_box.present?).to be true
end

Then /^on Print form, expect Ship To Link is present$/ do
  expect(stamps.mail.print_form.ship_to.contacts.link.present?).to be true
end

Then /^on Print form, expect Ship To Country Field is present$/ do
  expect(stamps.mail.print_form.ship_to.country.text_box.present?).to be true
end

Then /^on Print form, expect Domestic Address Field is present$/ do
  expect(stamps.mail.print_form.ship_to.text_area.present?).to be true
end

Then /^on Print form, expect International Name Field is present$/ do
  expect(stamps.mail.print_form.ship_to.name.present?).to be true
end

Then /^on Print form, expect International Company Field is present$/ do
  expect(stamps.mail.print_form.ship_to.company.present?).to be true
end

Then /^on Print form, expect International Address 1 Field is present$/ do
  expect(stamps.mail.print_form.ship_to.address_1.present?).to be true
end

Then /^on Print form, expect International Address 2 Field is present$/ do
  expect(stamps.mail.print_form.ship_to.address_2.present?).to be true
end

Then /^on Print form, expect International City Field is present$/ do
  expect(stamps.mail.print_form.ship_to.city.present?).to be true
end

Then /^on Print form, expect International Province Field is present$/ do
  expect(stamps.mail.print_form.ship_to.province.present?).to be true
end

Then /^on Print form, expect International Postcode Field is present$/ do
  expect(stamps.mail.print_form.ship_to.postal_code.present?).to be true
end

Then /^on Print form, expect International Phone Field is present$/ do
  expect(stamps.mail.print_form.ship_to.phone.present?).to be true
end

Then /^on Print form, expect Email Check Box is present$/ do
  expect(stamps.mail.print_form.ship_to.email.checkbox.present?).to be true
end

Then /^on Print form, expect Email Field is present$/ do
  expect(stamps.mail.print_form.ship_to.email.text_box.present?).to be true
end

Then /^on Print form, expect Pounds Field is present$/ do
  expect(stamps.mail.print_form.weight.oz.text_box.present?).to be true
end

Then /^on Print form, expect Ounces Field is present$/ do
  expect(stamps.mail.print_form.weight.lb.text_box.present?).to be true
end

Then /^on Print form, expect Weigh Button is present$/ do
  expect(stamps.mail.weight.weigh_button.present?).to be true
end

Then /^on Print form, expect Auto Weigh check box is present$/ do
  expect(stamps.mail.weight.auto_weigh.present?).to be true
end

Then /^on Print form, expect service Field is present$/ do
  expect(stamps.mail.print_form.service.text_box.present?).to be true
end

Then /^on Print form, expect service Price is present$/ do
  expect(stamps.mail.print_form.service.price.present?).to be true
end

Then /^on Print form, expect Insure For Field is present$/ do
  expect(stamps.mail.shipping_labels.insure_for.text_box.present?).to be true
end

Then /^on Print form, expect Insure For Price is present$/ do
  expect(stamps.mail.shipping_labels.insure_for.price.present?).to be true
end

Then /^on Print form, expect Tracking Field is present$/ do
  expect(stamps.mail.shipping_labels.tracking.text_box.present?).to be true
end

Then /^on Print form, expect Tracking Price is present$/ do
  expect(stamps.mail.shipping_labels.tracking.price.present?).to be true
end

Then /^on Print form, expect Extra Services Button is present$/ do
  expect(stamps.mail.shipping_labels.extra_services.present?).to be true
end

Then /^on Print form, expect Label Image Preview is present$/ do
  sleep(1)
  expect(stamps.mail.shipping_labels.form_view.starting_label.left_label.present?).to be true
  expect(stamps.mail.shipping_labels.form_view.starting_label.right_label.present?).to be true
end

Then /^on Print form, expect Hide Mail Value check box is present$/ do
  expect(stamps.mail.shipping_labels.form_view.hide_postage_value.present?).to be true
end

Then /^on Print form, expect Print Receipt check box is present$/ do
  expect(stamps.mail.shipping_labels.form_view.print_receipt.present?).to be true
end

Then /^on Print form, expect Print Reference Number check box is present$/ do
  expect(stamps.mail.shipping_labels.form_view.print_reference_number.present?).to be true
end

Then /^on Print form, expect Reference Number field is present$/ do
  expect(stamps.mail.form_view.reference_number.present?).to be true
end

Then /^on Print form, expect Cost Code Field is present$/ do
  expect(stamps.mail.form_view.cost_code.text_box.present?).to be true
end

Then /^on Print form, expect Reset Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.reset.present?).to be true
end

Then /^on Print form, expect Settings Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.settings.present?).to be true
end

Then /^on Print form, expect Help Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.help.present?).to be true
end

Then /^on Print form, expect Reprint Banner is present$/ do

end

Then /^on Print form, expect System Notification Banner is present$/ do

end

Then /^on Print form, expect Feedback Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.feedback.present?).to be true
end

Then /^on Print form, expect Classic Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.classic.present?).to be true
end

Then /^on Print form, expect Mail Total is present$/ do
  expect(stamps.mail.mail_toolbar.total.present?).to be true
end

Then /^on Print form, expect Print Sample Button is present$/ do
  expect(stamps.mail.mail_toolbar.print_button.present?).to be true
end

Then /^on Print form, expect Print Button is present$/ do
  expect(stamps.mail.mail_toolbar.sample_button.present?).to be true
end


