Then /^expect service commitments modal is present$/ do
  expect(SdcMail.modals.service_commitments.title).to be_present, "Service Commitments modal is not present"
end

Then /^expect service commitments modal is not present$/ do
  expect(SdcMail.modals.service_commitments.title).not_to be_present, "Service Commitments modal is still present"
end

Then /^close advanced options service commitments modal$/ do
  SdcMail.modals.service_commitments.x_btn.click
  step 'expect service commitments modal is not present'
end

Then /^expect form 3811 modal is present$/ do
  expect(SdcMail.modals.form_3811.title).to be_present, "Form 3811 modal is not present"
end

Then /^expect form 3811 modal is not present$/ do
  expect(SdcMail.modals.form_3811.title).not_to be_present, "Form 3811 modal is still present"
end

Then /^close form 3811 modal$/ do
  step 'expect form 3811 modal is present'
  SdcMail.modals.form_3811.x_btn.click
  step 'expect form 3811 modal is not present'
end

Then /^expect label 200 modal is present$/ do
  expect(SdcMail.modals.label_200.title).to be_present, "Label 200 modal is not present"
end

Then /^expect label 200 modal is not present$/ do
  expect(SdcMail.modals.label_200.title).not_to be_present, "Label 200 modal is still present"
end

Then /^close label 200 modal$/ do
  step 'expect label 200 modal is present'
  SdcMail.modals.label_200.x_btn.click
  step 'expect label 200 modal is not present'
end

Then /^expect save as favorite modal is present$/ do
  expect(SdcMail.modals.save_as_favorite.title).to be_present, "Save as favorite is not present"
end

Then /^expect save as favorite modal is not present$/ do
  expect(SdcMail.modals.save_as_favorite.title).not_to be_present, "Save as favorite is still present"
end

Then /^close save as favorite modal$/ do
  SdcMail.modals.save_as_favorite.x_btn.click
  step 'expect save as favorite modal is not present'
end

Then /^save save as favorite modal$/ do
  SdcMail.modals.save_as_favorite.save.click
  step 'expect save as favorite modal is not present'
end

Then /^set save as favorite modal name to random$/ do
  str = TestHelper.rand_alpha_numeric(min: 6, max: 18)
  SdcMail.modals.save_as_favorite.name.set(str)
  step "expect save as favorite name is #{str}"
end

Then /^expect save as favorite name is (\w+)$/ do |value|
  expect(SdcMail.modals.save_as_favorite.name.text_value).to eql(value), "Save as favorite is still present"
end

Then /^check save as favorite modal include delivery address$/ do
  SdcMail.modals.save_as_favorite.include_delivery_adr.check unless SdcMail.modals.save_as_favorite.include_delivery_adr.checked?
  step 'expect save as favorite modal include delivery address is checked'
end

Then /^uncheck save as favorite modal include delivery address$/ do
  SdcMail.modals.save_as_favorite.include_delivery_adr.uncheck if SdcMail.modals.save_as_favorite.include_delivery_adr.checked?
  step 'expect save as favorite modal include delivery address is unchecked'
end

Then /^expect save as favorite modal include delivery address is checked$/ do
  expect(SdcMail.modals.save_as_favorite.include_delivery_adr.checked?).to be_truthy, "Include Delivery Address is not checked!"
end

Then /^expect save as favorite modal include delivery address is unchecked$/ do
  expect(SdcMail.modals.save_as_favorite.include_delivery_adr.checked?).to be_falsey, "Include Delivery Address is not unchecked!"
end

Then /^expect manage favorites modal is present$/ do
  expect(SdcMail.modals.manage_favorites.title).to be_present, "Manage favorites is not present"
end

Then /^expect manage favorites modal is not present$/ do
  expect(SdcMail.modals.manage_favorites.title).not_to be_present, "Manage favorites is not present"
end

Then /^select on manage favorites modal row (\d+)$/ do |num|
  SdcMail.modals.manage_favorites.selection_element("selection", num).click
  # SdcMail.modals.manage_favorites.selection_element("selection", num)
  # SdcMail.modals.manage_favorites.selection.click
end

Then /^click manage favorites modal rename$/ do
  SdcMail.modals.manage_favorites.rename.click
  step 'expect manage favorites rename modal is present'
end

Then /^close manage favorites modal$/ do
  SdcMail.modals.manage_favorites.x_btn.click
  step 'expect manage favorites modal is not present'
end

Then /^expect manage favorites rename modal is present$/ do
  expect(SdcMail.modals.manage_favorites.rename_favorite.title).to be_present, "Manage favorites rename is not present"
end

Then /^expect manage favorites rename modal is not present$/ do
  expect(SdcMail.modals.manage_favorites.rename_favorite.title).not_to be_present, "Manage favorites rename is still present"
end

Then /^expect manage favorites delete modal is present$/ do
  expect(SdcMail.modals.manage_favorites.delete_favorite.title).to be_present, "Manage favorites delete is not present"
end

Then /^expect manage favorites delete modal is not present$/ do
  expect(SdcMail.modals.manage_favorites.delete_favorite.title).not_to be_present, "Manage favorites delete is still present"
end

Then /^set favorite modal rename name to random$/ do
  str = TestHelper.rand_alpha_numeric(min: 6, max: 18)
  SdcMail.modals.manage_favorites.rename_favorite.name.set(str)
  step "expect favorite modal rename name is #{str}"
end

Then /^expect favorite modal rename name is (\w+)$/ do |value|
  expect(SdcMail.modals.manage_favorites.rename_favorite.name.text_value).to eql(value), "Manage favorites delete is still present"
end

Then /^save favorite modal rename$/ do
  SdcMail.modals.manage_favorites.rename_favorite.save.click
  step "expect manage favorites rename modal is not present"
end

Then /^click manage favorites modal delete$/ do
  SdcMail.modals.manage_favorites.delete.click
  step 'expect manage favorites delete modal is present'
end

Then /^click manage favorites delete modal delete button$/ do
  SdcMail.modals.manage_favorites.delete_favorite.delete.click
  step "expect manage favorites delete modal is not present"
end



Then /^expect feedback modal is present$/ do
  expect(SdcMail.modals.feedback.title).to be_present, "Feedback modal is not present"
end
Then /^expect feedback modal is not present$/ do
  expect(SdcMail.modals.feedback.title).not_to be_present, "Feedback modal is still present"
end
Then /^close feedback modal$/ do
  SdcMail.modals.feedback.x_btn.click
  step 'expect feedback modal is not present'
end

Then /^expect settings modal is present$/ do
  expect(SdcMail.modals.settings.title).to be_present, "Settings modal is not present"
end
Then /^expect settings modal is not present$/ do
  expect(SdcMail.modals.settings.title).not_to be_present, "Settings modal is still present"
end
Then /^close settings modal$/ do
  SdcMail.modals.settings.close.click
  step 'expect settings modal is not present'
end


