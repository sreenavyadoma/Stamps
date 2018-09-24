
Then /^[Ee]xpect [Cc]ost [Cc]ode [Pp]age [Ii]s [Dd]isplayed$/ do
  add_cost_code  = SdcContacts.contacts_cost_codes
  add_cost_code.cost_codes_page.safe_wait_until_present(timeout: 20)
  expect(add_cost_code.cost_codes_page.present?).to be(true)
end

Then /^[Oo]n [Cc]ost [Cc]ode [Pp]age [Ss]et [Vv]alue [Oo]f [Nn]ew [Cc]ost [Cc]ode [Tt]extbox [Tt]o (.*)$/ do |costcode_name|

  #check for costcodes count and remove one if count =10 and then add
  add_cost_code  = SdcContacts.contacts_cost_codes
  row_count = add_cost_code.cost_code_table_rows.count
  if row_count == 11
    step "remove costcode from the costcode table"
  end
  add_cost_code.add_cost_code.safe_wait_until_present(timeout: 20)
  if costcode_name=="random"
    cost_code = TestHelper.rand_cost_code
    add_cost_code.add_cost_code.set(cost_code)
    TestData.hash[:costcode_val] = cost_code
  elsif costcode_name == "existing value"
    str = add_cost_code.cost_code_table_value.text_value
    add_cost_code.add_cost_code.set(str)
  else
    add_cost_code.add_cost_code.set(costcode_name)
    TestData.hash[:costcode_val] = costcode_name
  end

end

Then /^[Rr]emove [Cc]ostcode [Ff]rom [Tt]he [Cc]ostcode [Tt]able$/ do
  add_cost_code  = SdcContacts.contacts_cost_codes
  add_cost_code.cost_codes_checkbox.click
  add_cost_code.remove_cost_code_button.click
  add_cost_code.remove_cost_code_button.click
end

Then /^[Oo]n [Cc]ost [Cc]odes [Pp]age [Cc]lick [Oo]n [Aa]dd [Bb]utton$/ do
  add_cost_code  = SdcContacts.contacts_cost_codes
  add_cost_code.add_cost_code_button.click
end

Then /^[Ee]xpect [Ee]rror [Mm]essage [Bb]ox [Ii]s [Dd]isplayed$/ do
  add_cost_code  = SdcContacts.contacts_cost_codes
  expect(add_cost_code.error_cost_code.present?).to be(true)
end

Then /^[Ee]xpect [Ee]rror [Mm]essage [Bb]ox [Ii]s [Nn]ot [Dd]isplayed$/ do
  add_cost_code  = SdcContacts.contacts_cost_codes
  expect(add_cost_code.error_cost_code.present?).to be(false)
end

Then /^[Oo]n [Cc]ost [Cc]odes [Pp]age [Cc]lick [Oo]n [Dd]one [Bb]utton$/ do
  add_cost_code  = SdcContacts.contacts_cost_codes
  add_cost_code.done_cost_code_button.click
  add_cost_code.cost_codes_accounts_page.safe_wait_until_present(timeout: 15)
end

Then /^[Ee]xpect [Cc]hange [Cc]ost [Cc]ode [Pp]opup$/ do
  cost_code = SdcContacts.contacts_popup_cost_code
  cost_code.drop_down.safe_wait_until_present(timeout: 10)
  expect(cost_code.drop_down.present?).to be(true)
end

Then /^[sS]et [Cc]ost [Cc]ode [Vv]alue [Ii]n [Tt]he [Cc]hange [Cc]ostcode [Pp]op [Uu]p [Bb]ox [Tt]o (.*)/ do |costcode_name|

  if costcode_name == "new costcode added"
    str ||= TestData.hash[:costcode_val]
  elsif costcode_name == "existing value"
    left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
    row_count = left_nav_costcode.total_costcodes.count
    str = left_nav_costcode.cost_code_name(row_count-2)
  else
    str = costcode_name
  end

  cost_code = SdcContacts.contacts_popup_cost_code
  #cost_code.text_field.safe_wait_until_present(timeout: 10)
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
  p str
