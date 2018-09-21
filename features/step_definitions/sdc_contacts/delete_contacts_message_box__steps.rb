
Then /^[Dd]elete [Cc]ontacts [Mm]essage [Bb]ox [Cc]lick [Oo]n [Yy]es [Bb]utton$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.yes_button.safe_wait_until_present(timeout: 10)
  message_box.yes_button.click
  contacts_grid = SdcContacts.contacts_body
  contacts_grid.wait_until_present(timeout: 20)
end

Then /^[Dd]elete [Cc]ontacts [Mm]essage [Bb]ox [Cc]lick [Oo]n [Nn]o [Bb]utton$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.no_button.safe_wait_until_present(timeout: 10)
  message_box.no_button.click
  contacts_grid = SdcContacts.contacts_body
  contacts_grid.wait_until_present(timeout: 20)
end

Then /^delete contacts message box click on close button$/ do
    message_box = SdcContacts.contacts_delete_message_box
    message_box.close.safe_wait_until_present(timeout: 10)
    message_box.close.click
    contacts_grid = SdcContacts.contacts_body
    contacts_grid.wait_until_present(timeout: 20)
end

Then /^Set Cost code value in the Change Costcode pop up box to (.*)/ do |str|
  cost_code = SdcContacts.contacts_popup_cost_code
  #cost_code.text_field.safe_wait_until_present(timeout: 10)
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
  p str
end

Then /^click on cost code save button$/ do
  cost_code = SdcContacts.contacts_popup_cost_code
  cost_code.save_button.safe_wait_until_present(timeout: 10)
  cost_code.save_button.click
end

