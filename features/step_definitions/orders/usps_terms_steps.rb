Then /^Expect USPS Terms modal appears$/ do
  #logger.step "Expect USPS Terms modal appears"
  actual = stamps.orders.orders_toolbar.usps_intl_terms.is_usps_terms_modal_present
  expect(actual).to be(true)
end

Then /^Click Cancel on USPS Terms modal$/ do
  #logger.step "Click Cancel on USPS Terms modal"
  stamps.orders.orders_toolbar.usps_intl_terms.click_cancel_button
end

Then /^Click I Agree on USPS Terms modal$/ do
  #logger.step "Click I Agree on USPS Terms modal"
  stamps.orders.orders_toolbar.usps_intl_terms.click_i_agree_button
end

Then /^Check Do Not Show Again checkbox in USPS Terms modal$/ do
  #logger.step "Check Do Not Show Again checkbox in USPS Terms modal"
  sleep(2)
  stamps.orders.orders_toolbar.usps_intl_terms.check_dont_show_again_checkbox
  sleep(2)
end