end

Then /^[Cc]lick [Oo]n [Cc]ost [Cc]ode [Ss]ave [Bb]utton$/ do
  cost_code = SdcContacts.contacts_popup_cost_code
  cost_code.save_button.safe_wait_until_present(timeout: 10)
  cost_code.save_button.click
end

Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Cc]ost [Cc]odes [Dd]ropdown$/ do
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
  step "mouse hover on cost codes"
  toolbar.cost_codes.click
end

Then /^[Oo]n [Cc]ost [Cc]odes [Dd]ropdown [Mm]enu [Ss]elect (.*)$/ do |str|
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  case str
  when 'Change Cost Code'
    toolbar.cost_codes_change_costcode.click
    toolbar.cost_codes_change_costcode.flash
  when 'Add/Edit Cost Codes'
    toolbar.cost_codes_add_edit_costcode.click
  end
end

Then /^[Mm]ouse [Hh]over [Oo]n [Cc]ost [Cc]odes$/ do
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
  toolbar.cost_codes.hover
end

Then /^[Ss]et (.*) [Vv]alue [Ii]n [Dd]etails [Mm]enu [Cc]ost [Cc]ode [Dd]ropdown/ do |costcode_name|
  if costcode_name == "new costcode added"
    str ||= TestData.hash[:costcode_val]
  else
    str = costcode_name
  end

  cost_code = SdcContacts.contacts_cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
end

Then /^[Oo]n [Cc]ontacts [Ll]eft [Nn]avigation [Cc]lick [Oo]n [Cc]ost [Cc]odes [Ee]xpand [Bb]utton$/ do
  left_cost_code  = SdcContacts.contacts_left_nav_cost_code
  left_cost_code.cost_codes_expand_button.safe_wait_until_present(timeout: 15)
  left_cost_code.cost_codes_expand_button.click
end

Then /^[Oo]n [Cc]ontacts [Ll]eft [Nn]avigation [Cc]lick [Oo]n [Cc]ost [Cc]odes [Cc]ollapse [Bb]utton$/ do
  left_cost_code  = SdcContacts.contacts_left_nav_cost_code
  left_cost_code.cost_codes_collapse_button.safe_wait_until_present(timeout: 15)
  left_cost_code.cost_codes_collapse_button.click
end

Then /^[Oo]n [Ll]eft [Nn]avigation [Ee]xpect (.*) [Ii]s [Aa]vilable [Uu]nder [Cc]ostcode [Ff]ilter$/ do |costcode_name|

  if costcode_name == "new costcode added"
    value ||= TestData.hash[:costcode_val]
  else
    value =costcode_name
  end

  left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
  row_count = left_nav_costcode.total_costcodes.count
  p row_count
  if row_count.to_i != 0
    i=1
    while i<= row_count.to_i
      if left_nav_costcode.cost_code_name(i) == value
        p left_nav_costcode.cost_code_name(i)
        result = left_nav_costcode.cost_code_name(i)
        expect(result).to eql(value)
      end
      i=i+1
    end
  end
end

Then /^[Oo]n [Ll]eft [Nn]avigation [Ee]xpect [Cc]ount [Oo]f (.*) [Ii]s (.*)$/ do |costcode_name,count|

  if costcode_name == "new costcode added"
    value ||= TestData.hash[:costcode_val]
  else
    value =costcode_name
  end

  left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
  row_count = left_nav_costcode.total_costcodes.count
  p row_count
  if row_count.to_i != 0
    i=1
    while i<= row_count.to_i
      if left_nav_costcode.cost_code_name(i) == value
        p left_nav_costcode.cost_code_name(i)
        actual_count=left_nav_costcode.cost_code_count(i)
        expect(actual_count).to eql(count)
      end
      i=i+1
    end
  end
end
