
Then /^[Ii]n [Cc]ontacts [Gg]rid [Cc]heck [Rr]ow [Hh]eader$/ do
  contacts_grid_body = SdcContacts.contacts_body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  #checkbox = SdcContacts.contacts_column.contacts_header_element(:checkbox)
  checkbox = SdcContacts.contacts_grid_column(:checkbox)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.check  unless checkbox.checked?
  expect(checkbox.checked?).to be(true)
end

Then /^[Ii]n [Cc]ontacts [Gg]rid [Cc]heck [Rr]ow (\d+)$/ do |row|
  contacts_grid_body = SdcContacts.contacts_body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = SdcContacts.contacts_grid_column(:checkbox).contacts_checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.check  unless checkbox.checked?
  expect(checkbox.checked?).to be(true)
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 30)
end

Then /^[Ii]n [Cc]ontacts [Gg]rid [Uu]ncheck [Rr]ow (\d+)$/ do |row|
  contacts_grid_body = SdcContacts.contacts_body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = SdcContacts.contacts_grid_column(:checkbox).contacts_checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.uncheck if checkbox.checked?
  expect(checkbox.checked?).to be(false)
  contacts_detail= SdcContacts.contacts_detail
  expect(contacts_detail.contacts_detail_panel.present?).to be(false)
end

Then /^[Ee]xpect [Nn]ame [Dd]etails for (.*) [Ii]n [Cc]ontacts [Gg]rid [Ii]s [Uu]pdated [Aa]ppropriately$/ do |name|
  contacts_grid_body = SdcContacts.contacts_body
  contacts_grid_body.safe_wait_until_present(timeout: 60)

  col_prefix = SdcContacts.contacts_grid_column(:prefix)
  value_prefix =col_prefix.contacts_text_at_row(1)

  col_first = SdcContacts.contacts_grid_column(:first_name)
  value_first =col_first.contacts_text_at_row(1)

  col_middle = SdcContacts.contacts_grid_column(:middle)
  value_middle =col_middle.contacts_text_at_row(1)

  col_last = SdcContacts.contacts_grid_column(:last_name)
  value_last =col_last.contacts_text_at_row(1)

  words=name.split(" ")
  word_count = words.length
  p word_count
  p words[0]

  case word_count
    when 1
      if words[0] == 'CAPT' || words[0]=='BG'
        expect(value_prefix).to eql words[0]
      else
        expect(value_last).to eql words[0]
      end
    when 2
      if words[0]=='CAPT'
         expect(value_prefix).to eql words[0]
         expect(value_last).to eql words[1]
      else
         expect(value_first).to eql words[0]
         expect(value_last).to eql words[1]
      end
    when 3
      if words[0]== 'CAPT' || words[0]=='ENS'
        expect(value_prefix).to eql words[0]
        expect(value_first).to eql words[word_count-2]
        expect(value_last).to eql words[word_count-1]
        p value_prefix+' - Prefix: ' + words[0]
        p value_first+' - First: ' + words[word_count-2]
        p value_last+' - Last: ' + words[word_count-1]
      else
        expect(value_first).to eql words[0]
        expect(value_middle).to eql words[word_count-2]
        expect(value_last).to eql words[word_count-1]
      end
    else
      if words[0]== 'CAPT' || words[0]== 'BGen.'
        expect(value_prefix).to eql words[0]
        p value_prefix+' - Prefix: ' + words[0]
        i=1
      else
        i = 0
      end
      firstname =""
      while i < word_count-2
        p i
        firstname = firstname + words[i] + " "
        p 'firstname@'+i.to_s+firstname
        i=i+1
      end
      expect(value_last).to eql words[word_count-1]
      expect(value_middle).to eql words[word_count-2]
      expect(value_first).to eql firstname.rstrip
      p value_last+'- Last :' + words[word_count-1]
      p value_middle+'- Middle :'+words[word_count-2]
      p value_first+'- First :' + firstname
  end
end

Then /^[Ee]xpect [Vv]alue [Oo]f (.*) in [Cc]ontacts [Gg]rid is (.*)$/ do |col,value|
  contacts_grid_body = SdcContacts.contacts_body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  if value=='blank'
    new_value = ""
  else
    new_value = value
  end

  case col
      #phone: 'Phone',
      #phone_ext: 'Ext.',
      #city: 'City',
      #state_prv: 'State/Prv',
      #street_address: 'Street Address',
      #postal_code: 'Postal Code',
      #cost_code: 'Postal Code',
      #reference_no: 'Reference #'
  when 'Name'
  column = SdcContacts.contacts_grid_column(:name)
  expect(column).present?
  expect(column.contacts_header_text).to eql('Name')

  when 'Prefix'
    column = SdcContacts.contacts_grid_column(:prefix)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Prefix')

  when 'First Name'
    column = SdcContacts.contacts_grid_column(:first_name)
    expect(column).present?
    expect(column.contacts_header_text).to eql('First Name')

  when 'Middle Name'
    column = SdcContacts.contacts_grid_column(:middle)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Middle')

  when 'Last Name'
    column = SdcContacts.contacts_grid_column(:last_name)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Last Name')

  when 'Suffix'
    column = SdcContacts.contacts_grid_column(:suffix)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Suffix')

  when 'Company'
    column = SdcContacts.contacts_grid_column(:company)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Company')

  when 'Title'
    column = SdcContacts.contacts_grid_column(:title)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Title')

  when 'Department'
    column = SdcContacts.contacts_grid_column(:department)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Department')

  when 'Email'
    column = SdcContacts.contacts_grid_column(:email)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Email')

  when 'Reference Number'
    column = SdcContacts.contacts_grid_column(:reference_no)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Reference #')

  when 'Cost Code'
    column = SdcContacts.contacts_grid_column(:cost_code)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Cost Code')
  end
  p column.contacts_header_text
  actual_value = column.contacts_text_at_row(1)
  p 'given value :' + value
  p 'actual value :' + actual_value
  expect(actual_value).to eql new_value
end
