Then /^SDCW: Navigate to home page$/ do

  StampsWebsite::SDCWWebsite.visit
  common_page.stamps_logo.wait_until_present(timeout: 10)

end