Then /^SDCW: navigate to home page$/ do
  StampsWebsite::SDCWWebsite.visit
  stamps_logo = StampsWebsite.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  expect(stamps_logo).to be_present
end