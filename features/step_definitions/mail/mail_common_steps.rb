
Then /^[Ee]xpect [Pp]rint [Ff]orm Print Media Tooltip is (.*)$/ do |selection|
  stamps.mail.print_on.tooltip selection
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Media (.*) is disabled$/ do |selection|
  stamps.mail.print_on.disabled? selection
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Media (.*) is enabled$/ do |selection|
  stamps.mail.print_on.enabled? selection
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Ship-To address is (.*)$/ do |address|

end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]rint [Oo]n [Ff]ield is present$/ do
  expect(stamps.mail.print_media.dropdown.present?).to be(true), "Print On doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Mm]ail [Ff]rom Field is present$/ do
  expect(stamps.mail.print_form.mail_from.textbox.present?).to be(true), "Mail From doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Mm]ail [Tt]o [Ll]ink is present$/ do
  expect(stamps.mail.print_form.mail_to.mail_to_link.present?).to be(true), "Mail To doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Mm]ail [Tt]o [Cc]ountry [Ff]ield is present$/ do
  expect(stamps.mail.print_form.mail_to.mail_to_country.dom_dd.present?).to be(true), "Mail To Country field doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ee]mail [Cc]heck [Bb]ox is present$/ do
  expect(stamps.mail.print_form.mail_email.email_checkbox.present?).to be(true), "Email Check box doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ee]mail [Ff]ield is present$/ do
  expect(stamps.mail.print_form.mail_email.email_textbox.present?).to be(true), "Email Texxtbox doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]ounds [Ff]ield is present$/ do
  expect(stamps.mail.print_form.mail_weight.mail_pounds.present?).to be(true), "Pound field doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Oo]unces [Ff]ield is present$/ do
  expect(stamps.mail.print_form.mail_weight.mail_ounces.present?).to be(true), "Ounces field doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ww]eigh [Bb]utton is present$/ do
  expect(stamps.mail.print_form.mail_weight.weigh.present?).to be(true), "Weigh button doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Auto Weigh check box is present$/ do
  expect(stamps.mail.print_form.mail_weight.auto_weigh.present?).to be(true), "Weigh check box doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Ff]ield is present$/ do
  expect(stamps.mail.print_form.mail_service.textbox.present?).to be(true), "Service field doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Pp]rice is present$/ do
  expect(stamps.mail.print_form.mail_service.price.present?).to be(true), "Service price doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Insure For Field is present$/ do
  expect(stamps.mail.print_form.mail_insure_for.insure_for_amt.present?).to be(true), "Insure For doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Insure For Price is present$/ do
  expect(stamps.mail.print_form.mail_insure_for.price.present?).to be(true), "Insure For price doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Tracking Field is present$/ do
  expect(stamps.mail.print_form.mail_tracking.textbox.present?).to be(true), "Tracking field doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Tracking Price is present$/ do
  expect(stamps.mail.print_form.mail_tracking.price.present?).to be(true), "Tracking price doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Label Image Preview is present$/ do
  stamps.mail.print_form.advanced_options.print_receipt.check
  expect(stamps.mail.print_preview.outer_image_preview.left_image_preview.present?).to be(true), "Left Label image doesn't exists on Print form"
  expect(stamps.mail.print_preview.inner_image_preview.right_image_preview.present?).to be(true), "Right Label image doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Hide Mail Value check box is present$/ do
  expect(stamps.mail.print_form.advanced_options.hide_label_value.present?).to be(true), "Hide Mail Value check box doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Receipt check box is present$/ do
  expect(stamps.mail.print_form.advanced_options.print_receipt.present?).to be(true), "Print Receipt check box doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Reference Number check box is present$/ do
  expect(stamps.mail.print_form.advanced_options.print_reference_number.present?).to be(true), "Print Receipt check box doesn't exists on Print form"
end


Then /^[Ee]xpect [Pp]rint [Ff]orm [Tt]oolbar [Mm]enu Reset Button is present$/ do
  expect(stamps.mail.toolbar_menu.reset_fields.present?).to be(true), "Reset button is not present on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Tt]oolbar [Mm]enu Settings Button is present$/ do
  expect(stamps.mail.toolbar_menu.settings.present?).to be(true), "Settings button is not present on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Tt]oolbar [Mm]enu Feedback Button is present$/ do
  expect(stamps.mail.toolbar_menu.feedback.present?).to be(true), "Feedback button is not present on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Reprint Banner is present$/ do

end

Then /^[Ee]xpect [Pp]rint [Ff]orm System Notification Banner is present$/ do

end

Then /^[Ee]xpect [Pp]rint [Ff]orm Mail Total is present$/ do
  expect(stamps.mail.mail_toolbar.total.present?).to be(true), "Service price doesn't exists on Print form"
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Sample Button is present$/ do
  expect(stamps.mail.mail_toolbar.sample_button.present?).to be(true), "Service price doesn't exists on Print form"
end

Then /^[Ee]xpect Print form Print Button is present$/ do
  expect(stamps.mail.mail_toolbar.print_button.present?).to be(true), "Service price doesn't exists on Print form"
end