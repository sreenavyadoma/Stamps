Then /^SDCW: Navigate to postage online page$/ do
  PostageOnlinePage.visit
  stamps_logo = StampsWebsite.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  expect(stamps_logo).to be_present
end