
Then /^set per page drop down of pagination on contacts toolbar to (\d+)$/ do |number|
  pagination = SdcContacts.contacts_pagination
  pagination.selection_pagination(value: number)
  pagination.perpage_drop_down.click unless pagination.selection.present?
  pagination.selection.safe_click
  expect(pagination.perpage_textbox.text_value).to include(number.to_s)

end

Then /^expect contacts on contacts grid is reflected according to the selected pagination$/ do
  pagination = SdcContacts.contacts_pagination
  all_contacts_count = pagination.all_contacts_count.text_value
  pagination_count =pagination.perpage_textbox.text_value
  total_selected_count = 0
  current_page = pagination.current_page.text_value
  max_pages_text = pagination.max_pages.text_value
  max_pages_text = max_pages_text.split(" ")
  max_pages = max_pages_text[1]
  SdcLogger.info "max_pages #{max_pages}"

  if all_contacts_count.to_i > pagination_count.to_i
    while current_page.to_i <= max_pages.to_i
      #if current_page.to_i < max_pages.to_i
        step 'check row header in contacts grid'
        current_selected_count = pagination.selected_contacts_count.text_value
        step "uncheck row header in contacts grid"
        total_selected_count = total_selected_count+ current_selected_count.to_i
        SdcLogger.info "total grid count #{total_selected_count}"
        SdcLogger.info "remaining grid count #{current_selected_count}"
        if current_page.to_i == 1
          step 'expect next and last page arrows are enabled'
          step 'expect first and prev page arrows are disabled'
          step 'click on the pagination next button of contacts page'
        elsif current_page.to_i == max_pages.to_i
          step 'expect next and last page arrows are disabled'
          step 'expect first and prev page arrows are enabled'
        elsif current_page.to_i < max_pages.to_i
          step 'expect next and last page arrows are enabled'
          step 'expect first and prev page arrows are enabled'
          step 'click on the pagination next button of contacts page'
        end
      #end
      current_page = current_page.to_i + 1
    end

  else
      expect(current_page).to eql(max_pages)
      step 'expect all the page arrows are disabled'
  end

 end

 Then /^expect first and prev page arrows are disabled$/ do
  step 'expect first page is disabled'
  step 'expect prev page is disabled'
end

Then /^expect first and prev page arrows are enabled$/ do
  step 'expect first page is enabled'
  step 'expect prev page is enabled'
end

Then /^expect next and last page arrows are enabled$/ do
  step 'expect next page is enabled'
  step 'expect last page is enabled'
end

Then /^expect (.*) page is enabled$/ do |value|
  pagination = SdcContacts.contacts_pagination
  SdcLogger.info "#{value} Page disabled #{pagination.page_arrow_disabled(value)}"
  expect(pagination.page_arrow_disabled(value)).to be(false)
end

Then /^expect next and last page arrows are disabled$/ do
  step 'expect next page is disabled'
  step 'expect last page is disabled'
end

Then /^expect (.*) page is disabled$/ do|value|
  pagination = SdcContacts.contacts_pagination
  SdcLogger.info "#{value}Page disabled #{pagination.page_arrow_disabled(value)}"
  expect(pagination.page_arrow_disabled(value)).to be(true)
end

Then /^expect all the page arrows are disabled$/ do
  pagination = SdcContacts.contacts_pagination
  SdcLogger.info "First Page disabled #{pagination.page_arrow_disabled('first')}"
  expect(pagination.page_arrow_disabled('first')).to be(true)
  SdcLogger.info "Last Page disabled #{pagination.page_arrow_disabled('last')}"
  expect(pagination.page_arrow_disabled('last')).to be(true)
  SdcLogger.info "Previous Page disabled #{pagination.page_arrow_disabled('prev')}"
  expect(pagination.page_arrow_disabled('prev')).to be(true)
  SdcLogger.info "Next Page disabled #{pagination.page_arrow_disabled('next')}"
  expect(pagination.page_arrow_disabled('next')).to be(true)
end

Then /^click on the pagination next button of contacts page$/ do
  pagination = SdcContacts.contacts_pagination
  pagination.page_next.click
end

Then /^click on the pagination prev button of contacts page$/ do
  pagination = SdcContacts.contacts_pagination
  pagination.page_prev.click
end

Then /^click on the pagination first button of contacts page$/ do
  pagination = SdcContacts.contacts_pagination
  pagination.page_first.click
end

Then /^click on the pagination last button of contacts page$/ do
  pagination = SdcContacts.contacts_pagination
  pagination.page_last.click
end
