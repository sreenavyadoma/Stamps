Then /^click mail toolbar reset button|reset all fields$/ do
  SdcMail.toolbar.reset.click
end

Then /^click mail toolbar feedback$/ do
  SdcMail.toolbar.feedback.click
  step 'expect feedback modal is present'
end

Then /^click mail toolbar settings$/ do
  SdcMail.toolbar.settings.click
  step 'expect settings modal is present'
end

Then /^click mail toolbar print$/ do
  step 'expect mail toolbar print is present'
  SdcMail.toolbar.print.click
end

Then /^expect mail toolbar print is present$/ do
  expect(SdcMail.toolbar.print).to be_present, "Toolbar Print button is not present"
end

Then /^click mail toolbar print dropdown$/ do
  SdcMail.toolbar.print_dropdown.click
  step 'hover on mail toolbar print tooltip'
end

Then /^hover on mail toolbar print tooltip$/ do
  SdcMail.toolbar.print_tooltip.hover
end

Then /^click mail toolbar print (?:postage|label|stamps|envelope)$/ do
  SdcMail.toolbar.print_label.click
end

Then /^click mail toolbar print sample$/ do
  SdcMail.toolbar.print_sample.click
end

Then /^expect mail toolbar print (?:postage|label|stamps|envelope) is present$/ do
  expect(SdcMail.toolbar.print).to be_present, "Toolbar Print button is not present"
end
Then /^expect mail toolbar print sample is present$/ do
  expect(SdcMail.toolbar.print).to be_present, "Toolbar Print button is not present"
end

Then /^click mail toolbar favorites$/ do
  step 'expect mail toolbar favorites is present'
  SdcMail.toolbar.favorites.click
  step 'hover on mail toolbar favorites tooltip'
end

Then /^hover on mail toolbar favorites tooltip$/ do
  SdcMail.toolbar.favorites_tooltip.hover
end

Then /^expect mail toolbar favorites is present$/ do
  expect(SdcMail.toolbar.favorites).to be_present, "Toolbar Favorites button is not present"
end

Then /^click mail toolbar save as favorite$/ do
  step 'expect mail toolbar save as favorite is present'
  SdcMail.toolbar.save_as_favorite.click
  step 'expect save as favorite modal is present'
end

Then /^click mail toolbar manage favorites$/ do
  SdcMail.toolbar.manage_favorites.click
  step 'expect manage favorites modal is present'
end

Then /^expect mail toolbar save as favorite is present$/ do
  expect(SdcMail.toolbar.save_as_favorite).to be_present, "Toolbar Save as favorite is not present"
end
Then /^expect mail toolbar manage favorites is present$/ do
  expect(SdcMail.toolbar.manage_favorites).to be_present, "Toolbar Manage favorites is not present"
end