

Then /^on Print form, select left side starting label/ do
  stamps.mail.shipping_labels.form_view.starting_label.left
end

Then /^on Print form, select right side starting label/ do
  stamps.mail.shipping_labels.form_view.starting_label.right
end

Then /^set Shipping Label Print form Hide Mail Value to Checked$/ do
  stamps.mail.shipping_labels.form_view.hide_postage_value.check
end

Then /^set Shipping Label Print form Hide Mail Value to Unchecked$/ do
  stamps.mail.shipping_labels.form_view.hide_postage_value.uncheck
end

Then /^set Shipping Label Print form Print Receipt to Checked$/ do
  stamps.mail.shipping_labels.form_view.print_receipt.check
end

Then /^set Shipping Label Print form Print Receipt to Unchecked$/ do
  stamps.mail.shipping_labels.form_view.print_receipt.uncheck
end

Then /^set Shipping Label Print form Print Reference Number to Checked$/ do
  stamps.mail.shipping_labels.form_view.print_reference_number.check
end

Then /^set Shipping Label Print form Print Reference Number to Unchecked$/ do
  stamps.mail.shipping_labels.form_view.print_reference_number.uncheck
end

Then /^set Shipping Label Print form Reference Number to (.*)$/ do |ref_no|
  stamps.mail.shipping_labels.form_view.reference_number.set ref_no
end

Then /^set Shipping Label Print form Cost Code to (.*)$/ do |code|
  stamps.mail.shipping_labels.form_view.cost_code.select code
end